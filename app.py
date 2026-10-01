from flask import Flask, request, jsonify, send_file
import os
import base64
import uuid
import json

app = Flask(__name__)

# مجلد تخزين السكربتات
STORAGE_DIR = "scripts"
os.makedirs(STORAGE_DIR, exist_ok=True)

# مفتاح التشفير (غيّره لمفتاح سري)
SECRET_KEY = "MySecretKey123456"

def xor_encrypt(text, key):
    """تشفير XOR بسيط"""
    result = ""
    for i, char in enumerate(text):
        result += chr(ord(char) ^ ord(key[i % len(key)]))
    return result

def xor_decrypt(text, key):
    """فك تشفير XOR"""
    return xor_encrypt(text, key)

def protect_script(script_content):
    """حماية السكربت"""
    encoded = base64.b64encode(script_content.encode()).decode()
    encrypted = xor_encrypt(encoded, SECRET_KEY)
    final = base64.b64encode(encrypted.encode('latin-1')).decode()
    return final

def generate_loader(script_id):
    """توليد كود Loader"""
    loader = f'loadstring(game:HttpGet("https://script-protector.onrender.com/api/raw?id={script_id}"))()'
    return loader

@app.route('/')
def home():
    return jsonify({
        "status": "running",
        "service": "Script Protector",
        "version": "1.0"
    })

@app.route('/api/upload', methods=['POST'])
def upload_script():
    """رفع سكربت جديد"""
    try:
        if 'file' not in request.files:
            return jsonify({"error": "No file provided"}), 400
        
        file = request.files['file']
        script_content = file.read().decode('utf-8')
        
        script_id = str(uuid.uuid4())[:8]
        protected = protect_script(script_content)
        
        script_data = {
            "id": script_id,
            "protected": protected,
            "original_name": file.filename
        }
        
        with open(f"{STORAGE_DIR}/{script_id}.json", "w") as f:
            json.dump(script_data, f)
        
        loader = generate_loader(script_id)
        
        return jsonify({
            "success": True,
            "id": script_id,
            "loader": loader,
            "url": f"https://script-protector.onrender.com/api/raw?id={script_id}"
        })
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/api/raw', methods=['GET'])
def get_raw_script():
    """إرجاع السكربت المحمي"""
    script_id = request.args.get('id')
    
    if not script_id:
        return "Invalid request", 400
    
    try:
        with open(f"{STORAGE_DIR}/{script_id}.json", "r") as f:
            script_data = json.load(f)
        
        final = script_data["protected"]
        decoded = base64.b64decode(final).decode('latin-1')
        decrypted = xor_decrypt(decoded, SECRET_KEY)
        original = base64.b64decode(decrypted).decode()
        
        response = f'-- Protected by Script Protector\n'
        response += f'-- ID: {script_id}\n\n'
        response += original
        
        return response
    
    except FileNotFoundError:
        return "Script not found", 404
    except Exception as e:
        return f"Error: {str(e)}", 500

@app.route('/api/list', methods=['GET'])
def list_scripts():
    """قائمة كل السكربتات"""
    scripts = []
    for filename in os.listdir(STORAGE_DIR):
        if filename.endswith('.json'):
            with open(f"{STORAGE_DIR}/{filename}", "r") as f:
                data = json.load(f)
                scripts.append({
                    "id": data["id"],
                    "name": data["original_name"]
                })
    return jsonify({"scripts": scripts})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

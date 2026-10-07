// ═══════════════════════════════════════════════════════════════
// MALEK PROTECT — Backend Server
// ═══════════════════════════════════════════════════════════════

const KV = await Deno.openKv();

const EXECUTORS = [
  "Delta", "Synapse", "Krnl", "Fluxus", "Arceus",
  "Wave", "AWP", "Solara", "Swift", "Xeno", "Codex",
  "Script-Ware", "SirHurt", "Hydrogen", "Evon"
];

function generateId(length = 8) {
  const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
  let out = "";
  for (let i = 0; i < length; i++) {
    out += chars[Math.floor(Math.random() * chars.length)];
  }
  return out;
}

function isExecutor(ua) {
  const lower = ua.toLowerCase();
  return EXECUTORS.some(e => lower.includes(e.toLowerCase()));
}

function jsonResponse(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { "Content-Type": "application/json" },
  });
}

function textResponse(text, status = 200) {
  return new Response(text, {
    status,
    headers: { "Content-Type": "text/plain; charset=utf-8" },
  });
}

Deno.serve(async (req) => {
  const url = new URL(req.url);
  const path = url.pathname;
  const method = req.method;

  if (method === "OPTIONS") {
    return new Response(null, {
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
        "Access-Control-Allow-Headers": "Content-Type, Authorization",
      },
    });
  }

  try {
    // Root
    if (path === "/") {
      return jsonResponse({
        name: "Malek Protect",
        version: "1.0.0",
        status: "online",
      });
    }

    // Raw script endpoint
    if (path.startsWith("/raw/") && method === "GET") {
      const id = path.slice(5);
      if (!id) return textResponse('return "no"');

      const script = await KV.get(["scripts", id]);
      if (!script.value) {
        return textResponse('return "no"');
      }

      const ua = req.headers.get("User-Agent") || "";
      if (!isExecutor(ua)) {
        return textResponse('return "no"');
      }

      script.value.views = (script.value.views || 0) + 1;
      await KV.set(["scripts", id], script.value);

      return textResponse(script.value.code);
    }

    // Create script
    if (path === "/api/scripts" && method === "POST") {
      const body = await req.json().catch(() => null);
      if (!body || !body.name || !body.code) {
        return jsonResponse({ error: "name and code required" }, 400);
      }

      const id = generateId(8);
      const script = {
        id,
        name: body.name,
        code: body.code,
        ownerId: body.ownerId || "anonymous",
        createdAt: Date.now(),
        views: 0,
      };

      await KV.set(["scripts", id], script);

      return jsonResponse({
        success: true,
        id,
        url: `https://${url.hostname}/raw/${id}`,
      });
    }

    // Get script info
    if (path.startsWith("/api/scripts/") && method === "GET") {
      const id = path.slice(13);
      const script = await KV.get(["scripts", id]);
      if (!script.value) {
        return jsonResponse({ error: "not found" }, 404);
      }
      return jsonResponse({
        id: script.value.id,
        name: script.value.name,
        views: script.value.views,
        createdAt: script.value.createdAt,
      });
    }

    // List scripts
    if (path === "/api/scripts" && method === "GET") {
      const scripts = [];
      for await (const entry of KV.list({ prefix: ["scripts"] })) {
        scripts.push({
          id: entry.value.id,
          name: entry.value.name,
          views: entry.value.views,
          createdAt: entry.value.createdAt,
        });
      }
      return jsonResponse({ scripts });
    }

    return jsonResponse({ error: "not found" }, 404);
  } catch (err) {
    console.error("[MALEK PROTECT] Error:", err);
    return jsonResponse({ error: "internal error" }, 500);
  }
});

---
title: "AI Gallery"
description: "AI-generated images — upload straight from the site"
---

<style>
  .gal { display:grid; grid-template-columns:repeat(auto-fill,minmax(240px,1fr)); gap:12px; margin:1rem 0; }
  .gal img { width:100%; height:auto; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,.25); }
  .gal figure { margin:0; }
  .gal figcaption { font-size:.8rem; opacity:.7; text-align:center; margin-top:4px; }
  .upload { border:2px dashed #888; border-radius:8px; padding:1rem; margin:1rem 0; }
  .upload input[type=text] { width:100%; padding:6px; border-radius:6px; border:1px solid #888; margin:4px 0; background:transparent; color:inherit; }
  .upload button { padding:8px 16px; border-radius:6px; border:none; background:#4c6ef5; color:#fff; cursor:pointer; }
  .upload .hint { font-size:.75rem; opacity:.6; }
  .drop { outline:2px dashed #888; outline-offset:-8px; }
</style>

<div class="upload">
  <b>Upload an image</b> — it lands in the repo and the site rebuilds automatically (~1 min).
  <div>
    <input type="text" id="tok" placeholder="GitHub PAT (repo scope) — saved in your browser" />
    <input type="file" id="file" accept="image/*" />
    <button id="up" onclick="doUpload()">Upload</button>
  </div>
  <div class="hint">
    Need a token: GitHub → Settings → Developer settings → Personal access tokens →
    generate with <code>repo</code> scope (or fine-grained: contents:write on this repo).
    Read-only viewing needs no token.
  </div>
  <div id="status"></div>
</div>

<div id="grid" class="gal">Loading gallery…</div>

<script>
const OWNER = "kostyk348", REPO = "kostyk348.github.io", DIR = "static/gallery";
const tok = document.getElementById("tok");
tok.value = localStorage.getItem("gh_tok") || "";
tok.addEventListener("input", () => localStorage.setItem("gh_tok", tok.value));

async function listImages() {
  const r = await fetch(`https://api.github.com/repos/${OWNER}/${REPO}/contents/${DIR}`);
  if (!r.ok) throw new Error("list: " + r.status);
  const items = await r.json();
  return items.filter(i => i.type === "file" && /\.(png|jpe?g|gif|webp|avif)$/i.test(i.name)).sort((a,b) => b.name.localeCompare(a.name));
}

function render(items) {
  const grid = document.getElementById("grid");
  grid.innerHTML = items.map(f => `<figure><a href="${f.download_url}" target="_blank"><img loading="lazy" src="${f.download_url}" alt="${f.name}"></a><figcaption>${f.name}</figcaption></figure>`).join("") || "<p>Empty — upload the first image above.</p>";
}

async function refresh() {
  const st = document.getElementById("status");
  st.textContent = "loading…";
  try { render(await listImages()); st.textContent = ""; }
  catch (e) { st.textContent = "read error: " + e.message; }
}

async function doUpload() {
  const st = document.getElementById("status");
  const file = document.getElementById("file").files[0];
  if (!file) { st.textContent = "pick a file first"; return; }
  const token = tok.value.trim();
  if (!token) { st.textContent = "need a token to upload"; return; }
  const b64 = await new Promise((res, rej) => { const fr = new FileReader(); fr.onload = () => res(fr.result.split(",")[1]); fr.onerror = rej; fr.readAsDataURL(file); });
  const ts = Date.now();
  const name = ts + "-" + file.name.replace(/[^a-zA-Z0-9._-]/g, "_").toLowerCase();
  st.textContent = "uploading…";
  const r = await fetch(`https://api.github.com/repos/${OWNER}/${REPO}/contents/${DIR}/${name}`, {
    method: "PUT",
    headers: { "Authorization": "Bearer " + token, "Accept": "application/vnd.github+json", "Content-Type": "application/json" },
    body: JSON.stringify({ message: "gallery: add " + name, content: b64, branch: "main" })
  });
  const j = await r.json().catch(() => ({}));
  if (!r.ok) { st.textContent = "upload failed (" + r.status + "): " + (j.message || "check token scope"); return; }
  st.textContent = "uploaded — site rebuilds in ~1 min. Auto-refreshing…";
  document.getElementById("file").value = "";
  let tries = 0;
  const poll = setInterval(async () => {
    tries++;
    try { render(await listImages()); st.textContent = "done. rebuild finished."; clearInterval(poll); }
    catch (e) { if (tries > 8) { st.textContent = "uploaded, but rebuild check failed (" + e.message + ") — reload page later."; clearInterval(poll); } }
  }, 8000);
}

refresh();
</script>

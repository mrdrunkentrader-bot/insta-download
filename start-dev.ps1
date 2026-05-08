# ReelSave Pro — One-Command Dev Starter
# Run this script to start both Worker and Frontend in separate terminals

$projectRoot = "c:\Users\anupa\Downloads\reelsave-pro-master\reelsave-pro-master"

# Set PATH for Node/pnpm
$env:Path += ";C:\Program Files\nodejs;C:\Users\anupa\AppData\Local\pnpm"

Write-Host "`n" -ForegroundColor Green
Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║          ReelSave Pro - Local Development Startup              ║" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Green
Write-Host "`n" -ForegroundColor Green

# Start Worker in new terminal
Write-Host "🚀 Starting Cloudflare Worker (8787)..." -ForegroundColor Cyan
Start-Process -FilePath "powershell" -ArgumentList "-NoExit", "-Command", "cd '$projectRoot\workers\downloader'; `$env:Path += ';C:\Program Files\nodejs;C:\Users\anupa\AppData\Local\pnpm'; pnpm wrangler dev"

# Wait 4 seconds for worker to start
Write-Host "⏳ Waiting for Worker to initialize..." -ForegroundColor Yellow
Start-Sleep -Seconds 4

# Start Frontend in new terminal
Write-Host "🚀 Starting Next.js Frontend (3000)..." -ForegroundColor Cyan
Start-Process -FilePath "powershell" -ArgumentList "-NoExit", "-Command", "cd '$projectRoot\apps\web'; `$env:Path += ';C:\Program Files\nodejs;C:\Users\anupa\AppData\Local\pnpm'; pnpm dev"

Write-Host "`n" -ForegroundColor Green
Write-Host "✅ Both services starting in new terminals...`n" -ForegroundColor Green
Write-Host "📍 Frontend:  http://localhost:3000  (or 3001/3002 if busy)" -ForegroundColor Yellow
Write-Host "📍 Worker:    http://127.0.0.1:8787" -ForegroundColor Yellow
Write-Host "`n💡 Close the new terminal windows when you're done developing.`n" -ForegroundColor Cyan

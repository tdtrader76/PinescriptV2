Write-Host "Creando estructura de directorios..." -ForegroundColor Green

# Crear todos los directorios
New-Item -ItemType Directory -Force -Path "docs\official-documentation"
New-Item -ItemType Directory -Force -Path "docs\tutorials"
New-Item -ItemType Directory -Force -Path "docs\migration-guides"
New-Item -ItemType Directory -Force -Path "docs\api-reference"

New-Item -ItemType Directory -Force -Path "code-examples\indicators"
New-Item -ItemType Directory -Force -Path "code-examples\strategies"
New-Item -ItemType Directory -Force -Path "code-examples\utilities"
New-Item -ItemType Directory -Force -Path "code-examples\templates"

New-Item -ItemType Directory -Force -Path "resources\courses"
New-Item -ItemType Directory -Force -Path "resources\books"
New-Item -ItemType Directory -Force -Path "resources\communities"
New-Item -ItemType Directory -Force -Path "resources\tools"

New-Item -ItemType Directory -Force -Path "collections\awesome-lists"
New-Item -ItemType Directory -Force -Path "collections\github-repos"
New-Item -ItemType Directory -Force -Path "collections\community-scripts"

New-Item -ItemType Directory -Force -Path "automation\trading-bots"
New-Item -ItemType Directory -Force -Path "automation\alert-systems"
New-Item -ItemType Directory -Force -Path "automation\integrations"

Write-Host "Estructura creada con exito!" -ForegroundColor Green
Write-Host ""
Write-Host "Carpetas creadas:" -ForegroundColor Yellow
Get-ChildItem -Directory
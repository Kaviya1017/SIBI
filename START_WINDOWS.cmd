@echo off
setlocal
cd /d "%~dp0"
title Sibi Sports Club - Start Website
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is not installed. Install Node.js LTS from https://nodejs.org/ then try again.
  start "" "https://nodejs.org/"
  pause
  exit /b 1
)
set "ADMIN_NAME=Administrator"
set "ADMIN_EMAIL=admin@elevate.local"
set "ADMIN_PASSWORD=admin@2026"
set "SESSION_SECRET=ElevateGym_2026_RandomSecret_8392_Xk7pLmQ5"
set "APP_TIMEZONE=Asia/Kolkata"
echo Preparing dependencies...
call npm install --omit=dev
if errorlevel 1 (echo Dependency installation failed.& pause & exit /b 1)
echo Starting Sibi Sports Club at http://localhost:3000
start "Sibi Sports Club browser" /min cmd /c "timeout /t 3 /nobreak ^>nul ^& start "" http://localhost:3000"
node server.js
pause

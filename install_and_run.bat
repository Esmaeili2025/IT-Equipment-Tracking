@echo off
title IT Equipment Tracking System - Installer & Runner
color 0B
echo =======================================================================
echo     IT Equipment Tracking System - Iran Omran Azarestan (Bushehr)
echo     سامانه مدیریت و شناسنامه تجهیزات واحد فناوری اطلاعات و ارتباطات
echo =======================================================================
echo.

:: Check if Node.js is installed
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed on this system!
    echo Please download and install Node.js (LTS Version) from:
    echo https://nodejs.org/
    echo.
    echo After installing Node.js, please run this file again.
    echo.
    pause
    exit /b 1
)

echo [1/3] Node.js detected. Installing project dependencies (npm install)...
echo Please wait, this may take a minute depending on your internet speed...
echo.
call npm install

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Dependency installation failed! Please check your internet connection.
    pause
    exit /b 1
)

echo.
echo [2/3] Building the production-optimized application (npm run build)...
call npm run build

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Build process failed!
    pause
    exit /b 1
)

echo.
echo [3/3] Starting the local production server on http://localhost:3030 ...
echo The application will be opened automatically in your default browser shortly.
echo To close the application, simply close this command prompt window.
echo.

:: Open browser automatically after a short delay
timeout /t 2 >nul
start "" http://localhost:3030

:: Set local port and run the custom Express server
set PORT=3030
call npm start

pause

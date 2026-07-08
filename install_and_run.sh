#!/bin/bash

clear
echo "======================================================================="
echo "    IT Equipment Tracking System - Iran Omran Azarestan (Bushehr)"
echo "    سامانه مدیریت و شناسنامه تجهیزات واحد فناوری اطلاعات و ارتباطات"
echo "======================================================================="
echo

# Check if Node.js is installed
if ! command -v node &> /dev/null
then
    echo "[ERROR] Node.js is not installed on this system!"
    echo "Please download and install Node.js (LTS Version) from:"
    echo "https://nodejs.org/"
    echo
    echo "After installing Node.js, please run this script again."
    echo
    exit 1
fi

echo "[1/3] Node.js detected. Installing project dependencies (npm install)..."
echo "Please wait, this may take a minute depending on your internet speed..."
echo
npm install

if [ $? -ne 0 ]; then
    echo
    echo "[ERROR] Dependency installation failed! Please check your internet connection."
    exit 1
fi

echo
echo "[2/3] Building the production-optimized application (npm run build)..."
npm run build

if [ $? -ne 0 ]; then
    echo
    echo "[ERROR] Build process failed!"
    exit 1
fi

echo
echo "[3/3] Starting the local production server on http://localhost:3030 ..."
echo "The application will be opened automatically in your default browser shortly."
echo "To close the application, simply close this terminal window."
echo

# Open browser automatically after a short delay
sleep 2
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:3030
elif command -v open &> /dev/null; then
    open http://localhost:3030
fi

# Set local port and run the custom Express server
export PORT=3030
npm start

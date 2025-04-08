@echo off
setlocal enabledelayedexpansion

:: -------------------------------
:: Step 1: Check if Python Exists
:: -------------------------------
echo Checking for Python installation...

where python >nul 2>&1
if %errorlevel% NEQ 0 (
    echo  Python not found. Downloading and installing Python 3.10.11...

    curl -o python-installer.exe https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe

    start /wait python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
    del python-installer.exe

    echo  Python installed successfully.
) else (
    echo  Python is already installed.
)

:: -------------------------------
:: Step 2: Create Virtual Environment
:: -------------------------------
echo.
echo  Creating virtual environment in "venv" folder...
python -m venv venv

:: -------------------------------
:: Step 3: Activate Virtual Environment
:: -------------------------------
echo.
echo  Activating virtual environment...
call venv\Scripts\activate.bat

:: -------------------------------
:: Step 4: Install Requirements
:: -------------------------------
echo.
echo  Installing packages from requirements.txt...
pip install --upgrade pip
pip install -r requirements.txt

:: -------------------------------
:: Step 5: Run Your Bot (Start.bat)
:: -------------------------------
echo.
echo  Launching your bot via Start.bat...
call 3_Start.bat

echo.
echo  All done! Bot is running.
pause

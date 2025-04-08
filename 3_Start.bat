@echo off
cd /d "%~dp0"
waitress-serve --host=0.0.0.0 --port=9332 Tradingview_SmartAPI_Algo_Bot:app
pause
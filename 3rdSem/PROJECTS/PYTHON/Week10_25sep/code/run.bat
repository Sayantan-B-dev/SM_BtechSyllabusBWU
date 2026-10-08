@echo off
REM One-command run for both projects: Calculator first, then Hospital.
REM Works from any folder. To move from Calculator to Hospital, type 0 (do not close the window).
cd /d "%~dp0"
echo ===== CALCULATOR (type 0 to exit and continue to Hospital) =====
python Calculator\main.py
echo.
echo ===== HOSPITAL (type 0 to exit) =====
python Hospital\main.py
echo.
pause

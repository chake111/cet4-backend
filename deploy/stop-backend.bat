@echo off
REM ============================================================
REM CET-4 Platform — Backend Stop Script (Windows)
REM Usage: stop-backend.bat
REM ============================================================

echo Stopping cet4-backend ...

REM Find and kill the Java process running cet4-backend
for /f "tokens=1" %%p in ('jps -l ^| findstr "cet4-backend"') do (
    echo Killing PID %%p
    taskkill /PID %%p /F
)

if errorlevel 1 (
    echo No cet4-backend process found.
) else (
    echo cet4-backend stopped.
)

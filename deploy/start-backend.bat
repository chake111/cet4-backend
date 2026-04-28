@echo off
REM ============================================================
REM CET-4 Platform — Backend Startup Script (Windows)
REM Usage: start-backend.bat
REM ============================================================

setlocal

set JAR_DIR=%~dp0..\target
set JAR_NAME=cet4-backend-0.0.1-SNAPSHOT.jar
set ENV_FILE=%~dp0..\..\deploy\.env.prod

REM ---------- load environment variables ----------
if exist "%ENV_FILE%" (
    echo Loading environment from %ENV_FILE% ...
    for /f "usebackq tokens=1,* delims==" %%a in ("%ENV_FILE%") do (
        REM skip comments and empty lines
        echo %%a | findstr /r "^#" >nul 2>&1
        if errorlevel 1 (
            if not "%%a"=="" (
                set "%%a=%%b"
            )
        )
    )
) else (
    echo WARNING: %ENV_FILE% not found. Using existing environment variables.
)

REM ---------- check jar ----------
if not exist "%JAR_DIR%\%JAR_NAME%" (
    echo ERROR: %JAR_DIR%\%JAR_NAME% not found. Run 'mvn clean package' first.
    exit /b 1
)

REM ---------- check required vars ----------
if not defined JWT_SECRET (
    echo ERROR: JWT_SECRET is not set. Set it in %ENV_FILE% or as environment variable.
    exit /b 1
)

if not defined DB_PASSWORD (
    echo ERROR: DB_PASSWORD is not set. Set it in %ENV_FILE% or as environment variable.
    exit /b 1
)

REM ---------- build java opts ----------
if not defined JAVA_OPTS set JAVA_OPTS=-Xms256m -Xmx512m

REM ---------- start ----------
echo Starting cet4-backend [profile=prod] ...
cd /d "%JAR_DIR%"
java %JAVA_OPTS% -Dspring.profiles.active=prod -DJWT_SECRET=%JWT_SECRET% -DDB_PASSWORD=%DB_PASSWORD% -DDEEPSEEK_API_KEY=%DEEPSEEK_API_KEY% -jar %JAR_NAME%

endlocal

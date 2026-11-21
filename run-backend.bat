@echo off
title MediSlot - Spring Boot Backend Server (Port 8080)
color 0a
echo =====================================================================
echo   MediSlot - Java Spring Boot Backend Server
echo   API Base URL: http://localhost:8080/api
echo =====================================================================

if "%JAVA_HOME%"=="" (
    if exist "C:\Program Files\Java\jdk-23" (
        set "JAVA_HOME=C:\Program Files\Java\jdk-23"
    )
)
set "PATH=%JAVA_HOME%\bin;%PATH%"

set "JAR_FILE=%~dp0backend\target\medislot-backend-1.0.0.jar"

if exist "%JAR_FILE%" (
    echo Starting compiled MediSlot Spring Boot JAR...
    java -jar "%JAR_FILE%"
) else (
    echo Building and starting with Maven...
    cd "%~dp0backend"
    call mvnw.cmd spring-boot:run
)
pause

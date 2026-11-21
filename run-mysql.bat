@echo off
title MediSlot - Dedicated MySQL Database Server (Port 3307)
echo =====================================================================
echo   Starting MediSlot Dedicated MySQL Server on Port 3307...
echo =====================================================================
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqld.exe" --port=3307 --datadir="%~dp0database\mysql-data" --console
pause

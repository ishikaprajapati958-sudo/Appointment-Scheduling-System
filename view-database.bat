@echo off
title MediSlot - Live MySQL Database Viewer
color 0b
echo =====================================================================
echo   MediSlot - Live MySQL Database Query (medislot_db)
echo   Connected to MySQL 8.0 on Port 3307
echo =====================================================================
echo.
echo [1] RECENTLY REGISTERED USERS IN DATABASE:
echo ---------------------------------------------------------------------
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -h 127.0.0.1 -P 3307 -u root medislot_db -e "SELECT id, name, email, role, phone, blood_group, created_at FROM users ORDER BY id DESC;"
echo.
echo ---------------------------------------------------------------------
echo [2] BOOKED APPOINTMENTS IN DATABASE:
echo ---------------------------------------------------------------------
"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -h 127.0.0.1 -P 3307 -u root medislot_db -e "SELECT id, appointment_number, patient_name, appointment_date, appointment_time, consultation_type, status FROM appointments ORDER BY id DESC;"
echo.
echo =====================================================================
pause

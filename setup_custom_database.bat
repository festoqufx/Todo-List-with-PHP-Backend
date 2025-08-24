@echo off
echo Setting up MySQL database for Todo application...

REM Ask for XAMPP location
set /p XAMPP_PATH="Enter your XAMPP installation path (e.g., D:\xampp): "

REM Path to MySQL executable
set MYSQL_PATH=%XAMPP_PATH%\mysql\bin\mysql.exe

REM Database credentials
set /p DB_USER="Enter MySQL username (default is root): "
if "%DB_USER%"=="" set DB_USER=root

set /p DB_PASSWORD="Enter MySQL password (press Enter if none): "

REM Check if MySQL executable exists
if not exist "%MYSQL_PATH%" (
    echo MySQL executable not found at %MYSQL_PATH%
    echo Please make sure XAMPP is installed and MySQL path is correct.
    pause
    exit /b 1
)

REM Create a temporary SQL file
echo -- Create database > temp_init.sql
echo CREATE DATABASE IF NOT EXISTS todo_db; >> temp_init.sql
echo USE todo_db; >> temp_init.sql
echo. >> temp_init.sql
echo -- Create todos table >> temp_init.sql
echo CREATE TABLE IF NOT EXISTS todos ( >> temp_init.sql
echo   id INT AUTO_INCREMENT PRIMARY KEY, >> temp_init.sql
echo   text VARCHAR(255) NOT NULL, >> temp_init.sql
echo   completed BOOLEAN DEFAULT FALSE, >> temp_init.sql
echo   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP >> temp_init.sql
echo ); >> temp_init.sql
echo. >> temp_init.sql
echo -- Sample data >> temp_init.sql
echo INSERT INTO todos (text, completed) VALUES >> temp_init.sql
echo ('Learn React', TRUE), >> temp_init.sql
echo ('Build MySQL integration', FALSE), >> temp_init.sql
echo ('Deploy Todo App', FALSE); >> temp_init.sql

REM Execute SQL file
if "%DB_PASSWORD%"=="" (
    "%MYSQL_PATH%" -u%DB_USER% < temp_init.sql
) else (
    "%MYSQL_PATH%" -u%DB_USER% -p%DB_PASSWORD% < temp_init.sql
)

REM Check if the command succeeded
if %ERRORLEVEL% EQU 0 (
    echo Database setup completed successfully.
) else (
    echo Failed to set up the database. Please check your MySQL credentials and try again.
)

REM Clean up
del temp_init.sql

echo.
echo If the setup was successful, you can now access the API at:
echo http://localhost/todo_api/todos.php
echo.

pause

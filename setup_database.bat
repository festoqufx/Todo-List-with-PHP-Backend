@echo off
echo Setting up MySQL database for Todo application...

REM Path to MySQL executable (adjust if needed)
set MYSQL_PATH=C:\xampp\mysql\bin\mysql.exe

REM Database credentials
set DB_USER=root
set DB_PASSWORD=

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
echo -- Insert some sample todos >> temp_init.sql
echo INSERT INTO todos (text, completed) VALUES >> temp_init.sql
echo ('Learn React', TRUE), >> temp_init.sql
echo ('Build MySQL integration', FALSE), >> temp_init.sql
echo ('Deploy Todo App', FALSE); >> temp_init.sql

REM Execute SQL commands
echo Executing SQL commands...
"%MYSQL_PATH%" -u %DB_USER% < temp_init.sql

REM Clean up
del temp_init.sql

echo Database setup complete!
echo.
echo Please access your Todo API at http://localhost/todo_api/todos.php
echo.
pause

@echo off
echo Copying PHP API files to XAMPP htdocs...

REM Check if XAMPP is installed in standard location
if exist "C:\xampp\htdocs" (
    xcopy /E /I /Y "php_api" "C:\xampp\htdocs\todo_api"
    echo Files copied to C:\xampp\htdocs\todo_api
    echo Please visit http://localhost/todo_api/todos.php to test the API
) else (
    echo XAMPP not found in standard location.
    echo Please manually copy the php_api folder to your web server's document root.
)

pause

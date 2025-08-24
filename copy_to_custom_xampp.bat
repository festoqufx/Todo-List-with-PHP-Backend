@echo off
echo Copying PHP API files to your XAMPP htdocs...

REM Ask for XAMPP location
set /p XAMPP_PATH="Enter your XAMPP installation path (e.g., D:\xampp): "

REM Check if htdocs exists in the provided path
if exist "%XAMPP_PATH%\htdocs" (
    xcopy /E /I /Y "php_api" "%XAMPP_PATH%\htdocs\todo_api"
    echo Files copied to %XAMPP_PATH%\htdocs\todo_api
    echo Please visit http://localhost/todo_api/todos.php to test the API
) else (
    echo htdocs folder not found in %XAMPP_PATH%.
    echo Please make sure you entered the correct XAMPP installation path.
)

pause

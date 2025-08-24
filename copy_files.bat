@echo off
echo Copying PHP API files to XAMPP htdocs...

REM XAMPP location provided by user
set XAMPP_PATH=D:\Program Files

REM Check if htdocs exists in the provided path
if exist "%XAMPP_PATH%\htdocs" (
    xcopy /E /I /Y "php_api" "%XAMPP_PATH%\htdocs\todo_api"
    echo Files copied to %XAMPP_PATH%\htdocs\todo_api
    echo Please visit http://localhost/todo_api/todos.php to test the API
) else (
    echo htdocs folder not found in %XAMPP_PATH%.
    echo Please check that this is the correct XAMPP installation path.
)

pause

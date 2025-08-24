# Complete Setup Guide: React Todo App with PHP & MySQL

This guide will help you set up the Todo application with PHP and MySQL on your Windows machine.

## Part 1: Setting Up XAMPP

### 1. Download and Install XAMPP

1. Download XAMPP from [https://www.apachefriends.org/download.html](https://www.apachefriends.org/download.html)
2. Choose the Windows version and download the installer
3. Run the installer and follow the prompts
4. Minimum components to select:
   - Apache
   - MySQL
   - PHP
   - phpMyAdmin

### 2. Start XAMPP Services

1. Open the XAMPP Control Panel
2. Start Apache and MySQL by clicking the "Start" buttons next to them
3. Make sure both services show a green background, indicating they're running

## Part 2: Setting Up the PHP Backend

### 1. Copy PHP Files to XAMPP

**Option 1: Using the batch file**
1. Double-click the `copy_to_xampp.bat` file in your project folder
2. This will copy all necessary PHP files to C:\xampp\htdocs\todo_api

**Option 2: Manual copy**
1. Create a folder named `todo_api` in `C:\xampp\htdocs\`
2. Copy all files from the `php_api` folder to `C:\xampp\htdocs\todo_api`

### 2. Set Up the Database

**Option 1: Using the batch file**
1. Double-click the `setup_database.bat` file in your project folder
2. This will create the database and table structure automatically

**Option 2: Manual setup**
1. Open your web browser and go to: `http://localhost/phpmyadmin`
2. Click on "Import" in the top menu
3. Click "Browse" and select the `setup.sql` file from your `php_api` folder
4. Click "Go" to execute the SQL script

### 3. Configure Database Connection

If needed, edit the database connection details in `C:\xampp\htdocs\todo_api\db_connect.php`:
```php
$servername = "localhost";
$username = "root"; // Default phpMyAdmin username
$password = ""; // Default is empty, change if needed
$dbname = "todo_db";
```

## Part 3: Testing the PHP Backend

### 1. Verify PHP is Working

1. Open your web browser and visit: `http://localhost/todo_api/phpinfo.php`
2. If you see PHP information displayed, PHP is working correctly

### 2. Test the API

1. Open your web browser and visit: `http://localhost/todo_api/todos.php`
2. You should see a JSON response with sample todo items like:
   ```json
   [
     {"id":1,"text":"Learn React","completed":true,"created_at":"2023-08-25 10:00:00"},
     {"id":2,"text":"Build MySQL integration","completed":false,"created_at":"2023-08-25 10:00:00"},
     {"id":3,"text":"Deploy Todo App","completed":false,"created_at":"2023-08-25 10:00:00"}
   ]
   ```

### 3. Use the HTML Test Page

1. Open your web browser and visit: `http://localhost/todo_api/test_page.html`
2. This page provides a complete interface to:
   - View all todos
   - Add new todos
   - Mark todos as complete/incomplete
   - Delete todos
3. Test all CRUD operations to verify the backend is working correctly

## Part 4: Troubleshooting

### Common Issues and Solutions

#### 1. XAMPP Ports in Use

**Problem**: Apache or MySQL won't start because ports are already in use.
**Solution**: 
1. Open XAMPP Control Panel
2. Click "Config" next to Apache
3. Select "httpd.conf"
4. Change `Listen 80` to another port (e.g., `Listen 8080`)
5. Save and restart Apache

#### 2. Database Connection Failure

**Problem**: The API returns database connection errors.
**Solution**:
1. Verify MySQL is running in XAMPP Control Panel
2. Check database credentials in `db_connect.php`
3. Make sure the `todo_db` database exists in phpMyAdmin

#### 3. CORS Issues

**Problem**: Your browser blocks API requests due to CORS policy.
**Solution**: The PHP files already include CORS headers. If you're still having issues:
1. Verify the headers are present in `db_connect.php`:
   ```php
   header("Access-Control-Allow-Origin: *");
   header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
   header("Access-Control-Allow-Headers: Content-Type, Authorization");
   ```
2. Make sure your browser is allowed to make cross-origin requests

## Part 5: Next Steps

### Working with the React Frontend

If you want to continue developing the React frontend:

1. In the todo project folder, run:
   ```
   npm install
   ```

2. Update the API URL in `src/TodoApp.jsx` if you changed the port:
   ```javascript
   // Change if you're using a different port
   const API_URL = "http://localhost/todo_api"; 
   // For port 8080, use "http://localhost:8080/todo_api"
   ```

3. Start the development server:
   ```
   npm start
   ```

### Creating a New React Project

If the webpack setup is causing issues, you can create a fresh React app:

1. Create a new React app:
   ```
   npx create-react-app my-todo-app
   cd my-todo-app
   ```

2. Install Tailwind CSS:
   ```
   npm install -D tailwindcss postcss autoprefixer
   npx tailwindcss init -p
   ```

3. Configure Tailwind by updating `tailwind.config.js`:
   ```javascript
   module.exports = {
     content: ["./src/**/*.{js,jsx,ts,tsx}"],
     theme: {
       extend: {},
     },
     plugins: [],
   }
   ```

4. Add Tailwind to CSS in `src/index.css`:
   ```css
   @tailwind base;
   @tailwind components;
   @tailwind utilities;
   ```

5. Copy the `TodoApp.jsx` file from the original project and update the imports as needed

6. Update your `App.js` to use the TodoApp component

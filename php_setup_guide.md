# Todo App with PHP Backend - Setup Instructions

Follow these steps to set up the Todo application with PHP and MySQL:

## 1. Install XAMPP

1. Download and install XAMPP from [https://www.apachefriends.org/download.html](https://www.apachefriends.org/download.html)
2. During installation, make sure to select at least:
   - Apache
   - MySQL
   - PHP
3. After installation, start the XAMPP Control Panel and start Apache and MySQL services

## 2. Copy the PHP API files to XAMPP htdocs

Run the `copy_to_xampp.bat` script to automatically copy the PHP API files to your XAMPP htdocs directory.

Alternatively, manually copy the `php_api` folder to:
```
C:\xampp\htdocs\todo_api
```

## 3. Set up the MySQL database

Run the `setup_database.bat` script to create the database and table structure.

Alternatively, open phpMyAdmin (http://localhost/phpmyadmin) and import the `php_api/setup.sql` file.

## 4. Test the PHP API

Open a web browser and visit:
```
http://localhost/todo_api/todos.php
```

You should see a JSON response with the sample todos.

## 5. Use the HTML test page

1. Copy the `test_page.html` file to the XAMPP htdocs directory:
   ```
   C:\xampp\htdocs\todo_api\test_page.html
   ```

2. Open in your browser:
   ```
   http://localhost/todo_api/test_page.html
   ```

This standalone HTML page will allow you to test the Todo application with the PHP backend without needing to fix the React webpack issues.

## Troubleshooting

1. **Database Connection Issues:**
   - Check that MySQL is running
   - Verify your database credentials in `db_connect.php`

2. **API Not Working:**
   - Check Apache error logs in XAMPP
   - Make sure PHP is working properly with `phpinfo.php`
   
3. **CORS Issues:**
   - The PHP API files include CORS headers for local development
   - If you're using a different domain, you may need to adjust the headers

## Next Steps

Once the PHP backend is working properly, you can proceed to fix the React frontend:

1. Create a fresh React app with `create-react-app`
2. Copy over the modified `TodoApp.jsx` file
3. Update the API URL to point to your PHP backend

## Instructions to Set Up PHP Backend for Todo List App

### 1. Set up the PHP API

1. Copy the `php_api` folder to your web server's document root (e.g., `htdocs` for XAMPP or `www` for WAMP).
   - If your document root is different from `C:/xampp/htdocs`, make sure to adjust the folder location accordingly.

2. Create the MySQL database:
   - Open phpMyAdmin (typically at http://localhost/phpmyadmin)
   - Create a new database named `todo_db` (or import the `setup.sql` file)
   - If you have a different username/password for MySQL, update them in `db_connect.php`

### 2. Configure the React Frontend

1. In `TodoApp.jsx`, make sure the `API_URL` points to the correct location of your PHP API:
   ```jsx
   const API_URL = "http://localhost/react.js/todo/php_api";
   ```
   - Adjust this URL based on your local web server's configuration

### 3. Run the Application

1. Start your web server (XAMPP, WAMP, etc.)
2. Make sure MySQL is running
3. Start the React development server:
   ```
   npm start
   ```
4. Open http://localhost:3000 in your browser

### Troubleshooting

- If you see CORS errors in the console, make sure the PHP API has the correct CORS headers
- Check that the database connection parameters in `db_connect.php` match your MySQL setup
- Verify that your web server can execute PHP files properly

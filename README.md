# React Todo List with PHP Backend

## Important Files and Setup

1. **PHP Backend Files** (in `/php_api` folder):
   - `db_connect.php` - Database connection setup
   - `todos.php` - API endpoint for GET (listing all todos) and POST (creating new todo)
   - `todo.php` - API endpoint for PUT (updating) and DELETE (removing) a specific todo
   - `setup.sql` - SQL script to create database and table

2. **How to Use**:

   **Setup the PHP Backend:**
   1. Copy the `php_api` folder to your web server's document root (e.g., XAMPP's htdocs)
   2. Run the SQL script in phpMyAdmin to create the database and table
   3. Update the database credentials in `db_connect.php` if needed

   **Access the API Directly:**
   - GET todos: http://localhost/path-to-php_api/todos.php
   - POST new todo: Send a POST request to http://localhost/path-to-php_api/todos.php
   - UPDATE todo: Send a PUT request to http://localhost/path-to-php_api/todo.php?id=1
   - DELETE todo: Send a DELETE request to http://localhost/path-to-php_api/todo.php?id=1

3. **API Endpoints:**
   - GET `/todos.php` - List all todos
   - POST `/todos.php` - Create a new todo
   - PUT `/todo.php?id={id}` - Update a todo's completed status
   - DELETE `/todo.php?id={id}` - Delete a todo

## Integration with the React Frontend

The React frontend (`TodoApp.jsx`) has been updated to connect to these PHP endpoints.

To fix webpack issues, you might need to:
1. Delete node_modules folder
2. Run `npm install` to reinstall dependencies
3. If that doesn't work, create a new React app with `create-react-app` and copy over these files

## Testing the PHP Backend

You can test the PHP API with tools like Postman or using simple curl commands:

```bash
# Get all todos
curl http://localhost/path-to-php_api/todos.php

# Add a new todo
curl -X POST http://localhost/path-to-php_api/todos.php \
  -H "Content-Type: application/json" \
  -d '{"text": "New task from curl"}'

# Update a todo (toggle completed)
curl -X PUT http://localhost/path-to-php_api/todo.php?id=1 \
  -H "Content-Type: application/json" \
  -d '{"completed": true}'

# Delete a todo
curl -X DELETE http://localhost/path-to-php_api/todo.php?id=1
```

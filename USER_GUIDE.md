# Todo Application User Guide

This guide explains how to use the Todo application after you've completed the setup.

## Using the Standalone HTML Interface

The Todo application includes a standalone HTML interface that works directly with the PHP backend, without needing the React frontend.

### Accessing the Interface

1. Make sure XAMPP is running with both Apache and MySQL services started
2. Open your web browser and navigate to:
   ```
   http://localhost/todo_api/test_page.html
   ```

### Features

The interface provides all the essential todo list functionality:

#### 1. Viewing Todos

- All your todos are displayed in a list
- Each todo shows:
  - The todo text
  - A checkbox to mark it complete/incomplete
  - A delete button

#### 2. Adding New Todos

1. Type your task in the input field at the top
2. Press Enter or click "Add Todo"
3. The new todo will appear at the top of the list

#### 3. Marking Todos as Complete/Incomplete

1. Click the checkbox next to a todo
2. The todo will be visually marked as complete/incomplete
3. The status is saved to the database immediately

#### 4. Deleting Todos

1. Click the "Delete" button next to a todo
2. The todo will be removed from the list and the database

#### 5. Error Handling

- If there's an error connecting to the database, an error message will be displayed
- Failed operations will show error alerts

## API Reference

If you're a developer wanting to interact with the API directly:

### Base URL

The base URL for all API endpoints is:
```
http://localhost/todo_api/
```

### Endpoints

#### 1. GET /todos.php

Retrieves all todos.

**Response**:
```json
[
  {
    "id": 1,
    "text": "Learn React",
    "completed": true,
    "created_at": "2023-08-25 10:00:00"
  },
  {
    "id": 2,
    "text": "Build MySQL integration",
    "completed": false,
    "created_at": "2023-08-25 10:00:00"
  }
]
```

#### 2. POST /todos.php

Creates a new todo.

**Request Body**:
```json
{
  "text": "New todo item"
}
```

**Response**:
```json
{
  "id": 4,
  "text": "New todo item",
  "completed": false,
  "created_at": "2023-08-25 15:30:45"
}
```

#### 3. PUT /todo.php?id={id}

Updates a todo's completed status.

**Request Body**:
```json
{
  "completed": true
}
```

**Response**:
```json
{
  "id": 2,
  "text": "Build MySQL integration",
  "completed": true,
  "created_at": "2023-08-25 10:00:00"
}
```

#### 4. DELETE /todo.php?id={id}

Deletes a todo.

**Response**:
```json
{
  "message": "Todo deleted successfully",
  "id": 2
}
```

## Using the React Frontend

If you've set up the React frontend:

1. Start the development server:
   ```
   npm start
   ```

2. Open your browser to:
   ```
   http://localhost:3000
   ```

The React frontend provides the same functionality as the standalone HTML interface but with a more modern user experience.

## Common Issues

### 1. Todo list is empty

- Check that MySQL service is running in XAMPP
- Verify the database connection parameters in `db_connect.php`
- Make sure the `todo_db` database exists and has the `todos` table

### 2. Changes not saving

- Check browser console for any API errors
- Verify that the API URL is correctly set
- Make sure PHP has write permissions to the database

### 3. API errors in browser console

- Check that all PHP files have correct permissions
- Verify that Apache is running in XAMPP
- Look in XAMPP's error logs for PHP errors

## Advanced Features

### Filtering Todos

To be implemented in future versions:
- Filter by completed/active status
- Search todos by text

### Due Dates

To be implemented in future versions:
- Add due dates to todos
- Sort by due date
- Get notifications for upcoming due dates

## Feedback and Support

If you encounter issues or have suggestions for improvements:

1. Check the troubleshooting section in the setup guides
2. Review the API documentation for correct usage
3. Make sure your environment meets all requirements

Thank you for using the Todo application!

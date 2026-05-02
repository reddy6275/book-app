<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library Management - Books</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; color: #333; }
        h1 { color: #2c3e50; text-align: center; }
        .container { max-width: 900px; margin: 0 auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #3498db; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .btn { display: inline-block; padding: 10px 15px; color: white; background-color: #2ecc71; text-decoration: none; border-radius: 4px; font-weight: bold; }
        .btn:hover { background-color: #27ae60; }
        .btn-edit { background-color: #f39c12; padding: 5px 10px; }
        .btn-edit:hover { background-color: #e67e22; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Library Management System</h1>
        <a href="/books/new" class="btn">Add New Book</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>ISBN</th>
                    <th>Genre</th>
                    <th>Author</th>
                    <th>Nationality</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.id}</td>
                        <td>${book.title}</td>
                        <td>${book.isbn}</td>
                        <td>${book.genre}</td>
                        <td>${book.author.name}</td>
                        <td>${book.author.nationality}</td>
                        <td>
                            <a href="/books/edit/${book.id}" class="btn btn-edit">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>

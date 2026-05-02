<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Library Management - Add/Edit Book</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background-color: #f4f7f6; margin: 0; padding: 20px; color: #333; }
        h1 { color: #2c3e50; text-align: center; }
        .container { max-width: 600px; margin: 0 auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], select { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn { display: inline-block; padding: 10px 15px; color: white; background-color: #3498db; text-decoration: none; border-radius: 4px; font-weight: bold; border: none; cursor: pointer; }
        .btn:hover { background-color: #2980b9; }
        .error { color: #e74c3c; font-size: 0.9em; margin-top: 5px; display: block; }
        .btn-cancel { background-color: #95a5a6; margin-left: 10px; }
        .btn-cancel:hover { background-color: #7f8c8d; }
    </style>
</head>
<body>
    <div class="container">
        <h1>${book.id == null ? 'Add New Book' : 'Edit Book'}</h1>
        
        <form:form action="/books/save" modelAttribute="book" method="post">
            <form:hidden path="id"/>
            
            <div class="form-group">
                <label for="title">Title</label>
                <form:input path="title" id="title" />
                <form:errors path="title" cssClass="error" />
            </div>
            
            <div class="form-group">
                <label for="isbn">ISBN</label>
                <form:input path="isbn" id="isbn" />
                <form:errors path="isbn" cssClass="error" />
            </div>
            
            <div class="form-group">
                <label for="genre">Genre</label>
                <form:input path="genre" id="genre" />
            </div>
            
            <div class="form-group">
                <label for="author.id">Author</label>
                <form:select path="author.id" id="author.id">
                    <form:options items="${authors}" itemValue="id" itemLabel="name"/>
                </form:select>
                <form:errors path="author.id" cssClass="error" />
            </div>
            
            <div style="margin-top: 20px;">
                <button type="submit" class="btn">Save</button>
                <a href="/books" class="btn btn-cancel">Cancel</a>
            </div>
        </form:form>
    </div>
</body>
</html>

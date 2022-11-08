<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/7/2022
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a><br>
        <form class="d-flex" action="/users?action=search" method="post">
            <input class="form-control me-2" type="text" placeholder="Search" name="name1" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
        <a href="users?action=users">Back to original List All Users </a>
    </h2>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2 style="background-color: aqua">List of Users after arrange by name</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUserArrange}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>
                    <a href="/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/4/2022
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1>Danh sách sản phẩm </h1>
<a href="/product?action=add">Thêm mới</a>
<table class="table table-dark">
    <tr>
        <th>STT</th>
        <th> ID</th>
        <th> Name</th>
        <th> Price</th>
        <th></th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td><a href="/product?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">Delete</a> </td>
            <td><a href="/product?action=view&id=${product.getId()}">Detail</a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>

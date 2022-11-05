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
</head>
<body>
<h1> Trang thêm mới</h1>
<a href="/product">Quay lại list</a>
<c:if test="${mess!=null}">
    <span style="color: red">${mess}</span>
</c:if>
<form action="/product?action=add" method="post">
    <label>ID: </label>
    <label>
        <input type="text" name="id"/><br>
    </label>
    <label>NAME: </label>
    <label>
        <input type="text" name="name"/><br>
    </label>
    <label>PRICE: </label>
    <label>
        <input type="text" name="price"/><br>
    </label>
    <label>
        <button>save</button>
    </label>

</form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/3/2022
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/calculate" method="post">
        <label>type the first number: </label>
        <label>
            <input type="text" name="firstNumber" placeholder="First Calculator">
        </label><br>
        <label> Operation: </label>
        <label>
            <select name="operation" >
                <option>+</option>
                <option>-</option>
                <option>*</option>
                <option>/</option>
            </select>
        </label><br>
        <label>type the second number :</label>
        <label>
            <input type="text" name="secondNumber" placeholder="First Calculator">
        </label><br>
        <input type="submit" id="calculate" value="calculating">

    </form>



</body>
</html>

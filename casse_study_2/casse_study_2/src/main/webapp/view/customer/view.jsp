<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/10/2022
  Time: 5:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer</title>
</head>
<body>
<h1>Customer</h1>
<table>
    <tr>
        <th>STT</th>
        <th>Customner type id </th>
        <th>Name</th>
        <th>Birth day</th>
        <th>Gender</th>
        <th>idCard</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Address</th>
    </tr>
        <c:forEach var="customer" items="${outPutCustomers}" varStatus="status">
    <tr>
        <td>${status.count}</td>
        <td><c:out value="${customer.customerTypeId}"/></td>
        <td><c:out value="${customer.name}"/></td>
        <td><c:out value="${customer.dateOfBirth}"/></td>
        <td><c:out value="${customer.gender}"/></td>
        <td><c:out value="${customer.idCard}"/></td>
        <td><c:out value="${customer.phoneNumber}"/></td>
        <td><c:out value="${customer.email}"/></td>
        <td><c:out value="${customer.address}"/></td>
    </tr>
        </c:forEach>
</table>

</body>
</html>

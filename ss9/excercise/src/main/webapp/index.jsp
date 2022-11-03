<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/3/2022
  Time: 8:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
  <title>Product Discount Calculator</title>
<body>
<h2>Product Discount Calculator </h2>
<form action="/display_discount" method="post">
  <label>Product Description:</label><br/>
  <label>
    <input type="text" name="productDescription" placeholder="Enter product description"/>
  </label><br/>
  <label> List Price:</label><br/>
  <label>
    <input type="text" name="listPrice" placeholder="Enter list price"/>
  </label><br/>
  <label>Discount Percent:</label><br/>
  <label>
    <input type="text" name="discountPercent" placeholder="Enter discount percent(%) "/>
  </label><br/>
  <input type="submit" id="/display_discount" value="Calculate Discount"/><br/>

</form>
</body>
</html>
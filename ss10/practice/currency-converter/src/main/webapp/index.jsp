<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/3/2022
  Time: 10:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Currency Converter</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
  <h2>Currency Converter</h2>
  <form action="converter.jsp" method="post">
    <label>Rate: </label>
    <label>
      <input type="text" name="rate" placeholder="RATE" value="22000"/>
    </label><br/>
    <label>USD: </label>
    <input type="text" name="usd" placeholder="USD" value="0"><br/>
    <input type="submit" id="submit" value="Converter">
  </form>
  </body>
</html>

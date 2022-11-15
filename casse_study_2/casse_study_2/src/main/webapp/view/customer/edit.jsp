<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/10/2022
  Time: 6:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        *{
            box-sizing: border-box;
        }
        #main{
            width: 100vw;
            height: 100vh;
     background-image: linear-gradient(#faf3fa, pink);

        }

    </style>
</head>
<body>
<div align="center" id="main">
    <form action="/customer?action=edit" method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Customer edit
                </h2>
                <a href="/customer"><h2>back to list</h2> </a>
            </caption>
            <c:if test="${customer != null}">
                <input type="hidden" name="id" value="<c:out value='${customer.id}' />"/>
            </c:if>
            <tr>
                <th>Customer ID:</th>
                <td>
                    <input type="text" name="id" size="45"
                           value="<c:out value='${customer.id}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer type id:</th>
                <td>
<%--                    <input type="text" name="customerTypeId" size="45"--%>
<%--                           value="<c:out value='${customer.customerTypeId}' />"--%>
<%--                    />--%>
                    <select name="customerTypeName" id="customerTypeName">
                        <c:forEach var="customerTypeName" items="${customerTypeList}">
                           <c:if test="${customerTypeName.getId() == customer.getCustomerTypeId()}">
                               <option selected>${customerTypeName.getCustomerTypeName()}</option>
                           </c:if>
                            <c:if test="${customerTypeName.getId() != customer.getCustomerTypeId()}">
                                <option>${customerTypeName.getCustomerTypeName()}</option>
                            </c:if>

                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${customer.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer birthday:</th>
                <td>
                    <input type="date" name="dateOfBirth" size="45"
                           value="<c:out value='${customer.dateOfBirth}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer gender:</th>
                <td>
                   <pre style="height: 100%">
                       <label><input type="radio" name="gender" value="1" <c:if test="${customer.gender ==1}"> checked </c:if> /> Male</label>
                       <label><input type="radio" name="gender" value="0"  <c:if test="${customer.gender ==0}"> checked </c:if>/> Female </label>
                   </pre>
                </td>
            </tr>
            <tr>
                <th>Customer id Card:</th>
                <td>
                    <input type="text" name="idCard" size="45"
                           value="<c:out value='${customer.idCard}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer phonenumber:</th>
                <td>
                    <input type="text" name="phoneNumber" size="45"
                           value="<c:out value='${customer.phoneNumber}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer email:</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="<c:out value='${customer.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer address:</th>
                <td>
                    <input type="text" name="address" size="45"
                           value="<c:out value='${customer.address}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>

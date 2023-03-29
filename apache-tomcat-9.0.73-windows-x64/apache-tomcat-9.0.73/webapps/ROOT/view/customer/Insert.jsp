<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/10/2022
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${mess != null}">
    <h1> ${mess}</h1>
</c:if>




<div align="center">
    <form action="/customer?action=insert" method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Customer Insert
                </h2>
                <a href="/customer"><h2>back to list</h2> </a>
            </caption>

            <tr>
                <th>Customer ID:</th>
                <td>
                    <input type="text" name="id" size="45"
                           id="id" value="${id}"/>

                </td>
            </tr>
            <tr>
                <th>Customer type :</th>
                <td>
                    <select name="customerTypeName" id="customerTypeName">
                        <c:forEach var="customerTypeName" items="${customerTypeList}">
                             value="${customerTypeName}"
                            <option>${customerTypeName.getCustomerTypeName()}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Customer Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           id="name" value="${name}"
                    />
                    <c:if test="${!errorMaps.isEmpty()}">
                        <p style="color: red">${errorMaps.get('name')}</p>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Customer birthday:</th>
                <td>
                    <input type="date" name="dateOfBirth" size="45"
                           id="dateOfBirth" value="${dateOfBirth}"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer gender:</th>
                <td>
                   <pre style="height: 100%">
                       <input type="radio" name="gender" <c:if test="${gender == 1}">checked</c:if> value="1"  /> Male
                       <input type="radio" name="gender" <c:if test="${gender == 0}">checked</c:if> value="0"  /> Female
                   </pre>
                </td>
            </tr>
            <tr>
                <th>Customer id Card:</th>
                <td>
                    <input type="text" name="idCard" size="45"
                           id="idCard" value="${idCard}"
                    /><br>
                    <c:if test="${!errorMaps.isEmpty()}">
                        <p style="color: red">${errorMaps.get('customerId')}</p>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>Customer phonenumber:</th>
                <td>
                    <input type="text" name="phoneNumber" size="45"
                          id="phoneNumber" value="${phoneNumber}"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer email:</th>
                <td>
                    <input type="text" name="email" size="45"
                         id="email" value="${email}"
                    />
                </td>
            </tr>
            <tr>
                <th>Customer address:</th>
                <td>
                    <input type="text" name="address" size="45"
                           id="address" value="${address}"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
<%--                    <input type="submit" value="Insert"/>--%>
                    <button>Insert</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>

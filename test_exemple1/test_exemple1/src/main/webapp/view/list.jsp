<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/14/2022
  Time: 9:09 PM
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
<h1>List</h1>
<div id="main">
    <div class="row" style="height: 50px;width: 100%; margin-bottom: 5px;margin-right: 12px">
        <div class="col-md-2 center-items" >
            <form class="d-flex" action="/customer?action=search" method="post" style="margin: auto; margin-left: 40px">
                <input class="form-control me-2" type="text" placeholder="Search" name="search_customer" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        <div class="col-md-1 center-items">
            <form action="/customer?action=ShowAll"  style="margin: auto">
                <button class="btn btn-outline-success" type="submit">Show All</button>
            </form>

        </div>
        <div class="col-md-7">
            <h1 style="text-align: center;color: #ee00ff"> CUSTOMER LIST</h1>
        </div>
        <div class="col-md-2 center-items">
            <a href="/customer?action=insert" target="_blank" style="margin: auto;background-color: aquamarine"><button>Add new customer</button></a>
        </div>
    </div>
    <div class="row" style="margin: 0 12px">
        <table class="table table-success table-striped" id="tableCustomer">
            <thead>
            <tr>
                <th>STT</th>
                <th>Customner name </th>
                <th>Phone Number</th>
                <th>Start day</th>
                <th>Type pay</th>
                <th style="">note</th>
                <th style="text-align: center; align-items: center"><button id="btn" value="btnvalue" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-delete">
                    Delete
                </button></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="room" items="${roomList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td><c:out value="${room.getName()}"/></td>
                    <td><c:out value="${room.getPhoneNumber()}"/></td>
                    <td><c:out value="${room.getStartDay()}"/></td>
                    <td><c:out value="${room.typePay.getName()}"/></td>


                    <td><c:out value="${room.note}"/></td>
                    <td style="text-align: center; align-items: center"><input type="checkbox" class="deletee" name="delet" id="delet" value="${room.getName()},${room.getRoomId()}" ></td>

<%--                    <td><button onclick="inforDelete('${customer.getId()}','${customer.getName()}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-delete">--%>
<%--                        Delete--%>
<%--                    </button></td>--%>
                </tr>

            </c:forEach>

            </tbody>




        </table>
    </div>

</div>


<%--/////////// modal delete ///////////////--%>
<div class="modal fade" id="modal-delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/room" method="get">
            <input type="text" hidden name="action" value="delete">
            <input type="text" hidden id="deleteId" name="deleteId">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">


                    <span>Do you want delete user?</span><span style="color:#ff0000" id="deleteName"></span>



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%--/////////////////// end///////////////////--%>
<script>
    function inforDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;

    }
    document.getElementById("btn").onclick = function () {
        // var list = ["Lai Van Ngoc", "Nguyen van chung", "Dang thi nhi"]
        // var list2 = [3,4,5]

        var checkbox = document.getElementsByClassName("deletee");
        var resultId = [];
        var resultName = [];
        // for (var i = 0;i<checkbox.length;i++){
        //     if(checkbox[i].checked === true){
        //         result.push(checkbox[i].value)
        //     }
        // }


        for (var i = 0;i<checkbox.length;i++){
            if(checkbox[i].checked === true){
                var ids = checkbox[i].value;
                var id = ids.split(",");

                resultId.push(id[1]);
                resultName.push(id[0]);
            }
        }


        document.getElementById("deleteId").value = resultId;
        document.getElementById("deleteName").innerText = resultName;


    }
</script>

</body>
</html>

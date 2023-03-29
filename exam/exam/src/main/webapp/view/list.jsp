<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/16/2022
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
    <script src="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</head>
<body>
<div id="main">
    <div class="row" style="height: 50px;width: 100%; margin-bottom: 5px;margin-right: 12px">
        <div class="col-md-2 center-items" >

        </div>


        </div>
        <div class="col-md-7">
            <h1 style="text-align: center;color: #ee00ff"> Danh sách bệnh nhân</h1>
        </div>
    </div>
    <div class="row" style="margin: 0 12px">
        <table class="table table-success table-striped" id="tableCustomer">
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã bệnh án </th>
                <th>Mã bệnh nhân</th>
                <th>Tên bệnh nhân</th>
                <th>Ngày nhập viện</th>
                <th>Ngày ngày ra viện</th>
                <th>Lý do nhập viện</th>
                <th> Tác vụ</th>
                <th ></th>





            </tr>
            </thead>
            <tbody>
            <c:forEach var="benhAn" items="${benhAnList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td><c:out value="${benhAn.getMaBenhAn()}"/></td>
                    <td><c:out value="${benhAn.getMaBenhNhan()}"/></td>
                    <td><c:out value="${benhAn.benhNhan.getTenBenhNhan()}"/></td>
                    <td><c:out value="${benhAn.getNgayNhapVien()}"/></td>
                    <td><c:out value="${benhAn.getNgayRaVien()}"/></td>
                    <td><c:out value="${benhAn.getLyDo()}"/></td>
                    <td>
                        <a href="/customer?action=edit&id=${benhAn.getMaBenhAn()}"><button type="button" class="btn btn-primary" >
                            Edit
                        </button></a>
                    </td>
                    <td><button onclick="inforDelete('${benhAn.getMaBenhAn()}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-delete">
                        Delete
                    </button></td>

                </tr>

            </c:forEach>

            </tbody>




        </table>
    </div>

</div>


<%--/////////// modal delete ///////////////--%>
<div class="modal fade" id="modal-delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/home" method="get">
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
    function inforDelete(id) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = id;

    }
    // document.getElementById("btn").onclick = function () {
    //     // var list = ["Lai Van Ngoc", "Nguyen van chung", "Dang thi nhi"]
    //     // var list2 = [3,4,5]
    //
    //     var checkbox = document.getElementsByClassName("deletee");
    //     var resultId = [];
    //     var resultName = [];
    //     // for (var i = 0;i<checkbox.length;i++){
    //     //     if(checkbox[i].checked === true){
    //     //         result.push(checkbox[i].value)
    //     //     }
    //     // }
    //
    //
    //     for (var i = 0;i<checkbox.length;i++){
    //         if(checkbox[i].checked === true){
    //             var ids = checkbox[i].value;
    //             var id = ids.split(",");
    //
    //             resultId.push(id[1]);
    //             resultName.push(id[0]);
    //         }
    //     }
    //
    //
    //     document.getElementById("deleteId").value = resultId;
    //     document.getElementById("deleteName").innerText = resultName;
    //
    //
    // }
</script>

</body>
</html>
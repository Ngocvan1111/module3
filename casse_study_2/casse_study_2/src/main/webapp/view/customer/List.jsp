<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/6/2022
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <%--    <link rel="stylesheet"  href="css/styles_main.css">--%>
    <style>
        *{
            box-sizing: border-box;

        }
        .header-link{
            display: flex;
            align-items: center;
            justify-content: center;
            line-height: 50px;
            margin: 0 20px;
        }
        .center-items{
            margin: auto;
            align-items: center;
        }
        #menu-furama-vi>li:hover{
            background-color: yellow;
            color: black;
        }
        #menu-furama-vi>li{
            margin-left: 10px;
            margin-right: 10px;
        }
        .img{
            background-image: url("https://furamavietnam.com/wp-content/uploads/2018/07/Vietnam_Danang_Furama_Resort_Exterior-Furama-girl-with-pink-hat.jpg");
            background-size: auto;
            background-repeat: no-repeat;
        }


        .header-nav.js-header-nav.sticky.stuck {
            z-index: 999;
        }
        .sticky {
            display: block;
        }
        .header-nav {
            position: sticky;
            top: 0;
        }
        .stickyy{
            position: sticky;
            top: -0.5em;
            left: 0;
            right: 0;
        }
        /*#main{*/
        /*    margin: 0 0;*/
        /*}*/

    </style>


</head>
<body>
<div id="main">
    <div class="row" style="height: 122px">
        <div class="col-md-2" style="background-color: yellow"></div>
        <div class="col-auto col-sm-5 col-md-2 d-flex align-items-center" style="background-color: red">
            <a href="https://furamavietnam.com/vi/" class="header-logo">
                <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo.png" alt="logo " class="img-fluid">
            </a>
        </div>
        <div class=" col-md-2 d-flex align-items-center justify-content-center" style="background-color: yellow">
            <a href="https://www.tripadvisor.com/Hotel_Review-g298085-d302750-Reviews-Furama_Resort_Danang-Da_Nang.html">
                <img src="assets/picture/logo2.png" class="img-fluid"/>
            </a>
        </div>

        <div class="col-md-2" style="background-color: red">
            <div class="header-contact d-flex">
                <div class="header-contact-icon" style="margin-right: 10px"><i ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                    <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"></path>
                </svg></i></div>
                <div class="header-contact-txt">
                    <p>
                        103 ??? 105 ???????ng V?? Nguy??n Gi??p, Ph?????ng Khu?? M???, Qu???n Ng?? h??nh S??n, Tp. ???? N???ng, Vi???t Nam                                                                                        </p><p class="txt-sm">
                    <span>7.0 km</span> t??? S??n bay Qu???c t??? ???? N???ng                                            </p>
                </div>
            </div>
        </div>
        <div class="col-md-2 d-none d-lg-block" style="background-color: yellow">
            <div class="header-contact d-flex" style="margin-top: 20px" >
                <div class="header-contact-icon" style="margin-right: 10px"><i><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                    <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"></path>
                </svg></i></div>
                <div class="header-contact-txt">
                    <p class="txt-lg">
                        84-236-3847 333/888</p>
                </div>
            </div>
            <div class="header-contact d-flex">
                <div class="header-contact-icon" style="margin-right: 10px"><i><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                    <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"></path>
                </svg></i></div>
                <div class="header-contact-txt">
                    <a href="mailto:reservation@furamavietnam.com">
                        reservation@furamavietnam.com</a>
                </div>
            </div>

        </div>
        <div class="col-md-2" style="background-color: red"></div>

    </div>
    <div class="row stickyy">
        <div class="sticky-wrapper "><div class="header-nav js-header-nav sticky" style="background-color: aqua; margin-top: 5px;margin-right: -12px">
            <div class="container">
                <nav class="navbar navbar-expand-lg">
                    <div class="navbar-collapse">
                        <ul id="menu-furama-vi" class="menu navbar-nav w-100 js-main-menu">
                            <li id="nav-menu-item-5007" class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page"><a href="/view/main.jsp" class="nav-link main-menu-link">HOME</a></li>
                            <li id="nav-menu-item-5008" class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page"><a href="/employees" class="nav-link main-menu-link">EMPLOYEE</a></li>
                            <li id="nav-menu-item-5009" class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page"><a href="/customer" class="nav-link main-menu-link">CUSTOMER</a></li>
                            <li id="nav-menu-item-5010" class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page"><a href="/service" class="nav-link main-menu-link">SERVICE</a></li>
                            <li id="nav-menu-item-5011" class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page"><a href="/contract" class="nav-link main-menu-link">CONTRACT</a></li>
                        </ul>                        </div>
                </nav>
            </div>
        </div></div>

    </div>
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
                <th>Customner type name </th>
                <th>Name</th>
                <th>Birth day</th>
                <th>Gender</th>
                <th>idCard</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customerList}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td><c:out value="${customer.customerType.getCustomerTypeName()}"/></td>
                    <td><c:out value="${customer.name}"/></td>
                    <td><c:out value="${customer.dateOfBirth}"/></td>
                    <td> <c:if test="${customer.gender ==1}"> Male </c:if>
                        <c:if test="${customer.gender ==0}"> Femail </c:if>
                    </td>
                    <td><c:out value="${customer.idCard}"/></td>
                    <td><c:out value="${customer.phoneNumber}"/></td>
                    <td><c:out value="${customer.email}"/></td>
                    <td><c:out value="${customer.address}"/></td>
                    <td>
                        <a href="/customer?action=edit&id=${customer.id}"><button type="button" class="btn btn-primary" >
                            Edit
                        </button></a>
                    </td>
                    <td><button onclick="inforDelete('${customer.getId()}','${customer.getName()}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-delete">
                        Delete
                    </button></td>
                </tr>

            </c:forEach>

            </tbody>




        </table>
    </div>

</div>





<div class="modal fade" id="modal-delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer" method="get">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
    function inforDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;

    }
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

</body>
</html>

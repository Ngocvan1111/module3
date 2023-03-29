<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 11/16/2022
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Form đăng ký</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
<div id="container">
    <div id="divdangki" class="divForm">
        <form name="frmDangKi" action="trangchu.php">
            <h2> Đăng kí thành viên</h2>
            <hr/>
            <table>
                <tr>
                    <td>Tên đăng nhập:</td>
                    <td><input type="text" id="tendangnhap" class="inputCss"/></td>
                </tr>
                <tr>
                    <td> Mật khẩu:</td>
                    <td><input type="password" id="matkhau" class="inputCss"/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" id="email" class="inputCss"/></td>
                </tr>
                <tr>
                    <td>Nghề nghiệp:</td>
                    <td>
                        <select id="nghenghiep" class="drnghenghiep">
                            <option>Vui lòng chọn nghề</option>
                            <option>Lập trình viên</option>
                            <option>Kỹ sư cơ khí</option>
                            <option>Giảng viên</option>
                        </select>
                    </td>

                </tr>
                <tr>
                    <td>Tuổi:</td>
                    <td><input type="text" id="tuoi" class="inputCss"/></td>
                </tr>
                <tr>
                    <td>Giới tính:</td>
                    <td>
                        <input type="radio" id="male" name="gender"/> Male
                        <input type="radio" id="female" name="gender"/> female
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label><input type="submit" value="ĐĂNG KÍ" id="dangki1"/></label>
                        <label><input type="submit" value="Trở lại" id="dangki2"/></label>
                    </td>
                </tr>

            </table>
        </form>
    </div>



</div>


</body>

</html>
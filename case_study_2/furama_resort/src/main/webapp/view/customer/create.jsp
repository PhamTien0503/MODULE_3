<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09-01-23
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Customer</title>
</head>
<body>
<%--// int id, int customerTypeId, String name, String dateOfBirth, boolean gender, String idCard, --%>
<%--//  String phoneNumber, String email, String address--%>
<h1>CREATE CUSTOMER</h1>
<a href="/customer">Comeback customer list</a>
<p  style="color: red">${mess}</p>
<form action="/customer" method="post">
    <p>Customer Type</p>
    <select name="customerTypeId">
        <c:forEach var="customerTypeId" items="${customerTypeIdSet}">
            <option value="${customerTypeId}">${customerTypeMap.get(customerTypeId)}</option>
        </c:forEach>
    </select>
    <p>Name Customer</p>
    <input type="text" name="name" required
           pattern="^[A-Z][a-z]+( [A-Z][a-z]*)+$"
           title="Tên khách hàng không được chứa số và các kí tự đầu tiên của mỗi từ phải viết hoa.">
    <p>Date Of Birth</p>
    <input type="date" name="dateOfBirth">
<%--    <div class="mt-3 form-group">--%>
<%--        <label class="h6">Gender:</label>--%>
<%--        <div class="d-flex">--%>
<%--            <label class="d-block me-4">--%>
<%--                <input type="radio" value="1" name="gender" checked> Male--%>
<%--                <i class="fa-solid fa-mars"></i>--%>
<%--            </label>--%>
<%--            <label class="d-block">--%>
<%--                <input type="radio" value="0" name="gender"> Female--%>
<%--                <i class="fa-solid fa-venus"></i>--%>
<%--            </label>--%>
<%--        </div>--%>
<%--    </div>--%>
    <p>Gender</p>
    <input type="radio" name="gender" value="true">Nam
    <input type="radio" name="gender" value="false">Nu
    <p>ID Card</p>
    <input type="text" name="idCard" required pattern="^\d{9}|\d{12}$"
           title="Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9).">
    <p>Phone Number</p>
    <input type="number" name="phoneNumber" required pattern="^09[01]\d{7}|[(]84[)][+]9[01]\d{7}$"
           title="Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx.">
    <p>Email</p>
    <input type="text" name="email"  required
           pattern="^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]{2,}(\.[A-Za-z0-9]{2,}){1,2}$"
           title="Địa chỉ email phải đúng định dạng.">
    <p>Address</p>
    <input type="text" name="address">
    <button type="submit" name="action" value="save"> SAVE </button>
</form>
</body>
</html>

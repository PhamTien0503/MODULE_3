<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09-01-23
  Time: 6:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Customer</title>
</head>
<body>
<%--// int id, int customerTypeId, String name, String dateOfBirth, boolean gender, String idCard, --%>
<%--//  String phoneNumber, String email, String address--%>
<h1>EDIT CUSTOMER</h1>
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
    <input type="hidden" name="id" value="${customer.id}">
    <input type="text" name="name" value="${customer.name}">
    <p>Date Of Birth</p>
    <input type="date" name="dateOfBirth" value="${customer.dateOfBirth}">
    <p>Gender</p>
    <input type="radio" name="gender" value="0">Nam
    <input type="radio" name="gender" value="1">Nữ
    <p>ID Card</p>
    <input type="text" name="idCard" value="${customer.idCard}">
    <p>Phone Number</p>
    <input type="number" name="phoneNumber" value="${customer.phoneNumber}">
    <p>Email</p>
    <input type="text" name="email" value="${customer.email}">
    <p>Address</p>
    <input type="text" name="address" value="${customer.address}">

    <button type="submit" name="action" value="edit"> EDIT </button>
</form>
</body>
</html>

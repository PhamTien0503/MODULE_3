<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 08-01-23
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Furama Resort</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css" />
</head>
<body>
<c:import url="header_navbar.jsp"></c:import>
<div>
    <form action="/customer" method="get">
        <input type="number" placeholder="id" name="id">
        <input type="text" placeholder="name" name="name">
        <button class="btn btn-danger" type="submit" name="action" value="search">Search</button>
    </form>
</div>
<p style="color: red">${mess}</p>
<div>
    <table class="table table-striped" id="tableCustomer">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Customer type</th>
            <th scope="col">Name</th>
            <th scope="col">Date of birth</th>
            <th scope="col">Gender</th>
            <th scope="col">Id_card</th>
            <th scope="col">Phone number</th>
            <th scope="col">Email</th>
            <th scope="col">Address</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <th scope="row">${customer.id}</th>
                <td scope="col">${customerTypeMap.get(customer.customerTypeId)}</td>
                <td scope="col">${customer.name}</td>
                <td scope="col">${customer.dateOfBirth}</td>
                <c:if test="${customer.gender==true}">
                    <td scope="col">Nam</td>
                </c:if>
                <c:if test="${customer.gender==false}">
                    <td scope="col">Nữ</td>
                </c:if>
                <td scope="col">${customer.idCard}</td>
                <td scope="col">${customer.phoneNumber}</td>
                <td scope="col">${customer.email}</td>
                <td scope="col">${customer.address}</td>
                <td scope="col">
                    <button type="button" class="btn btn-outline-primary">
                        <a href="/customer?action=edit&id=${customer.id}">Edit</a></button>
                </td>
                <td scope="col">
                    <button onclick="infoDelete('${customer.id}','${customer.name}')" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customer" method="post">
            <div class="modal-body">
                <input type="hidden" id="deleteId" name="id">
            <span>Ban co muon xoa khach hang</span>
                <span id="deleteName"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" name="action" value="delete">Delete</button>
            </div>
            </form>
        </div>
    </div>
</div>
<form action="/customer" method="get">
<button type="submit" class="btn btn-outline-success m-1" name="action" value="create">ADD CUSTOMER</button>
</form>
<script>
    function infoDelete(id,name){
        document.getElementById("deleteName").innerText=name;
        document.getElementById("deleteId").value=id;
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
<script src="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</html>

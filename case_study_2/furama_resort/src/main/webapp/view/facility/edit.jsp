<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10-01-23
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Facility</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
    <style>
        p {
            margin: 0 auto;
            text-align: justify;
        }
    </style>
</head>
<body>
<div>
    <div class="row bg-white ">
        <div class="col-md-2 ">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo.png " alt="Logo">
        </div>
        <div class="col-md-3  row">
            <img src="https://smartdata.tonytemplates.com/bestel/wp-content/uploads/2018/05/widget-tripadvisor-logo.png"
                 style="height: 25%;width: 70%" alt="Logo">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/08/widget-tripadvisor-rating.png"
                 style="height: 30%;width: 70%" alt="logo">
            <p><i> 2746 reviews</i></p>
        </div>
        <div class="col-md-3  row">
            <span>&#10083</span> <i><span>103 – 105 Đường Võ Nguyên Giáp,</span></i><br>
            <p><i>Phường Khuê Mỹ, Quận Ngũ hành Sơn, Tp. Đà Nẵng, Việt Nam</i></p>
            <p><i>7.0 km từ Sân bay Quốc tế Đà Nẵng </i></p>
        </div>
        <div class="col-md-2  row">
            <span class="badge rounded-pill bg-primary w-50 h-25">Phone & Email</span>
            <span>84-236-3847 333/888</span>
            <span>reservation@furamavietnam.com</span>
        </div>
        <div class="col-md-2  row d-flex align-content-center">
            <div style="padding-left: 30%"><h4>PHẠM TIẾN</h4></div>
        </div>
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-info">
                <div class="container-fluid">
                    <a class="navbar-brand" href="/home">Home</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="/employee">Employee</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/customer">Customer</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/facility">Service</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="/contract" >Contract</a>
                            </li>
                        </ul>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <form class="w-50 border border-2 border-dark p-3 rounded" action="/facility" method="post">
            <div>
                <h1>EDIT FACILITY</h1>
              <p style="color: red">${mess}</p>
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">Name Facility</label>
                <input type="text" class="form-control" id="name" name="name" value="${facility.name}">
            </div>

            <div class="mb-3">
                <label for="area" class="form-label">Area</label>
                <input type="text" class="form-control" id="area" name="area" value="${facility.area}">
            </div>

            <div class="mb-3">
                <label for="cost" class="form-label">Cost</label>
                <input type="number" class="form-control" id="cost" name="cost" value="${facility.cost}">
            </div>

            <div class="mb-3" id="maxPeople1">
                <label for="maxPeople" class="form-label">Max People</label>
                <input type="number" class="form-control" id="maxPeople" name="maxPeople" value="${facility.maxPeople}">
            </div>

            <div class="mb-3 w-25" id="rentType1">
                <label for="rentType" class="form-label">Rent Type</label>
                <select class="form-select" aria-label="Default select example" id="rentType" name="rentTypeId">
                    <option selected>Rent Type</option>
                    <c:forEach var="rentType" items="${idSetRentType}">
                        <option value="${rentType}">${rentTypeMap.get(rentType)}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3 w-25" id="facilityType1">
                <label for="facilityType" class="form-label">Facility Type</label>
                <select class="form-select" aria-label="Default select example" id="facilityType" name="facilityTypeId">
                    <option selected>Facility Type</option>
                    <c:forEach var="facilityType" items="${idSetFacilityType}">
                        <option value="${facilityType}">${facilityTypeMap.get(facilityType)}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3" id="standardRoom1">
                <label for="standardRoom" class="form-label">Standard Room</label>
                <input type="text" class="form-control" id="standardRoom" name="standardRoom" value="${facility.standardRoom}">
            </div>

            <div class="mb-3" id="descriptionOtherConvenience1">
                <label for="descriptionOtherConvenience" class="form-label">Description Other Convenience</label>
                <input type="text" class="form-control" id="descriptionOtherConvenience" name="descriptionOtherConvenience" value="${facility.standardRoom}">
            </div>

            <div class="mb-3" id="poolArea1">
                <label for="poolArea" class="form-label">Pool Area</label>
                <input type="number" class="form-control" id="poolArea" name="poolArea" value="${facility.poolArea}">
            </div>

            <div class="mb-3" id="numberOfFloors1">
                <label for="numberOfFloors" class="form-label">Number Of Floors</label>
                <input type="number" class="form-control" id="numberOfFloors" name="numberOfFloors" value="${facility.numberOfFloors}">
            </div>

            <div class="mb-3" id="facilityFree1">
                <label for="facilityFree" class="form-label">Facility Free</label>
                <input type="text" class="form-control" id="facilityFree" name="facilityFree" value="${facility.facilityFree}">
            </div>
            <div>
                <input type="hidden" class="form-control" name="action" value="edit">
                <input type="hidden" class="form-control" name="id" value="${facility.id}">
                <button class="btn btn-outline-success" type="submit">EDIT</button>
            </div>
        </form>
    </div>
</div>
</div>
</body>
<script src="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</html>

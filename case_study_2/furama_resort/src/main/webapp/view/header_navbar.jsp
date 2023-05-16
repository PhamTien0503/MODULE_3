<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 07-01-23
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/css/bootstrap.css">
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
</div>
</body>
<script src="bootstrap-5.1.3-dist/bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</html>

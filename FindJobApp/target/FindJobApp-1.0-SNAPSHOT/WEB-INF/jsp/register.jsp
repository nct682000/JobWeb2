<%-- 
    Document   : login
    Created on : Aug 15, 2021, 7:42:23 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title></title>
    </head>
    <body>

        <div col-md-6>
            <div class="card container w-50 p-3">
                <article class="card-body">

                    <!-- Text -->
                    <h2 class="card-title text-center mb-2 text-info font-weight-bold">Tạo tài khoản mới</h2>
                    <hr>

                    <!-- Notification -->
                    <p class="text-success text-center">Thông báo........</p>
                    <form>

                        <!-- input username -->
                        <div class="form-group">
                            <div class="input-group ">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                </div>
                                <input name="" class="form-control" placeholder="Nhập tài khoản" type="text">
                            </div>
                        </div> 

                        <!-- input password -->
                        <div class="form-group">
                            <div class="input-group mt-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-lock" style="width: 15px"></i> </span>
                                </div>
                                <input class="form-control" placeholder="********" type="password">
                            </div> 
                        </div> 

                        <!-- input confirm password -->
                        <div class="form-group">
                            <div class="input-group mt-4">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-lock" style="width: 15px"></i> </span>
                                </div>
                                <input class="form-control" placeholder="********" type="password">
                            </div>
                        </div>

                        <div class="row mt-4">
                            <!-- input first name -->
                            <div class="form-group col-md-6 col-xl-6">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                    </div>
                                    <input class="form-control" placeholder="Nhập tên" type="text">
                                </div>
                            </div>

                            <!-- input last name -->
                            <div class="form-group col-md-6 col-xl-6">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                    </div>
                                    <input class="form-control" placeholder="Nhập họ" type="text">
                                </div>
                            </div> 

                        </div>

                        <!-- input email -->
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-envelope" style="width: 15px"></i> </span>
                                </div>
                                <input class="form-control" placeholder="Địa chỉ email" type="email">
                            </div>
                        </div>

                        <div class="row mt-4">

                            <!-- input phone -->
                            <div class="form-group col-md-6 col-xl-8">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-phone" style="width: 15px"></i> </span>
                                    </div>
                                    <input class="form-control" placeholder="Số điện thoại" type="phone">
                                </div>
                            </div>

                            <!-- select sex -->
                            <div class="form-group col-md-6 col-xl-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-venus-mars" style="width: 15px"></i> </span>
                                    </div>
                                    <select class="form-control" aria-label=".form-select-sm example" id="sex">
                                        <option selected>Giới tính</option>
                                        <option value="0">Nam</option>
                                        <option value="1">Nữ</option>
                                        <option value="2">Giới tính khác</option>
                                    </select>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <!-- input address -->
                            <div class="form-group col-md-8 col-xl-8">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-location-arrow " style="width: 15px"></i> </span>
                                    </div>
                                    <input class="form-control" placeholder="Nhập địa chỉ" type="text">
                                </div>
                            </div>

                            <!-- select province -->
                            <div class="form-group col-md-4 col-xl-4">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-map-marker" style="width: 15px"></i> </span>
                                    </div>
                                    <select class="form-control" aria-label=".form-select-sm example" id="province">
                                        <option selected>Tỉnh thành</option>
                                        <c:forEach var="p" items="${provinces}">
                                            <option value="${p.id}">${p.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <!-- Choose Avatar -->
                            <div class="form-group col-md-7 col-xl-7">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                    </div>
                                    <input class="form-control" type="file">
                                </div>
                            </div>

                            <!-- Avatar view -->
                            <div class="form-group col-md-5 col-xl-5">
                                <div>
                                    <img src="" class="img-thumbnail" />
                                </div>
                            </div> 

                        </div>

                        <!-- register button -->
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block btn-lg"> Đăng ký  </button>
                        </div> 

                        <!-- link login -->
                        <p class="text-center"><a href="/FindJobApp/login" class="btn btn-lg text-primary">Trở về đăng nhập</a></p>
                    </form>
                </article>
            </div>
        </div>

    </body>
</html>

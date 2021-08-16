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
            <div class="card container w-50 p3">
            <article class="card-body">
                <h2 class="card-title text-center mb-4 mt-1 text-info font-weight-bold">Tạo tài khoản mới</h2>
                <hr>
                <p class="text-success text-center">Thông báo........</p>
                <form>
                <div class="form-group">
                <div class="input-group input-group-lg">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                         </div>
                        <input name="" class="form-control" placeholder="Nhập tài khoản" type="email">
                </div> <!-- input-group.// -->
                </div> <!-- form-group// -->
                <div class="form-group">
                <div class="input-group input-group-lg mt-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                         </div>
                    <input class="form-control" placeholder="********" type="password">
                </div> <!-- input-group.// -->
                </div> <!-- form-group// -->
                <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block btn-lg"> Đăng ký  </button>
                </div> <!-- form-group// -->
                <p class="text-center"><a href="/FindJobApp/login" class="btn btn-lg">Đăng nhập</a></p>
                </form>
            </article>
            </div>
        </div>
        
    </body>
</html>

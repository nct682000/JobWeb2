<%-- 
    Document   : login
    Created on : Aug 15, 2021, 7:42:23 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:url value="/login" var="action" />

<div col-md-6>
    <div class="card container w-50 p-3">
    <article class="card-body">

        <!-- Text -->
        <h2 class="card-title text-center mb-2 text-info font-weight-bold">ĐĂNG NHẬP</h2>
        <hr>

        <!-- Notification -->
        <c:if test="${param.accessDenied != null}">
            <h5 class="text-danger text-center my-4">Bạn không đủ quyền truy cập tài nguyên</h5>
        </c:if>
        <c:if test="${param.error != null}">
            <h5 class="text-danger text-center my-4">Đăng nhập không thành công</h5>
        </c:if>
        
        <form method="post" action="${action}">

        <!-- input username -->
        <div class="form-group">
            <div class="input-group input-group-lg">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                     </div>
                <input name="username" id="username" class="form-control" placeholder="Nhập tài khoản" type="username">
            </div> 
        </div>

        <!-- input password -->
        <div class="form-group">
            <div class="input-group input-group-lg mt-4">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                     </div>
                <input name="password" id="password" class="form-control" placeholder="Mật khẩu" type="password">
            </div> 
        </div>

        <!-- save password checkbox -->
        <div class="checkbox checkbox-lg">
            <label> <input type="checkbox"> Lưu mật khẩu </label>
        </div>

        <!-- login button -->
        <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block btn-lg font-weight-bold"> ĐĂNG NHẬP  </button>
        </div>

        <!-- forgot password -->
        <p class="text-center"><a href="#" class="btn btn-lg text-secondary">Quên mật khẩu?</a></p>

        <!-- link register -->
        <p class="text-center"><a href="<c:url value="/register/candidate" />" class="btn btn-lg text-info font-weight-bold">Đăng ký mới</a></p>
        </form>
    </article>
    </div>
</div>

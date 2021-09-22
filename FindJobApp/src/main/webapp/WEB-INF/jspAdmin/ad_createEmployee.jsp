
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/employees/new" var="action" />

<div>
    <h1 style="text-align: center; margin: 30px 0 50px 0">Tạo tào khoản quản lý</h1>
    <div class="container">
        <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data"
                   cssClass="container col-md-5" cssStyle="margin-bottom: 30px;margin-top: 30px;">
            <div class="mb-3 row">
                <label for="mail" class="col-sm-4 col-form-label">Email</label>
                <div class="col-sm-8">
                    <form:input path="mail"         id="mail"           cssClass="form-control"     placeholder="Email@gmail.com"     type="email"/>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="phone" class="col-sm-4 col-form-label">Số điện thoại</label>
                <div class="col-sm-8">
                    <form:input path="phone"         id="phone"           cssClass="form-control"     placeholder=""     type="text"/>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="username" class="col-sm-4 col-form-label">Username</label>
                <div class="col-sm-8">
                    <form:input path="username"         id="username"           cssClass="form-control"     placeholder="Tên tài khoản"     type="text"/>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="password" class="col-sm-4 col-form-label">Password</label>
                <div class="col-sm-8">
                    <form:input path="password"         id="password"           cssClass="form-control"     placeholder="Mật khẩu"     type="password"/>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="confirmPassword" class="col-sm-4 col-form-label">Confirm password</label>
                <div class="col-sm-8">
                    <form:input path="confirmPassword"         id="confirmPassword"           cssClass="form-control"     placeholder="Xác nhận mật khẩu"     type="password"/>
                </div>
            </div>
            <div style="text-align: center" class="row"> 
                <button class="btn btn-success col-md-5" type="submit" style="margin: 20px 20px 0 30px;">Tạo mới</button>
                <a href="/FindJobApp/admin/employees" 
                   class="btn btn-secondary col-md-4" style="padding: 10px;margin-top: 20px;">Quay về</a>
            </div>
        </form:form>
    </div>
</div>

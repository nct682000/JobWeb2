<%-- 
    Document   : header
    Created on : Aug 18, 2021, 9:56:04 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-dark bg-primary">
    <!--    header  -->
    <div class="container-fluid">
        <!--    drawer btm && dashboard   -->
        <div class="d-flex">
            <button class="btn btn-lg btn-primary bi bi-list" style="font-size: 30px" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample"></button>
            <a class="navbar-brand btn btn-primary" href="/FindJobApp/admin">Trang quản lý</a>
        </div>


        <!--    profile     -->
        <div>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <!--<a class="navbar-brand btn btn-primary" href="/FindJobApp/candidate/${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}<span class="sr-only">(current)</span></a>-->
                <a class="navbar-brand btn btn-primary" href="/FindJobApp/logout">Đăng xuất<span class="sr-only">(current)</span></a>
            </c:if>
        </div>
    </div>

    <!--    drawer  -->
    <div class="offcanvas offcanvas-start bg-info bg-opacity-75" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel" style="width: 15%">
        <div class="offcanvas-header" style="align-self: center">
            <div>
                <img class="d-block w-100" src="<c:url value="/images/userDefaul.jpg" />" alt="carousel1" style="border-radius: 50%; max-width: 120px; margin-top: 35px" >
                <div class="navbar-brand col-12" style="text-align: center; margin-top: 10px">${pageContext.request.userPrincipal.name}<span class="sr-only">(current)</span></div>
            </div>
        </div>
        <div class="offcanvas-body" style="text-align-last: left">
            <c:if test="${pageContext.request.userPrincipal.getAuthorities() == '[ROLE_ADMIN]'}">
                <a class="navbar-brand btn btn-outline-secondary col-12" style="border: none" href="/FindJobApp/admin"                                 >Trang quản lý</a>
                <a class="navbar-brand btn btn-outline-secondary col-12" style="border: none" href="/FindJobApp/admin/employees"                       >Nhân viên</a>
                <a class="navbar-brand btn btn-outline-secondary col-12" style="border: none" href="/FindJobApp/admin/customers/cadidates/inactive"    >Kích hoạt tài khoản</a>
            </c:if>
            <a class="navbar-brand btn btn-outline-secondary col-12" style="border: none" href="/FindJobApp/admin/customers/cadidates"             >Người dùng</a>
            <a class="navbar-brand btn btn-outline-secondary col-12" style="border: none" href="/FindJobApp/admin/recruitment"                     >Tin Tuyển dụng</a>
            <a class="navbar-brand btn btn-outline-secondary col-12" style="border: none" href="/FindJobApp/admin/applies"                         >Thư ứng tuyển</a>
            <a class="navbar-brand btn btn-outline-secondary col-12" style="border: none" href="/FindJobApp/admin/others"                         >Các mục khác</a>

        </div>
    </div>
</nav>
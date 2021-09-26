<%-- 
    Document   : header
    Created on : Aug 14, 2021, 3:38:34 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sticky-top">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <!-- Page name -->
        <a class="navbar-brand font-weight-bold text-secondary" href="/FindJobApp/">TRANG CHỦ</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

                <!-- Find job -->
                <li class="nav-item active">
                    <a class="nav-link" href="#">Tìm việc <span class="sr-only">(current)</span></a>
                </li>

                <!-- career list -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Ngành nghề
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach var="c" items="${careers}">
                            <a class="dropdown-item" href="/FindJobApp/recruitments/?kw=&provinceId=0&careerId=${c.id}&salary=0&form=-1">${c.name}</a>
                        </c:forEach> 
                    </div>
                </li>

                <!-- right item -->
            </ul>
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <a class="nav-link" href="/FindJobApp/login/">Đăng nhập<span class="sr-only">(current)</span></a>
                <a class="nav-link" href="/FindJobApp/register/candidate/">Đăng ký<span class="sr-only">(current)</span></a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <a class="nav-link" href="/FindJobApp/user/${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}<span class="sr-only">(current)</span></a>
                <a class="nav-link" href="/FindJobApp/logout">Đăng xuất<span class="sr-only">(current)</span></a>
            </c:if>
        </div>
    </nav>
</div>
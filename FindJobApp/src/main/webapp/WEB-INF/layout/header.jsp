<%-- 
    Document   : header
    Created on : Aug 14, 2021, 3:38:34 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="sticky-top">
    <nav class="navbar navbar-expand navbar-light bg-light">

        <!-- Page name -->
        <a class="navbar-brand font-weight-bold text-dark" href="<c:url value="/"/>">TRANG CHỦ</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">

                <!-- Find job -->
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="<c:url value="/recruitments?kw=&provinceId=0&careerId=0&salary=0&form=-1"/>">TÌM VIỆC <span class="sr-only">(current)</span></a>
                </li>

                <!-- career list -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle font-weight-bold" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        NGÀNH NGHỀ
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach var="c" items="${careers}">
                            
                            <a class="dropdown-item" href="<c:url value="/recruitments/?kw=&provinceId=0&careerId=${c.id}&salary=0&form=-1"/>">${c.name}</a>
                        </c:forEach> 
                    </div>
                </li>
                
                <!-- Handbook -->
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="<c:url value="/handbook"/>">CẨM NANG<span class="sr-only">(current)</span></a>
                </li>
                
                <!-- CV TEMPLATE -->
                <li class="nav-item">
                    <a class="nav-link font-weight-bold" href="<c:url value="/cv"/>">CV HAY<span class="sr-only">(current)</span></a>
                </li>

                <!-- right item -->
            </ul>
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <a class="nav-link font-weight-bold" href="<c:url value="/login"/>">ĐĂNG NHẬP<span class="sr-only">(current)</span></a>
                <a class="nav-link font-weight-bold" href="<c:url value="/register/candidate"/>">ĐĂNG KÝ<span class="sr-only">(current)</span></a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <a class="nav-link font-weight-bold" href="<c:url value="/user/${pageContext.request.userPrincipal.name}"/>">--${pageContext.request.userPrincipal.name}--<span class="sr-only">(current)</span></a>
                <a class="nav-link font-weight-bold" href="<c:url value="/logout"/>">ĐĂNG XUẤT<span class="sr-only">(current)</span></a>
            </c:if>
        </div>
    </nav>
</div>
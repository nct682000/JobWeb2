<%-- 
    Document   : addTag
    Created on : Aug 17, 2021, 9:09:01 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<h1>THÊM NHÃN DÁN</h1>

<c:url value="/add/tag" var="action" />

<div class="row">
    <div class="col-md-6 col-xl-6 ">
        
        <!-- Form tag -->
        <form:form method="post" action="${action}" modelAttribute="tag"
                   enctype="multipart/form-data">

            <!-- input title -->
            <div class="form-group">
                <label for="content" >Nhãn</label>
                <form:input type="text" id="content" path="content" cssClass="form-control" />
                <form:errors path="content" cssClass="text-danger" element="div" />
            </div>

            <!-- Submit button -->
            <div class="form-group">
                <input type="submit" value="Thêm nhãn" class="btn btn-info" />
            </div>

        </form:form>

            <c:forEach var="tags" items="${tags}" >
                <div>${tags.content}</div>
            </c:forEach>
        
    </div>
    
    <div class="col-md-6 col-xl-6 ">
        <!-- Form tag -->
        <%--<form:form method="post" action="${action}" modelAttribute="benefit"--%>
                   <!--enctype="multipart/form-data">-->

            <!-- input title -->
<!--            <div class="form-group">
                <label for="name" >Quyền lợi</label>-->
                <%--<form:input type="text" id="name" path="name" cssClass="form-control" />--%>
                <%--<form:errors path="name" cssClass="text-danger" element="div" />--%>
            <!--</div>-->

            <!-- Submit button -->
<!--            <div class="form-group">
                <input type="submit" value="Thêm quyền lợi" class="btn btn-info" />
            </div>-->

        <%--</form:form>--%>

            <c:forEach var="b" items="${benefits}" >
                <div>${b.name}</div>
            </c:forEach>
    </div>
</div>

        
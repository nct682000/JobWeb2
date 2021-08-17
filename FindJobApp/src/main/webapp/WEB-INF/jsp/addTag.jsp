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

<c:url value="/addtag" var="action" />

<form:form method="post" action="${action}" modelAttribute="tag"
           enctype="multipart/form-data">
    
      <!-- input title -->
        <div class="form-group">
            <label for="title" >Nhãn</label>
            <form:input type="text" id="content" path="content" cssClass="form-control" />
            <form:errors path="content" cssClass="text-danger" element="div" />
        </div>
        
        <!-- Submit button -->
        <div class="form-group">
            <input type="submit" value="Thêm nhãn" class="btn btn-info" />
        </div>
            
</form:form>

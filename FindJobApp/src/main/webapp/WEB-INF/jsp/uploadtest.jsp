<%-- 
    Document   : uploadtest
    Created on : Aug 16, 2021, 7:25:45 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<h1 class="text-center text-danger">TEST</h1>

<c:url value="/uploadtest" var="action" />

<form:form method="post" action="${action}" modelAttribute="recruitment"
           enctype="multipart/form-data">
    
    <form:errors path="*" cssClass="alert alert-warning" element="div" />
    
    <!-- input title -->
    <div class="form-group">
        <label for="title" >Tiêu đề</label>
        <form:input type="text" id="title" path="title" cssClass="form-control" />
        <form:errors path="title" cssClass="alert alert-warning" element="div" />
    </div>
    
    <!-- input salary from -->
    <div class="form-group">
        <label for="salaryFrom" >Lương từ ...</label>
        <form:input type="number" id="salaryFrom" path="salaryFrom" cssClass="form-control" />
        <form:errors path="salaryFrom" cssClass="alert alert-warning" element="div" />
    </div>
    
    <!-- input salary to -->
    <div class="form-group">
        <label for="salaryTO" >Lương lên đến ...</label>
        <form:input type="number" id="salaryTO" path="salaryTo" cssClass="form-control" />
        <form:errors path="salaryTo" cssClass="alert alert-warning" element="div" />
    </div>
    
    <!-- select form -->
    <div class="form-group">
        <label for="form" >Chức vụ</label>
        <form:select type="number" id="form" path="form" cssClass="form-control" >
            <form:option value="0">Thực tập sinh</form:option>
            <form:option value="1">Mới ra trường</form:option>
            <form:option value="2">Nhân viên</form:option>
            <form:option value="3">Trưởng nhóm</form:option>
            <form:option value="4">Quản lý</form:option>
            <form:option value="5">Quản lý cấp cao</form:option>
            <form:option value="6">Giám đốc điều hành</form:option>
        </form:select>
        <form:errors path="form" cssClass="alert alert-warning" element="div" />
    </div>
    
    <!-- input description -->
    <div class="form-group">
        <label for="description" >Chi tiết</label>
        <form:textarea id="description" path="description" cssClass="form-control"></form:textarea>
        <form:errors path="description" cssClass="alert alert-warning" element="div" />
    </div>
    
    <!-- Choose Image -->
    <div class="form-group">
        <label for="file" >Ảnh</label>
    <form:input type="file" id="file" path="file" cssClass="form-control" />
    </div>
    
    <!-- Submit button -->
    <div class="form-group">
        <input type="submit" value="Thêm ảnh" class="btn btn-info" />
    </div>
</form:form>

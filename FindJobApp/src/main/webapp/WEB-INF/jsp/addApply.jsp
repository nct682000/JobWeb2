<%-- 
    Document   : addApply
    Created on : Aug 18, 2021, 2:47:28 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:url value="/add/apply" var="action" />

<div class="container">
    
    <c:if test="${errMsg != null}">
            <div class="alert alert-danger">${errMsg}</div>
        </c:if>
    
    <form:form method="post" action="${action}" modelAttribute="apply"
           enctype="multipart/form-data">
    
        <c:if test="${errMsg != null}">
            <div class="alert alert-danger">${errMsg}</div>
        </c:if>

        <div class="row justify-center">
            <div class="col-md-2 col-xl-4">
                <!-- select candidate -->
                <div class="form-group">
                    <label for="candidate" >Người ứng tuyển</label>
                    <form:select id="candidate" path="candidate" cssClass="form-control" >
                        <option value="">----</option>
                        <c:forEach var="can" items="${candidates}">
                        <option value="${can.id}">${can.firstName} ${can.lastName}</option>
                        </c:forEach>
                    </form:select>
                    <form:errors path="candidate" cssClass="text-danger" element="div" />
                </div>
                
                <!-- select recruitment -->
                <div class="form-group">
                    <label for="recruitment" >Tin tuyển dụng</label>
                    <form:select id="recruitment" path="recruitment" cssClass="form-control" >
                        <option value="">----</option>
                        <c:forEach var="r" items="${recruitments}">
                        <option value="${r.id}">${r.title}</option>
                        </c:forEach>
                    </form:select>
                    <form:errors path="recruitment" cssClass="text-danger" element="div" />
                </div>
                
            </div>
        </div>

        <!-- input title -->
        <div class="form-group">
            <label for="title" >Chủ đề</label>
            <form:input type="text" id="title" path="title" cssClass="form-control" />
            <form:errors path="title" cssClass="text-danger" element="div" />
        </div>

        <!-- input description -->
        <div class="form-group">
            <label for="content" >Nội dung</label>
            <form:textarea id="content" path="content" cssClass="form-control"></form:textarea>
            <form:errors path="content" cssClass="text-danger" element="div" />
        </div>
        
        <!-- Choose Image -->
        <div class="form-group">
            <label for="file" >Ảnh</label>
            <form:input type="file" id="file" path="file" cssClass="form-control" />
        </div>

        <!-- Submit button -->
        <div class="form-group">
            <input type="submit" value="Ứng tuyển" class="btn btn-info" />
        </div>
    </form:form>
</div>

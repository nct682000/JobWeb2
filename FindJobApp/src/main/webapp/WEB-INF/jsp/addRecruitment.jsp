<%-- 
    Document   : addRecruitment
    Created on : Aug 16, 2021, 7:25:45 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<h1 class="text-center text-danger">ĐĂNG TIN TUYỂN DỤNG</h1>

<c:url value="/add" var="action" />

<div class="container">
    <form:form method="post" action="${action}" modelAttribute="recruitment"
           enctype="multipart/form-data">
    
        <c:if test="${errMsg != null}">
            <div class="alert alert-danger">${errMsg}</div>
        </c:if>

            <div class="row justify-content-center">
                <div class="col-md-4 col-xl-6">
                    <form:errors path="*" cssClass="alert alert-warning text-danger text-center" element="div" />
                </div>
            </div>

        <div class="row">
            <div class="col-md-5 col-xl-4"></div>
            <div class="col-md-2 col-xl-4">
                <!-- select recruiter -->
                <div class="form-group">
                    <label for="recruiter" >Nhà tuyển dụng</label>
                    <form:select id="recruiter" path="recruiter" cssClass="form-control" >
                        <option value="">----</option>
                        <c:forEach var="u" items="${users}">
                        <option value="${u.id}">${u.companyName}</option>
                        </c:forEach>
                    </form:select>
                    <form:errors path="recruiter" cssClass="text-danger" element="div" />
                </div>
            </div>
            <div class="col-md-5 col-xl-4"></div>
        </div>

        <!-- input title -->
        <div class="form-group">
            <label for="title" >Tiêu đề</label>
            <form:input type="text" id="title" path="title" cssClass="form-control" />
            <form:errors path="title" cssClass="text-danger" element="div" />
        </div>

        <!-- input salary from -->
        <div class="form-group">
            <label for="salaryFrom" >Lương từ ...</label>
            <form:input type="number" id="salaryFrom" path="salaryFrom" cssClass="form-control" />
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
            <form:select id="form" path="form" cssClass="form-control" >
                <option value="">--Chọn chức vụ--</option>
                <option value="INTERN">Thực tập sinh</option>
                <option value="GRADUATED">Mới ra trường</option>
                <option value="STAFF">Nhân viên</option>
                <option value="LEADER">Trưởng nhóm</option>
                <option value="MANAGER">Quản lý</option>
                <option value="SENIOR_MANAGER">Quản lý cấp cao</option>
                <option value="EXECUTIVES">Giám đốc điều hành</option>
            </form:select>
            <form:errors path="form" cssClass="text-danger" element="div" />
        </div>

        <!-- select form -->
        <div class="form-group">
            <label for="career" >Ngành nghề</label>
            <form:select id="career" path="career" cssClass="form-control" >
                <option value="">--Chọn ngành nghề--</option>
                <c:forEach var="c" items="${careers}">
                <option value="${c.id}">${c.name}</option>
                </c:forEach>
            </form:select>
            <form:errors path="career" cssClass="text-danger" element="div" />
        </div>

        <!-- input description -->
        <div class="form-group">
            <label for="description" >Chi tiết</label>
            <form:textarea id="description" path="description" cssClass="form-control"></form:textarea>
            <form:errors path="description" cssClass="text-danger" element="div" />
        </div>

        <!-- Choose Image -->
    <!--    <div class="form-group">
            <label for="file" >Ảnh</label>
            <%--<form:input type="file" id="file" path="file" cssClass="form-control" />--%>
        </div>-->

        <!-- Submit button -->
        <div class="form-group">
            <input type="submit" value="Thêm tin" class="btn btn-info" />
        </div>
    </form:form>
</div>

<%-- 
    Document   : ad_edit_user
    Created on : Aug 30, 2021, 3:17:09 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container col-md-8" style="margin-bottom: 30px;margin-top: 30px; background-color: #e8f7ce">

    <h3 style="text-align: center; padding-top: 20px; margin: 0;">${apply[0][0]}</h3>
    <div class="row" style="padding: 20px;">
        <!--    thông tin người dùng   -->
        <div class="col-md-7">
            <!--   nội dung   -->
            <div class="row" style=" margin-bottom: 30px;">
                <!--    họ tên  -->
                <div class="col-md-12">
                    <label class="form-label">Nội dung</label>
                    <textarea readonly="true" rows="20" style="width: 100%; border: 0">${apply[0][1]}</textarea>
                </div>

            </div>
        </div>
        <div class="col-md-5">
            <div class="col-md-12">Tạo ngày ${apply[0][3].toString().substring(0, 10)}</div>
            <div class="col-md-12">Người thực hiện: ${apply[0][6]}</div>
            <div class="col-md-12">Công việc: ${apply[0][5]}</div>
            <div style="text-align: center; margin: 20px">
                <a href="${apply[0][2]}"><img src="${apply[0][2]}" class="img-fluid rounded" alt="cv" /></a>
            </div>
            <c:if test="${apply[0][4] == true}">
                <div class="col-md-12">Trạng thái: bình thường</div>
            </c:if>
            <c:if test="${apply[0][4] == false}">
                <div class="col-md-12">Trạng thái: bị khóa</div>
            </c:if>
            <div class="col-md-12">
                <div style="justify-content: center" class="row"> 
                    <a href="/FindJobApp/admin/applies" 
                       class="btn btn-secondary col-md-8" style="padding: 10px;margin-top: 20px;">Quay về</a>
                </div>
            </div>
        </div>
    </div>
</div>



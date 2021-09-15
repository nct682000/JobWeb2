<%-- 
    Document   : ad_customers_detail
    Created on : Sep 15, 2021, 8:28:55 AM
    Author     : DELL
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<h2 class="text-center text-info mb-5">Trang người dùng</h2>
<!-- Card -->

<div class="card overflow-hidden my-3 container-fluid" style="background-color: lemonchiffon">
    <div class="card-content">
      <div class="card-body cleartfix">
        <div class="media align-items-stretch">
            <!-- Image -->
          <div class="align-self-center mr-5">
              <image src="${user[0].avatar}" alt="Ảnh" style="width:200px; height: 200px"/>
          </div>
          <div class="media-body mt-3">
                <!-- name -->
                <h5 class="text-info font-weight-bold">${user[0].firstName} ${user[0].lastName}</h5>
                <!-- gender -->
                <div class="text-secondary font-weight-bold">Giới tính: ${user[0].sex.toString()}</div>
                <!-- location -->
                <div class="text-secondary font-weight-bold">Địa chỉ: ${user[0].location.address}, ${user[0].location.province.name}</div>
                <!-- mail -->
                <div class="text-secondary font-weight-bold">Email: ${user[0].mail}</div>
                <!-- phone -->
                <div class="text-secondary font-weight-bold">Điện thoại: ${user[0].phone}</div>

          </div>
                <div class="font-weight-bold text-secondary">
                    <a href="#" class="btn btn-info font-weight-bold">Chỉnh sửa</a>                 
                </div>
        </div>
      </div>
    </div>
</div>
<div class="container-fluid" style="width: 95%">
    <div class="row mt-3" >
        <!-- col 1 -->
        <div class="col-md-9 col-xl-9">
            <!-- COmment -->
            <h5 class="text-dark font-weight-bold">Giới thiệu</h5>
            <div>Text</div>
            
        </div>
        
        <!-- col 2 -->
        <div class="col-md-3 col-xl-3" style="border-left: 1px solid">
            <h5 class="text-dark font-weight-bold">Lịch sử ứng tuyển</h5>
            <c:forEach var="a" items="${applies}">
                <div class="card bg-light mb-2">
                    <div class="text-info font-weight-bold">${a.recruitment.title}</div>
                    <div>
                        <a class="text-white btn btn-secondary btn-sm " href="#">Xem chi tiết</a>
                    </div>
                    
                </div>
            </c:forEach>
        </div>
    </div>
</div>



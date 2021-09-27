<%-- 
    Document   : rRegister
    Created on : Aug 18, 2021, 8:17:04 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:url value="/register/recruiter" var="action" />

<div col-md-6>
<div class="card container w-50 p-3">
<article class="card-body">
    
    <!-- Text -->
    <h2 class="card-title text-center mb-2 text-success font-weight-bold">Tạo tài khoản mới</h2>
    <h5 class="text-center mb-2 text-success">--NHÀ TUYỂN DỤNG--</h5>
    <hr>
    <div><a href="/FindJobApp/register/candidate" class="btn btn-lg text-info">Tạo tài khoản thường</a></div>

    <!-- Notification -->
    <c:if test="${errMsg != null}" >
        <p class="text-success text-center">${errMsg}</p>
    </c:if>
        <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">

        <!-- input username -->
        <div class="form-group">
            <div class="input-group ">
                <div class="input-group-prepend">
                    <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                 </div>
                <form:input path="username" id="username" class="form-control" placeholder="Nhập tài khoản" type="text"/>
            </div>
            <div class="input-group ">
                <form:errors path="username" cssClass="text-danger" element="div" />
            </div>
        </div> 

        <!-- input password -->
        <div class="form-group">
            <div class="input-group mt-4">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock" style="width: 15px"></i> </span>
                     </div>
                    <form:input path="password" id="password" class="form-control" placeholder="Nhập mật khẩu" type="password"/>
            </div> 
            <div class="input-group ">
                <form:errors path="password" cssClass="text-danger" element="div" />
            </div>
        </div> 

        <!-- input confirm password -->
        <div class="form-group">
            <div class="input-group mt-4">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock" style="width: 15px"></i> </span>
                     </div>
                    <form:input path="confirmPassword" id="confirmPassword" class="form-control" placeholder="Xác nhận mật khẩu" type="password"/>
            </div>
        </div>

        <div class="row mt-4">
            <!-- input company name -->
            <div class="form-group col-md-7 col-xl-7">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                         </div>
                        <form:input path="companyName" id="companyName" class="form-control" placeholder="Nhập tên công ty" type="text"/>
                        
                </div>
                <div class="input-group ">
                    <form:errors path="companyName" cssClass="text-danger" element="div" />
                </div>
            </div>

            <!-- input phone -->
            <div class="form-group col-md-5 col-xl-5">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-phone" style="width: 15px"></i> </span>
                         </div>
                        <form:input path="phone" id="phone" class="form-control" placeholder="Số điện thoại" type="phone"/>
                        
                </div>
                <div class="input-group ">
                    <form:errors path="phone" cssClass="text-danger" element="div" />
                </div>
            </div>

        </div>

        <!-- input email -->
        <div class="form-group">
            <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-envelope" style="width: 15px"></i> </span>
                     </div>
                    <form:input path="mail" id="mail" class="form-control" placeholder="Địa chỉ email" type="email"/>
                    
            </div>
            <div class="input-group ">
                <form:errors path="mail" cssClass="text-danger" element="div" />
            </div>
        </div>

        <div class="row">
            <!-- input address -->
            <div class="form-group col-md-8 col-xl-8">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-location-arrow " style="width: 15px"></i> </span>
                         </div>
                        <form:input path="address" class="form-control" placeholder="Nhập địa chỉ" type="text"/>
                </div>
            </div>

            <!-- select province -->
            <div class="form-group col-md-4 col-xl-4">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-map-marker" style="width: 15px"></i> </span>
                         </div>
                        <form:select path="province" class="form-control" aria-label=".form-select-sm example" id="province">
                            <option selected>Tỉnh thành</option>
                            <c:forEach var="p" items="${provinces}">
                                <option value="${p.id}">${p.name}</option>
                            </c:forEach>
                        </form:select>
                </div>
            </div>

        </div>

        <div class="row">
            <!-- choose image -->
            <div class="form-group col-md-7 col-xl-7">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                         </div>
                        <form:input path="file" id="file" class="form-control" type="file"/>
                </div>
            </div>

            <!-- view image -->
            <div class="form-group col-md-5 col-xl-5">
                <div>
                    <img src="" style="height: 100px" />
                </div>
            </div> 

        </div>

        <!-- register button -->
        <div class="form-group">
            <button type="submit" class="btn btn-success btn-block btn-lg">Gửi yêu cầu đăng ký </button>
        </div> 

        <!-- link login -->
        <p class="text-center"><a href="/FindJobApp/login" class="btn btn-lg text-success">Trở về đăng nhập</a></p>
    </form:form>>
                        
</article>
</div>
</div>

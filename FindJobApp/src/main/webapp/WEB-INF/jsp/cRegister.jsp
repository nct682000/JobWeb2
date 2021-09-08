<%-- 
    Document   : login
    Created on : Aug 15, 2021, 7:42:23 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:url value="/register/candidate" var="action" />

<div col-md-6>
<div class="card container w-50 p-3">
<article class="card-body">

    <!-- Text -->
    <h2 class="card-title text-center mb-2 text-info font-weight-bold">Tạo tài khoản mới</h2>
    <hr>
    <div><a href="/FindJobApp/register/recruiter" class="btn btn-lg text-success">Tạo tài khoản tuyển dụng</a></div>

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
                    <form:errors path="password" cssClass="text-danger" element="div" />
            </div> 
        </div> 

        <!-- input confirm password -->
        <div class="form-group">
            <div class="input-group mt-4">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-lock" style="width: 15px"></i> </span>
                     </div>
                    <form:input path="confirmPassword" id="confirmPassword" class="form-control" placeholder="Xác nhận mật khẩu" type="password" />
            </div>
        </div>

        <div class="row mt-4">
            <!-- input first name -->
            <div class="form-group col-md-6 col-xl-6">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                         </div>
                        <form:input path="firstName" id="firstName" class="form-control" placeholder="Nhập tên" type="text" />
                        <form:errors path="firstName" cssClass="text-danger" element="div" />
                </div>
            </div>

            <!-- input last name -->
            <div class="form-group col-md-6 col-xl-6">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                         </div>
                        <form:input path="lastName" id="lastName" class="form-control" placeholder="Nhập họ" type="text"/>
                        <form:errors path="lastName" cssClass="text-danger" element="div" />
                </div>
            </div> 

        </div>

        <!-- input email -->
        <div class="form-group">
            <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-envelope" style="width: 15px"></i> </span>
                     </div>
                    <form:input path="mail" id="mail" class="form-control" placeholder="Địa chỉ email" type="email" />
                    <form:errors path="mail" cssClass="text-danger" element="div" />
            </div>
        </div>

        <div class="row mt-4">

            <!-- input phone -->
            <div class="form-group col-md-6 col-xl-8">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-phone" style="width: 15px"></i> </span>
                         </div>
                        <form:input path="phone" id="phone" class="form-control" placeholder="Số điện thoại" type="phone" />
                        <form:errors path="phone" cssClass="text-danger" element="div" />
                </div>
            </div>

            <!-- select sex -->
            <div class="form-group col-md-6 col-xl-4">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-venus-mars" style="width: 15px"></i> </span>
                         </div>
                        <form:select class="form-control" aria-label=".form-select-sm example" path="sex" id="sex">
                            <option selected>Giới tính</option>
                            <option value="MALE">Nam</option>
                            <option value="FEMALE">Nữ</option>
                            <option value="NEUTRAL">Giới tính khác</option>
                        </form:select>
                </div>
            </div>

        </div>

        <div class="row">
             <!--input address--> 
            <div class="form-group col-md-8 col-xl-8">
                <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-location-arrow " style="width: 15px"></i> </span>
                         </div>
                        <form:input path="address" class="form-control" placeholder="Nhập địa chỉ" type="text" />
                </div>
            </div>

             <!--select province--> 
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
                        <form:input path="file" id="file" class="form-control" type="file" />
                </div>
            </div>

            <!-- view image -->
            <div class="form-group col-md-5 col-xl-5">
                <div>
                    <img src="" style="height: 100px" />
                </div>
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
                        <form:errors path="companyName" cssClass="text-danger" element="div" />
                </div>
            </div>

        </div>

        <!-- register button -->
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg"> Đăng ký  </button>
        </div> 

    </form:form>
        
        <!-- link login -->
        <p class="text-center"><a href="/FindJobApp/login" class="btn btn-lg text-primary">Trở về đăng nhập</a></p>
        
</article>
</div>
</div>
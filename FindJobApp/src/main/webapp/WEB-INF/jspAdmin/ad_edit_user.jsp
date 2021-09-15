<%-- 
    Document   : ad_edit_user
    Created on : Aug 30, 2021, 3:17:09 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main">
    <form class="container bg-info col-md-8" style="margin-bottom: 30px;margin-top: 30px;" method="POST" >

        <!--    form cập nhập người ứng tuyển    -->
        <c:if test="${typeUser == 'edit-cadidates'}">
            <h3 style="text-align: center; padding-top: 20px; margin: 0;">Cập nhập thông tin người ứng tuyển</h3>
            <div class="row" style="padding: 20px;">
                <!--    tài khoản   -->
                <div class="col-md-5  " style="padding: 20px 20px 0;" >
                    <div class="" style="border: 2px solid #dee2e6;border-radius: 7%;">
                        <h2 style="text-align: center;padding: 25px;">Tài khoản</h2>
                        <div class="col-md-9 " style="margin: auto;">
                            <input type="text"      class="form-control"    id="validationDefault03"    value="${user.username}" placeholder="username" style=" margin-bottom: 20px;">
                            <input type="password"  class="form-control "   id="validationDefault03"    placeholder="password" style=" margin-bottom: 20px;">
                            <input type="password"  class="form-control"    id="validationDefault03"    placeholder="reconfirm password" style=" margin-bottom: 20px;">
                        </div>
                    </div>
                    <div style="text-align: center" class="row"> 
                        <button class="btn btn-success col-md-5" type="submit" style="margin: 20px 20px 0 30px;">Cập nhập</button>
                        <a href="/FindJobApp/admin/customers/cadidates" 
                           class="btn btn-secondary col-md-4" style="padding: 10px;margin-top: 20px;">Quay về</a>
                    </div>
                </div>

                <!--    thông tin người dùng   -->
                <div class="col-md-7">
                    <!--    họ tên  &   email  -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    họ tên  -->
                        <div class="col-md-4">
                            <label for="validationDefault01" class="form-label">Họ</label>
                            <input type="text" class="form-control" id="validationDefault01" placeholder="họ" value="${user.firstName}">
                        </div>
                        <div class="col-md-2">
                            <label for="validationDefault02" class="form-label">Tên</label>
                            <input type="text" class="form-control" id="validationDefault02" placeholder="tên" value="${user.lastName}">
                        </div>

                        <!--    email   -->
                        <div class="col-md-6">
                            <label for="validationDefaultUsername" class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text" id="inputGroupPrepend2">@</span>
                                <input type="text" class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" value="${user.mail}">
                            </div>
                        </div>
                    </div>

                    <!--    giới tính   &   số điện thoại    -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    giới tính   -->
                        <div class="col-md-5">
                            <label for="validationDefault05" class="form-label">Giới tính</label>
                            <c:if test="${user.sex == 'MALE'}">
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-right: 20px;">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
                                        <label class="form-check-label" for="flexRadioDefault2" style="margin-right: 20px;">
                                            Nữ
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" >
                                        <label class="form-check-label" for="flexRadioDefault3" style="margin-right: 20px;">
                                            Khác
                                        </label>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${user.sex=='FEMALE'}">
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" >
                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-right: 20px;">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                        <label class="form-check-label" for="flexRadioDefault2" style="margin-right: 20px;">
                                            Nữ
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" >
                                        <label class="form-check-label" for="flexRadioDefault3" style="margin-right: 20px;">
                                            Khác
                                        </label>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${user.sex=='NEUTRAL'}">
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" >
                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-right: 20px;">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
                                        <label class="form-check-label" for="flexRadioDefault2" style="margin-right: 20px;">
                                            Nữ
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked>
                                        <label class="form-check-label" for="flexRadioDefault3" style="margin-right: 20px;">
                                            Khác
                                        </label>
                                    </div>
                                </div>
                            </c:if>
                        </div>

                        <!--    số điện thoại   -->
                        <div class="col-md-5">
                            <label for="validationDefault03" class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" id="validationDefault03" value="${user.phone}">
                        </div>
                    </div>

                    <!--    địa chỉ     -->
                    <div class="row" >                
                        <div class="col-md-5">
                            <label for="validationDefault04" class="form-label">Địa chỉ</label>
                            <select class="form-select" id="validationDefault04" >
                                <option selected disabled value="${user.location.province.name}">${user.location.province.name}</option>
                                <option>...</option>
                            </select>                      
                        </div>
                        <div class="col-md-7">
                            <label for="validationDefault03" class="form-label">địa chỉ cụ thể</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" >${user.location.address}</textarea>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!--    form tạo mới người ứng tuyển    -->
        <c:if test="${typeUser == 'create-cadidates'}">
            <h3 style="text-align: center; padding-top: 20px; margin: 0;">Tạo mới người ứng tuyển</h3>
            <div class="row" style="padding: 20px;">
                <!--    tài khoản   -->
                <div class="col-md-5  " style="padding: 20px 20px 0;" >
                    <div class="" style="border: 2px solid #dee2e6;border-radius: 7%;">
                        <h2 style="text-align: center;padding: 25px;">Tài khoản</h2>
                        <div class="col-md-9 " style="margin: auto;">
                            <input type="text"      class="form-control"    id="validationDefault03"    placeholder="username" style=" margin-bottom: 20px;">
                            <input type="password"  class="form-control "   id="validationDefault03"    placeholder="password" style=" margin-bottom: 20px;">
                            <input type="password"  class="form-control"    id="validationDefault03"    placeholder="reconfirm password" style=" margin-bottom: 20px;">
                        </div>
                    </div>
                    <div style="text-align: center" class="row"> 
                        <button class="btn btn-success col-md-5" type="submit" style="margin: 20px 20px 0 30px;">Tạo mới</button>
                        <a href="/FindJobApp/admin/customers/cadidates" 
                           class="btn btn-secondary col-md-4" style="padding: 10px;margin-top: 20px;">Quay về</a>
                    </div>
                </div>

                <!--    thông tin người dùng   -->
                <div class="col-md-7">
                    <!--    họ tên  &   email  -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    họ tên  -->
                        <div class="col-md-4">
                            <label for="validationDefault01" class="form-label">Họ</label>
                            <input type="text" class="form-control" id="validationDefault01" placeholder="họ" value="${user.firstName}">
                        </div>
                        <div class="col-md-2">
                            <label for="validationDefault02" class="form-label">Tên</label>
                            <input type="text" class="form-control" id="validationDefault02" placeholder="tên" value="${user.lastName}">
                        </div>

                        <!--    email   -->
                        <div class="col-md-6">
                            <label for="validationDefaultUsername" class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text" id="inputGroupPrepend2">@</span>
                                <input type="text" class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" value="${user.mail}">
                            </div>
                        </div>
                    </div>

                    <!--    giới tính   &   số điện thoại    -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    giới tính   -->
                        <div class="col-md-5">
                            <label for="validationDefault05" class="form-label">Giới tính</label>
                            <c:if test="${user.sex == 'MALE'}">
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-right: 20px;">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
                                        <label class="form-check-label" for="flexRadioDefault2" style="margin-right: 20px;">
                                            Nữ
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" >
                                        <label class="form-check-label" for="flexRadioDefault3" style="margin-right: 20px;">
                                            Khác
                                        </label>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${user.sex=='FEMALE'}">
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" >
                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-right: 20px;">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                        <label class="form-check-label" for="flexRadioDefault2" style="margin-right: 20px;">
                                            Nữ
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" >
                                        <label class="form-check-label" for="flexRadioDefault3" style="margin-right: 20px;">
                                            Khác
                                        </label>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${user.sex=='NEUTRAL'}">
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" >
                                        <label class="form-check-label" for="flexRadioDefault1" style="margin-right: 20px;">
                                            Nam
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
                                        <label class="form-check-label" for="flexRadioDefault2" style="margin-right: 20px;">
                                            Nữ
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked>
                                        <label class="form-check-label" for="flexRadioDefault3" style="margin-right: 20px;">
                                            Khác
                                        </label>
                                    </div>
                                </div>
                            </c:if>
                        </div>

                        <!--    số điện thoại   -->
                        <div class="col-md-5">
                            <label for="validationDefault03" class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" id="validationDefault03" value="${user.phone}">
                        </div>
                    </div>

                    <!--    địa chỉ     -->
                    <div class="row" >                
                        <div class="col-md-5">
                            <label for="validationDefault04" class="form-label">Địa chỉ</label>
                            <select class="form-select" id="validationDefault04" >
                                <option selected disabled value="${user.location.province.name}">${user.location.province.name}</option>
                                <option>...</option>
                            </select>                      
                        </div>
                        <div class="col-md-7">
                            <label for="validationDefault03" class="form-label">địa chỉ cụ thể</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" >${user.location.address}</textarea>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!--    form cập nhập nhà tuyển dụng    -->
        <c:if test="${typeUser == 'edit-recruiters'}">
            <h3 style="text-align: center; padding-top: 20px; margin: 0;">Cập nhập thông tin nhà tuyển dụng</h3>
            <div class="row" style="padding: 20px;">
                <!--    tài khoản   -->
                <div class="col-md-5  " style="padding: 20px 20px 0;" >
                    <div class="" style="border: 2px solid #dee2e6;border-radius: 7%;">
                        <h2 style="text-align: center;padding: 25px;">Tài khoản</h2>
                        <div class="col-md-9 " style="margin: auto;">
                            <input type="text"      class="form-control"    id="validationDefault03"    value="${user.username}" placeholder="username" style=" margin-bottom: 20px;">
                            <input type="password"  class="form-control "   id="validationDefault03"    placeholder="password" style=" margin-bottom: 20px;">
                            <input type="password"  class="form-control"    id="validationDefault03"    placeholder="reconfirm password" style=" margin-bottom: 20px;">
                        </div>
                    </div>
                    <div style="text-align: center" class="row"> 
                        <button class="btn btn-success col-md-5" type="submit" style="margin: 20px 20px 0 30px;">Cập nhập</button>
                        <a href="/FindJobApp/admin/customers/recruiters" 
                           class="btn btn-secondary col-md-4" style="padding: 10px;margin-top: 20px;">Quay về</a>
                    </div>
                </div>

                <!--    thông tin người dùng   -->
                <div class="col-md-7">
                    <!--    công ty     -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <div class="col-md-12">
                            <label for="validationDefault03" class="form-label">Công ty</label>
                            <input type="text" class="form-control" id="validationDefault03" value="${user.companyName}">
                        </div>
                    </div>

                    <!--    email   &   số điện thoại    -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    email   -->
                        <div class="col-md-7">
                            <label for="validationDefaultUsername" class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text" id="inputGroupPrepend2">@</span>
                                <input type="text" class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" value="${user.mail}">
                            </div>
                        </div>

                        <!--    số điện thoại   -->
                        <div class="col-md-5">
                            <label for="validationDefault03" class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" id="validationDefault03" value="${user.phone}">
                        </div>
                    </div>

                    <!--    địa chỉ     -->
                    <div class="row" >                
                        <div class="col-md-5">
                            <label for="validationDefault04" class="form-label">Địa chỉ</label>
                            <select class="form-select" id="validationDefault04" >
                                <option selected disabled value="${user.location.province.name}">${user.location.province.name}</option>
                                <option>...</option>
                            </select>                      
                        </div>
                        <div class="col-md-7">
                            <label for="validationDefault03" class="form-label">địa chỉ cụ thể</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" >${user.location.address}</textarea>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!--    form tạo mới nhà tuyển dụng    -->
        <c:if test="${typeUser == 'create-recruiters'}">
            <h3 style="text-align: center; padding-top: 20px; margin: 0;">Tạo mới nhà tuyển dụng</h3>
            <div class="row" style="padding: 20px;">
                <!--    tài khoản   -->
                <div class="col-md-5  " style="padding: 20px 20px 0;" >
                    <div class="" style="border: 2px solid #dee2e6;border-radius: 7%;">
                        <h2 style="text-align: center;padding: 25px;">Tài khoản</h2>
                        <div class="col-md-9 " style="margin: auto;">
                            <input type="text"      class="form-control"    id="validationDefault03"    value="${user.username}" placeholder="username" style=" margin-bottom: 20px;">
                            <input type="password"  class="form-control "   id="validationDefault03"    placeholder="password" style=" margin-bottom: 20px;">
                            <input type="password"  class="form-control"    id="validationDefault03"    placeholder="reconfirm password" style=" margin-bottom: 20px;">
                        </div>
                    </div>
                    <div style="text-align: center" class="row"> 
                        <button class="btn btn-success col-md-5" type="submit" style="margin: 20px 20px 0 30px;">Tạo mới</button>
                        <a href="/FindJobApp/admin/customers/recruiters" 
                           class="btn btn-secondary col-md-4" style="padding: 10px;margin-top: 20px;">Quay về</a>
                    </div>
                </div>

                <!--    thông tin người dùng   -->
                <div class="col-md-7">
                    <!--    công ty     -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <div class="col-md-12">
                            <label for="validationDefault03" class="form-label">Công ty</label>
                            <input type="text" class="form-control" id="validationDefault03" value="${user.companyName}">
                        </div>
                    </div>

                    <!--    email   &   số điện thoại    -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    email   -->
                        <div class="col-md-7">
                            <label for="validationDefaultUsername" class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text" id="inputGroupPrepend2">@</span>
                                <input type="text" class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" value="${user.mail}">
                            </div>
                        </div>

                        <!--    số điện thoại   -->
                        <div class="col-md-5">
                            <label for="validationDefault03" class="form-label">Số điện thoại</label>
                            <input type="text" class="form-control" id="validationDefault03" value="${user.phone}">
                        </div>
                    </div>

                    <!--    địa chỉ     -->
                    <div class="row" >                
                        <div class="col-md-5">
                            <label for="validationDefault04" class="form-label">Địa chỉ</label>
                            <select class="form-select" id="validationDefault04" >
                                <option selected disabled value="${user.location.province.name}">${user.location.province.name}</option>
                                <option>...</option>
                            </select>                      
                        </div>
                        <div class="col-md-7">
                            <label for="validationDefault03" class="form-label">địa chỉ cụ thể</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" >${user.location.address}</textarea>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </form>
</div>

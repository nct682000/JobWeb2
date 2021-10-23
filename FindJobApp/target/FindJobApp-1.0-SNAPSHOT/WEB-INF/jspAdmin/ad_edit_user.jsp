<%-- 
    Document   : ad_edit_user
    Created on : Aug 30, 2021, 3:17:09 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



<c:if test="${typeUser == 'create-cadidates'}">
    <c:url value="/admin/customers/cadidates/new" var="action" />
</c:if>
<c:if test="${typeUser == 'create-recruiters'}">
    <c:url value="/admin/customers/recruiters/new" var="action" />
</c:if>
<c:if test="${typeUser == 'edit-cadidates'}">
    <c:url value="/admin/customers/cadidates/{userId}/edit" var="action" />
</c:if>
<c:if test="${typeUser == 'edit-recruiters'}">
    <c:url value="/admin/customers/recruiters/{userId}/edit" var="action" />
</c:if>

<div >

    <!--    form tạo mới người ứng tuyển    -->
    <c:if test="${typeUser == 'create-cadidates'}">
        <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data"
                   cssClass="container bg-secondary col-md-8" cssStyle="margin-bottom: 30px;margin-top: 30px;">

            <h3 style="text-align: center; padding-top: 20px; margin: 0;">Cập nhập thông tin người ứng tuyển</h3>
            <div class="row" style="padding: 20px;">
                <!--    tài khoản   -->
                <div class="col-md-5  " style="padding: 20px 20px 0;" >
                    <div class="" style="border: 2px solid #dee2e6;border-radius: 7%;">
                        <h2 style="text-align: center;padding: 25px;">Tài khoản</h2>
                        <div class="col-md-9 " style="margin: auto;">
                            <form:input path="username"         id="username"           cssClass="form-control"     placeholder="Tên tài khoản"     type="text"     cssStyle=" margin-bottom: 20px;" />
                            <form:input path="password"         id="password"           cssClass="form-control"     placeholder="Mật khẩu"          type="password" cssStyle=" margin-bottom: 20px;" autocomplete=""/>
                            <form:input path="confirmPassword"  id="confirmPassword"    cssClass="form-control"     placeholder="Nhập lại Mật khẩu" type="password" cssStyle=" margin-bottom: 20px;" autocomplete=""/>
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
                            <label      for="firstName"     class="form-label">Họ</label>
                            <form:input path="firstName"    id="firstName"  cssClass="form-control"     placeholder="Họ. . ."       type="text"/>
                        </div>
                        <div class="col-md-2">
                            <label      for="lastName"      class="form-label">Tên</label>
                            <form:input path="lastName"     id="lastName"   cssClass="form-control"     placeholder="Tên"           type="text"/>
                        </div>

                        <!--    email   -->
                        <div class="col-md-6">
                            <label      for="mail"      class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text">@</span>
                                <form:input path="mail"     id="mail"       cssClass="form-control"     placeholder=""     type="email"/>
                            </div>
                        </div>
                    </div>

                    <!--    giới tính   &   số điện thoại    -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    giới tính   -->
                        <div class="col-md-5">
                            <label for="validationDefault05" class="form-label">Giới tính</label>
                            <div class="d-flex">
                                <div class="form-check">
                                    <form:radiobutton  path="sex" value="MALE" id="MALE"  cssClass="form-check-input" />
                                    <label class="form-check-label" for="sex" style="margin-right: 20px;">
                                        Nam
                                    </label>
                                </div>
                                <div class="form-check">
                                    <form:radiobutton  path="sex" value="FEMALE" id="FEMALE"  cssClass="form-check-input" />
                                    <label class="form-check-label" for="sex" style="margin-right: 20px;">
                                        Nữ
                                    </label>
                                </div>
                                <div class="form-check">
                                    <form:radiobutton  path="sex" value="NEUTRAL" id="NEUTRAL"  cssClass="form-check-input" />
                                    <label class="form-check-label" for="sex" style="margin-right: 20px;">
                                        Khác
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!--    số điện thoại   -->
                        <div class="col-md-5">
                            <label      for="phone"      class="form-label">Số điện thoại</label>
                            <form:input path="phone"     id="phone"   cssClass="form-control"       type="text"/>
                        </div>
                    </div>


                    <!--    địa chỉ     &   ảnh đại diện    -->
                    <div class="row" >                
                        <div class="col-md-5">
                            <label for="province" class="form-label">Địa chỉ</label>  
                            <form:select path="province" cssClass="form-control" aria-label=".form-select-sm example" id="province">
                                <option selected>Tỉnh thành</option>
                                <c:forEach var="p" items="${provinces}">
                                    <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="col-md-7">
                            <label for="validationDefault03" class="form-label">địa chỉ cụ thể</label>
                            <form:textarea path="address" class="form-control" placeholder="Nhập địa chỉ" type="text" rows="3"/>
                        </div>
                    </div>
                    <div class="row" >
                        <label for="province" class="form-label">Ảnh</label>  
                        <form:input path="file" id="file" class="form-control" type="file" />
                    </div>                
                </div>
            </div>
        </form:form>
    </c:if>

    <!--    form cập nhập người ứng tuyển    -->
    <c:if test="${typeUser == 'edit-cadidates'}">
        <form:form method="patch" action="${action}" modelAttribute="user" enctype="multipart/form-data"
                   cssClass="container bg-secondary col-md-8" cssStyle="margin-bottom: 30px;margin-top: 30px;">

            <h3 style="text-align: center; padding-top: 20px; margin: 0;">Tạo mới người ứng tuyển</h3>
            <div class="row" style="padding: 20px;">
                <!--    tài khoản   -->
                <div class="col-md-5  " style="padding: 20px 20px 0;" >
                    <div class="" style="border: 2px solid #dee2e6;border-radius: 7%;">
                        <h2 style="text-align: center;padding: 25px;">Tài khoản</h2>
                        <div class="col-md-9 " style="margin: auto;">
                            <form:input path="username"         id="username"           value="${user.username}"    cssClass="form-control"     placeholder="Tên tài khoản"     type="text"     cssStyle=" margin-bottom: 20px;" />
                            <form:input path="password"         id="password"           cssClass="form-control"     placeholder="Mật khẩu"          type="password" cssStyle=" margin-bottom: 20px;" autocomplete="new-password"/>
                            <form:input path="confirmPassword"  id="confirmPassword"    cssClass="form-control"     placeholder="Nhập lại Mật khẩu" type="password" cssStyle=" margin-bottom: 20px;" autocomplete="new-password"/>
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
                            <label      for="firstName"     class="form-label">Họ</label>
                            <form:input path="firstName"    id="firstName"  value="${user.firstName}"   cssClass="form-control"     placeholder="Họ. . ."       type="text"/>
                        </div>
                        <div class="col-md-2">
                            <label      for="lastName"      class="form-label">Tên</label>
                            <form:input path="lastName"     id="lastName"   value="${user.lastName}"   cssClass="form-control"     placeholder="Tên"           type="text"/>
                        </div>

                        <!--    email   -->
                        <div class="col-md-6">
                            <label      for="mail"      class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text">@</span>
                                <form:input path="mail"     id="mail"       value="${user.mail}" cssClass="form-control"     placeholder=""     type="email"/>
                            </div>
                        </div>
                    </div>

                    <!--    giới tính   &   số điện thoại    -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    giới tính   -->
                        <div class="col-md-5">
                            <label for="validationDefault05" class="form-label">Giới tính</label>
                            <div class="d-flex">
                                <div class="form-check">
                                    <form:radiobutton  path="sex" value="MALE" id="MALE"  cssClass="form-check-input" />
                                    <label class="form-check-label" for="sex" style="margin-right: 20px;">
                                        Nam
                                    </label>
                                </div>
                                <div class="form-check">
                                    <form:radiobutton  path="sex" value="FEMALE" id="FEMALE"  cssClass="form-check-input" />
                                    <label class="form-check-label" for="sex" style="margin-right: 20px;">
                                        Nữ
                                    </label>
                                </div>
                                <div class="form-check">
                                    <form:radiobutton  path="sex" value="NEUTRAL" id="NEUTRAL"  cssClass="form-check-input" />
                                    <label class="form-check-label" for="sex" style="margin-right: 20px;">
                                        Khác
                                    </label>
                                </div>
                            </div>
                        </div>
                        <!--    số điện thoại   -->
                        <div class="col-md-5">
                            <label      for="phone"      class="form-label">Số điện thoại</label>
                            <form:input path="phone"     id="phone"   value="${user.phone}"  cssClass="form-control"       type="text"/>
                        </div>
                    </div>


                    <!--    địa chỉ     &   ảnh đại diện    -->
                    <div class="row" >                
                        <div class="col-md-5">
                            <label for="province" class="form-label">Địa chỉ</label>  
                            <form:select path="province" cssClass="form-control" aria-label=".form-select-sm example" id="province">
                                <option selected>Tỉnh thành</option>
                                <c:forEach var="p" items="${provinces}">
                                    <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="col-md-7">
                            <label for="address" class="form-label">địa chỉ cụ thể</label>
                            <form:textarea path="address"    class="form-control" placeholder="Nhập địa chỉ" type="text" rows="3"/>
                        </div>
                    </div>
                    <div class="row" >
                        <label for="province" class="form-label">Ảnh</label>  
                        <form:input path="file" id="file" class="form-control" type="file" />
                    </div>                
                </div>
            </div>
        </form:form>
    </c:if>

    <!--    form tạo mới nhà tuyển dụng    -->
    <c:if test="${typeUser == 'create-recruiters'}">
        <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data"
                   cssClass="container bg-secondary col-md-8" cssStyle="margin-bottom: 30px;margin-top: 30px;">

            <h3 style="text-align: center; padding-top: 20px; margin: 0;">Tạo mới nhà tuyển dụng</h3>
            <div class="row" style="padding: 20px;">
                <!--    tài khoản   -->
                <div class="col-md-5  " style="padding: 20px 20px 0;" >
                    <div class="" style="border: 2px solid #dee2e6;border-radius: 7%;">
                        <h2 style="text-align: center;padding: 25px;">Tài khoản</h2>
                        <div class="col-md-9 " style="margin: auto;">
                            <form:input path="username"         id="username"           cssClass="form-control"     placeholder="Tên tài khoản"     type="text"     cssStyle=" margin-bottom: 20px;" />
                            <form:input path="password"         id="password"           cssClass="form-control"     placeholder="Mật khẩu"          type="password" cssStyle=" margin-bottom: 20px;" autocomplete=""/>
                            <form:input path="confirmPassword"  id="confirmPassword"    cssClass="form-control"     placeholder="Nhập lại Mật khẩu" type="password" cssStyle=" margin-bottom: 20px;" autocomplete=""/>
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
                            <label for="companyName" class="form-label">Công ty</label>
                            <form:input path="companyName"    id="companyName"  cssClass="form-control"     placeholder="Công ty. . ."       type="text"/>
                        </div>
                    </div>

                    <!--    email   &   số điện thoại    -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    email   -->
                        <div class="col-md-7">
                            <label      for="mail"      class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text">@</span>
                                <form:input path="mail"     id="mail"       cssClass="form-control"     placeholder=""     type="email"/>
                            </div>
                        </div>

                        <!--    số điện thoại   -->
                        <div class="col-md-5">
                            <label      for="phone"      class="form-label">Số điện thoại</label>
                            <form:input path="phone"     id="phone"   cssClass="form-control"       type="text"/>
                        </div>
                    </div>

                    <!--    địa chỉ     &   ảnh đại diện    -->
                    <div class="row" >                
                        <div class="col-md-5">
                            <label for="province" class="form-label">Địa chỉ</label>  
                            <form:select path="province" cssClass="form-control" aria-label=".form-select-sm example" id="province">
                                <option selected>Tỉnh thành</option>
                                <c:forEach var="p" items="${provinces}">
                                    <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="col-md-7">
                            <label for="validationDefault03" class="form-label">địa chỉ cụ thể</label>
                            <form:textarea path="address" class="form-control" placeholder="Nhập địa chỉ" type="text" rows="3"/>
                        </div>
                    </div>
                    <div class="row" >
                        <label for="province" class="form-label">Ảnh</label>  
                        <form:input path="file" id="file" class="form-control" type="file" />
                    </div>                
                </div>
            </div>
        </form:form>
    </c:if>

    <!--    form cập nhập nhà tuyển dụng    -->
    <c:if test="${typeUser == 'edit-recruiters'}">
        <form:form method="patch" action="${action}" modelAttribute="user" enctype="multipart/form-data"
                   cssClass="container bg-secondary col-md-8" cssStyle="margin-bottom: 30px;margin-top: 30px;">

            <h3 style="text-align: center; padding-top: 20px; margin: 0;">Tạo mới nhà tuyển dụng</h3>
            <div class="row" style="padding: 20px;">
                <!--    tài khoản   -->
                <div class="col-md-5  " style="padding: 20px 20px 0;" >
                    <div class="" style="border: 2px solid #dee2e6;border-radius: 7%;">
                        <h2 style="text-align: center;padding: 25px;">Tài khoản</h2>
                        <div class="col-md-9 " style="margin: auto;">
                            <form:input path="username"         id="username"           value="${user.username}"    cssClass="form-control"     placeholder="Tên tài khoản"     type="text"     cssStyle=" margin-bottom: 20px;" />
                            <form:input path="password"         id="password"           value=" "        cssClass="form-control"     placeholder="Mật khẩu"          type="password" cssStyle=" margin-bottom: 20px;" autocomplete="new-password"/>
                            <form:input path="confirmPassword"  id="confirmPassword"    cssClass="form-control"     placeholder="Nhập lại Mật khẩu" type="password" cssStyle=" margin-bottom: 20px;" autocomplete="new-password"/>
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
                            <label for="companyName" class="form-label">Công ty</label>
                            <form:input path="companyName"    id="companyName"  value="${user.companyName}"    cssClass="form-control"     placeholder="Công ty. . ."       type="text"/>
                        </div>
                    </div>

                    <!--    email   &   số điện thoại    -->
                    <div class="row" style=" margin-bottom: 30px;">
                        <!--    email   -->
                        <div class="col-md-7">
                            <label      for="mail"      class="form-label">Email</label>
                            <div class="input-group">
                                <span class="input-group-text">@</span>
                                <form:input path="mail"     id="mail"       value="${user.mail}"     cssClass="form-control"     placeholder=""     type="email"/>
                            </div>
                        </div>

                        <!--    số điện thoại   -->
                        <div class="col-md-5">
                            <label      for="phone"      class="form-label">Số điện thoại</label>
                            <form:input path="phone"     id="phone"   value="${user.phone}"     cssClass="form-control"       type="text"/>
                        </div>
                    </div>

                    <!--    địa chỉ     &   ảnh đại diện    -->
                    <div class="row" >                
                        <div class="col-md-5">
                            <label for="province" class="form-label">Địa chỉ</label>  
                            <form:select path="province" cssClass="form-control" aria-label=".form-select-sm example" id="province">
                                <option selected>Tỉnh thành</option>
                                <c:forEach var="p" items="${provinces}">
                                    <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </form:select>
                        </div>
                        <div class="col-md-7">
                            <label for="validationDefault03" class="form-label">địa chỉ cụ thể</label>
                            <form:textarea path="address"   id="address"   class="form-control" placeholder="Nhập địa chỉ" type="text" rows="3"/>
                        </div>
                    </div>
                    <div class="row" >
                        <label for="province" class="form-label">Ảnh</label>  
                        <form:input path="file" id="file" class="form-control" type="file" />
                    </div>                
                </div>
            </div>
        </form:form>
    </c:if>


</div>
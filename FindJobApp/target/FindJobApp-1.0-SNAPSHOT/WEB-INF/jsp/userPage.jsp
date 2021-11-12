<%-- 
    Document   : userPage
    Created on : Aug 15, 2021, 8:41:10 PM
    Author     : nct68
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<c:if test="${currentUser == null}">
    <h2 class="text-center text-danger font-weight-bold mb-4">BẠN CHƯA ĐĂNG NHẬP</h2>
    <div class="text-center">
        <a href="<c:url value="/login" />" class="btn btn-primary btn-lg">ĐI ĐẾN TRANG ĐĂNG NHẬP</a>
    </div>
</c:if>
<c:if test="${currentUser.id != user.id && currentUser != null}">
    <h2 class="text-center text-danger font-weight-bold mb-4">BẠN KHÔNG ĐỦ QUYỀN TRUY CẬP TRANG NÀY</h2>
    
</c:if>
    
<c:if test="${currentUser.id == user.id}">

    <div class="container-fluid" style="width: 95%">
        <h2 class="text-center text-info font-weight-bold mb-5">TRANG NGƯỜI DÙNG</h2>
        <c:if test="${updateUserError != null}">
            <h4 class="alert alert-danger text-center font-weight-bold text-danger">${updateUserError}</h4>
        </c:if>
        <!-- BUTTON SHOW -->
        <button class="btn btn-info font-weight-bold" id="btn-showUpdateUser" onclick="showUpdateUser()">
            CHỈNH SỬA THÔNG TIN
        </button>
        <div class="container">
            <!-- BUTTON HIDE -->
            <button class="btn btn-secondary font-weight-bold" id="btn-hideUpdateUser" onclick="showUpdateUser()" style="display: none">
                Ẩn
            </button>

            <!-- FORM UPDATE -->
            <div class="card bg-light" id="form-showUpdateUser" style="display: none">
                <h4 class="text-center text-info font-weight-bold">Chỉnh sửa thông tin người dùng</h4>
                <c:url value="/update-user" var="updateUserAction" />
                <form:form method="post" action="${updateUserAction}" modelAttribute="userUpdate" enctype="multipart/form-data">

                    <c:if test="${user.role.toString() == 'ROLE_CANDIDATE'}">
                        <div class="row mt-4">
                            <!-- input first name -->
                            <div class="form-group col-md-6 col-xl-6">
                                <div class="text-info font-weight-bold">Tên</div>
                                <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                         </div>
                                        <form:input path="firstName" class="form-control" value="${user.firstName}" type="text"/>
                                </div>
                                <form:errors path="firstName" cssClass="text-danger" element="div" />
                            </div>

                            <!-- input last name -->
                            <div class="form-group col-md-6 col-xl-6">
                                <div class="text-info font-weight-bold">Họ</div>
                                <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                         </div>
                                        <form:input path="lastName" class="form-control" value="${user.lastName}" type="text"/>
                                </div>
                                <form:errors path="lastName" cssClass="text-danger" element="div" />
                            </div> 

                        </div>
                    </c:if>

                    <c:if test="${user.role.toString() == 'ROLE_RECRUITER'}">
                        <!-- input company name -->
                        <div class="form-group">
                            <div class="text-info font-weight-bold">Tên doanh nghiệp</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-building-o" style="width: 15px"></i> </span>
                                     </div>
                                    <form:input path="companyName" class="form-control" value="${user.companyName}" type="text"/>
                            </div>
                            <form:errors path="companyName" cssClass="text-danger" element="div" />
                        </div>
                    </c:if>

                    <!-- input email -->
                    <div class="form-group">
                        <div class="text-info font-weight-bold">Email</div>
                        <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-envelope" style="width: 15px"></i> </span>
                                 </div>
                                <form:input path="mail" class="form-control" value="${user.mail}" type="email"/>
                        </div>
                        <form:errors path="mail" cssClass="text-danger" element="div" />
                    </div>

                    <div class="row mt-4">

                        <!-- input phone -->
                        <div class="form-group col-md-6 col-xl-8">
                            <div class="text-info font-weight-bold">Số điện thoại</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-phone" style="width: 15px"></i> </span>
                                     </div>
                                    <form:input path="phone" class="form-control" value="${user.phone}" type="phone"/>
                            </div>
                            <form:errors path="phone" cssClass="text-danger" element="div" />
                        </div>

                        <c:if test="${user.role.toString() == 'ROLE_CANDIDATE'}">
                            <!-- select sex -->
                            <div class="form-group col-md-6 col-xl-4">
                                <div class="text-info font-weight-bold">Giới tính</div>
                                <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-venus-mars" style="width: 15px"></i> </span>
                                         </div>
                                        <form:select path="sex" class="form-control" aria-label=".form-select-sm example" id="sex">
                                            <option selected value="${user.sex}">Giới tính</option>
                                            <option value="MALE">Nam</option>
                                            <option value="FEMALE">Nữ</option>
                                            <option value="NEUTRAL">Giới tính khác</option>
                                        </form:select>
                                </div>
                                <form:errors path="sex" cssClass="text-danger" element="div" />
                            </div>
                        </c:if>

                    </div>

                    <div class="row">
                        <!-- input address -->
                        <div class="form-group col-md-8 col-xl-8">
                            <div class="text-info font-weight-bold">Địa chỉ</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-location-arrow " style="width: 15px"></i> </span>
                                     </div>
                                    <form:input path="address" class="form-control" value="${user.location.address}" type="text"/>
                            </div>
                            <form:errors path="address" cssClass="text-danger" element="div" />
                        </div>

                        <!-- select province -->
                        <div class="form-group col-md-4 col-xl-4">
                            <div class="text-info font-weight-bold">Tỉnh thành</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-map-marker" style="width: 15px"></i> </span>
                                     </div>
                                    <form:select path="province" class="form-control" aria-label=".form-select-sm example" id="province">
                                        <option selected value="${user.location.province.id}">Tỉnh thành</option>
                                    <c:forEach var="p" items="${provinces}">
                                        <option value="${p.id}">${p.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <form:errors path="province" cssClass="text-danger" element="div" />
                        </div>

                    </div>

                    <!-- input introduce -->
                    <div class="form-group">
                        <div class="text-info font-weight-bold">Giới thiệu bản thân</div>
                        <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                 </div>
                                <form:input path="introduce" class="form-control" value="${user.introduce}"/>
                        </div>
                    </div>

                    <div class="row">
                        <!-- choose avatar -->
                        <div class="form-group col-md-7 col-xl-7">
                            <div class="text-info font-weight-bold">Ảnh đại diện</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                     </div>
                                    <form:input path="file" class="form-control" type="file"/>
                            </div>
                            <form:errors path="file" cssClass="text-danger" element="div" />
                        </div>

                        <!-- avatar view -->
                        <div class="form-group col-md-5 col-xl-5">
                            <div>
                                <img src="${user.avatar}" class="img-thumbnail rounded" />
                            </div>
                        </div> 
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-info btn-lg">---Cập nhật---</button>
                    </div>
                </form:form>
            </div>
        </div>

        <!-- CANDIDATE -->
        <c:if test="${user.role.toString() == 'ROLE_CANDIDATE'}">
            <div class="card overflow-hidden my-3 container-fluid" style="background-color: windowframe">
                <div class="card-content">
                  <div class="card-body cleartfix">
                    <div class="media align-items-stretch row">
                        <!-- Image -->
                        <c:if test="${user.avatar == null}">
                            <div class="align-self-center col-3">
                                <image src="<c:url value="/images/userDefault.jpg" />" alt="Ảnh" class="img-fluid rounded"/>
                            </div>
                        </c:if>
                        <c:if test="${user.avatar != null}">
                            <div class="align-self-center col-3">
                                <image src="${user.avatar}" alt="Ảnh" class="img-fluid rounded"/>
                            </div>
                        </c:if>
                        <div class="media-body mt-3 col-7">
                            <!-- name -->
                            <h5 class="text-info font-weight-bold">${user.firstName} ${user.lastName}</h5>
                            <!-- gender -->
                            <div class="text-secondary font-weight-bold ml-2">Giới tính: ${user.sex.toString()}</div>
                            <!-- location -->
                            <div class="text-secondary font-weight-bold ml-2">Địa chỉ: ${user.location.address}, ${user.location.province.name}</div>
                            <!-- mail -->
                            <div class="text-secondary font-weight-bold ml-2">Email: ${user.mail}</div>
                            <!-- phone -->
                            <div class="text-secondary font-weight-bold ml-2">Điện thoại: ${user.phone}</div>

                        </div>
                        <div class="font-weight-bold text-secondary col-2 text-right">

                            <a href="<c:url value="/user/${user.username}/apply"/>" class="btn btn-primary mt-3 font-weight-bold">QUẢN LÝ ỨNG TUYỂN</a>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="container-fluid" style="width: 95%">
                <div class="row mt-3" >
                    <!-- col 1 -->
                    <div class="col-md-9 col-xl-9">
                        <h5 class="font-weight-bold text-dark">GIỚI THIỆU</h5>
                        <div class="ml-2">${user.introduce}</div>
                    </div>

                    <!-- col 2 -->
                    <div class="col-md-3 col-xl-3" style="border-left: 1px solid">
                        <h5 class="text-dark font-weight-bold">LỊCH SỬ ỨNG TUYỂN</h5>
                        <c:forEach var="a" items="${applies}">
                            <div class="card bg-light mb-2">
                                <div class="text-info font-weight-bold">${a.recruitment.title}</div>
                                <div class="text-success">${a.title}</div>
                                <div>
                                    <a class="text-white btn btn-secondary btn-sm " href="<c:url value="/user/${user.username}/apply"/>">Xem chi tiết</a>
                                </div>

                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>         
        </c:if>

        <!-- RECRUITER -->
        <c:if test="${user.role.toString() == 'ROLE_RECRUITER'}">
            <div class="card overflow-hidden my-3 container-fluid" style="background-color: windowframe">
                <div class="card-content">
                  <div class="card-body cleartfix">
                    <div class="media align-items-stretch row">
                        <!-- Image -->
                        <c:if test="${user.avatar == null}">
                            <div class="align-self-center col-3">
                                <image src="<c:url value="/images/userDefault.jpg" />" alt="Ảnh" class="img-fluid rounded"/>
                            </div>
                        </c:if>
                        <c:if test="${user.avatar != null}">
                            <div class="align-self-center col-3">
                                <image src="${user.avatar}" alt="Ảnh" class="img-fluid rounded"/>
                            </div>
                        </c:if>
                        <div class="media-body mt-3 col-7">
                            <!-- name -->
                            <h5 class="text-info font-weight-bold">${user.companyName}</h5>
                            <!-- location -->
                            <div class="text-secondary font-weight-bold ml-2">Địa chỉ: ${user.location.address}, ${user.location.province.name}</div>
                            <!-- mail -->
                            <div class="text-secondary font-weight-bold ml-2">Email: ${user.mail}</div>
                            <!-- phone -->
                            <div class="text-secondary font-weight-bold ml-2">Điện thoại: ${user.phone}</div>

                            <!-- Rating -->
                            <div class="text-dark font-weight-bold mt-3">ĐÁNH GIÁ</div>
                            <h3 class="text-info ml-2"><fmt:formatNumber maxFractionDigits="2" value="${ratePointRecruiter}" type="number" /><i class="fa fa-star text-warning" aria-hiden="true"></i></h3>
                            <div class="text-info font-weight-normal font-italic ml-2">${rateCountRecruiter} lượt đánh giá</div>

                        </div>
                        <div class="font-weight-bold text-secondary col-2 text-right">

                            <a href="<c:url value="/user/${user.username}/recruitment"/>" class="btn btn-primary mt-3 font-weight-bold">QUẢN LÝ TUYỂN DỤNG</a>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="container-fluid" style="width: 95%">
                <div class="row mt-3" >
                    <!-- col 1 -->
                    <div class="col-md-9 col-xl-9">
                        <h5 class="font-weight-bold text-dark">GIỚI THIỆU</h5>
                        <div class="ml-2">${user.introduce}</div>
                    </div>

                    <!-- col 2 -->
                    <div class="col-md-3 col-xl-3" style="border-left: 1px solid">
                        <h5 class="text-dark font-weight-bold">CÁC THƯ ỨNG TUYỂN MỚI</h5>
                        <c:forEach var="ra" items="${recApplies}">
                            <div class="card bg-light mb-2">
                                <div class="text-info font-weight-bold">${ra.title}</div>
                                <div class="text-secondary my-date">${ra.createdDate}</div>
                                <div>
                                    <a class="text-white btn btn-secondary btn-sm " href="" data-toggle="modal" data-target="#applyInfoModal-${ra.id}">Xem chi tiết</a>
                                </div>

                            </div>

                            <!-- Apply Info Modal -->
                            <div class="modal fade" id="applyInfoModal-${ra.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLongTitle">THÔNG TIN THƯ ỨNG TUYỂN</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <c:if test="${ra.active == false}">
                                            <div class="text-center text-danger font-weight-bold">${ra.candidate.firstName} ${ra.candidate.lastName} đã thu hồi đơn ứng tuyển này</div>
                                        </c:if>
                                        <div class="modal-body row">
                                            <!-- col 1 -->
                                            <div class="col 5">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <c:if test="${ra.candidate.avatar != null}">
                                                            <img src="${ra.candidate.avatar}" alt="avatar" class="img-fluid"/>
                                                        </c:if>
                                                        <c:if test="${ra.candidate.avatar == null}">
                                                            <img src="<c:url value="/images/userDefault.jpg" />" alt="avatar" class="img-fluid"/>
                                                        </c:if>
                                                    </div>
                                                </div>
                                                
                                                <div class="text-dark font-weight-bold">${ra.candidate.firstName} ${ra.candidate.lastName}</div>
                                                <div class="text-dark">Giới tính: ${ra.candidate.sex.toString()}</div>
                                                <div class="text-dark">Địa chỉ: ${ra.candidate.location.address}, ${ra.candidate.location.province.name}</div>
                                                <div class="text-dark">Email: ${ra.candidate.mail}</div>
                                                <div class="text-dark">Số điện thoại: ${ra.candidate.phone}</div>
                                            </div>

                                            <!-- col 2 -->
                                            <div class="col-7">
                                                <div class="font-weight-bold text-dark">${ra.title}</div>
                                                <div>${ra.content}</div>
                                                <c:if test="${ra.cv == null}">
                                                    <div>---Thư ứng tuyển này không có CV đính kèm---</div>
                                                </c:if>
                                                <c:if test="${ra.cv != null}">
                                                    <a href="${ra.cv}"><img src="${ra.cv}" class="img-fluid rounded"/></a>
                                                </c:if>
                                                <div class="text-secondary font-weight-bold">${ra.createdDate}</div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>         
        </c:if>
    </div>

    <!-- ADMIN -->
    <c:if test="${user.role.toString() == 'ROLE_ADMIN'}">
        <div class="m-4 text-center">
            <a href="<c:url value="/admin"/>" class="btn btn-danger font-weight-bold">ĐI ĐẾN TRANG QUẢN TRỊ</a>
        </div>
    </c:if>
    
    <!-- EMPLOYEE -->
    <c:if test="${user.role.toString() == 'ROLE_EMPLOYEE'}">
        <div class="m-4 text-center">
            <a href="<c:url value="/admin/"/>" class="btn btn-danger font-weight-bold">ĐI ĐẾN TRANG QUẢN TRỊ</a>
        </div>
    </c:if>
</c:if>

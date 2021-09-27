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

<div class="container-fluid" style="width: 95%">
    <h2 class="text-center text-info mb-5">Trang người dùng</h2>
    <!-- CANDIDATE -->
    <c:if test="${user[0].role.toString() == 'CANDIDATE'}">
        <div class="card overflow-hidden my-3 container-fluid" style="background-color: windowframe">
            <div class="card-content">
              <div class="card-body cleartfix">
                <div class="media align-items-stretch row">
                    <!-- Image -->
                    <div class="align-self-center col-3">
                        <image src="${user[0].avatar}" alt="Ảnh" class="img-fluid rounded"/>
                    </div>
                    <div class="media-body mt-3 col-7">
                        <!-- name -->
                        <h5 class="text-info font-weight-bold">${user[0].firstName} ${user[0].lastName}</h5>
                        <!-- gender -->
                        <div class="text-secondary font-weight-bold ml-2">Giới tính: ${user[0].sex.toString()}</div>
                        <!-- location -->
                        <div class="text-secondary font-weight-bold ml-2">Địa chỉ: ${user[0].location.address}, ${user[0].location.province.name}</div>
                        <!-- mail -->
                        <div class="text-secondary font-weight-bold ml-2">Email: ${user[0].mail}</div>
                        <!-- phone -->
                        <div class="text-secondary font-weight-bold ml-2">Điện thoại: ${user[0].phone}</div>

                    </div>
                    <div class="font-weight-bold text-secondary col-2 text-right">
                        <!-- Button add recruitment modal -->
                        <button type="button" class="btn btn-info mt-3 font-weight-bold" data-toggle="modal" data-target="#updateUserModal">
                            Chỉnh sửa thông tin
                        </button>
                        
                        <a href="/FindJobApp/user/${user[0].username}/apply" class="btn btn-primary mt-3 font-weight-bold">Quản lý ứng tuyển</a>
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
                </div>

                <!-- col 2 -->
                <div class="col-md-3 col-xl-3" style="border-left: 1px solid">
                    <h5 class="text-dark font-weight-bold">LỊCH SỬ ỨNG TUYỂN</h5>
                    <c:forEach var="a" items="${applies}">
                        <div class="card bg-light mb-2">
                            <div class="text-info font-weight-bold">${a.recruitment.title}</div>
                            <div class="text-success">${a.title}</div>
                            <div>
                                <a class="text-white btn btn-secondary btn-sm " href="#">Xem chi tiết</a>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>         
    </c:if>

    <!-- RECRUITER -->
    <c:if test="${user[0].role.toString() == 'RECRUITER'}">
        <div class="card overflow-hidden my-3 container-fluid" style="background-color: windowframe">
            <div class="card-content">
              <div class="card-body cleartfix">
                <div class="media align-items-stretch row">
                    <!-- Image -->
                    <div class="align-self-center col-3">
                        <image src="${user[0].avatar}" alt="Ảnh" class="img-fluid rounded"/>
                    </div>
                    <div class="media-body mt-3 col-7">
                        <!-- name -->
                        <h5 class="text-info font-weight-bold">${user[0].companyName}</h5>
                        <!-- location -->
                        <div class="text-secondary font-weight-bold ml-2">Địa chỉ: ${user[0].location.address}, ${user[0].location.province.name}</div>
                        <!-- mail -->
                        <div class="text-secondary font-weight-bold ml-2">Email: ${user[0].mail}</div>
                        <!-- phone -->
                        <div class="text-secondary font-weight-bold ml-2">Điện thoại: ${user[0].phone}</div>

                        <!-- Rating -->
                        <div class="text-dark font-weight-bold mt-3">ĐÁNH GIÁ</div>
                        <h3 class="text-info ml-2"><fmt:formatNumber maxFractionDigits="2" value="${ratePointRecruiter}" type="number" /><i class="fa fa-star text-warning" aria-hiden="true"></i></h3>
                        <div class="text-info font-weight-normal font-italic ml-2">${rateCountRecruiter} lượt đánh giá</div>

                    </div>
                    <div class="font-weight-bold text-secondary col-2 text-right">
                        <!-- Button add recruitment modal -->
                        <button type="button" class="btn btn-info mt-3 font-weight-bold" data-toggle="modal" data-target="#updateUserModal">
                            Chỉnh sửa thông tin
                        </button>
                        
                        <a href="/FindJobApp/user/${user[0].username}/recruitment" class="btn btn-primary mt-3 font-weight-bold">Quản lý tuyển dụng</a>
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
                </div>

                <!-- col 2 -->
                <div class="col-md-3 col-xl-3" style="border-left: 1px solid">
                    <h5 class="text-dark font-weight-bold">CÁC TIN ĐANG TUYỂN DỤNG</h5>
                    <c:forEach var="rec" items="${recPost}">
                        <div class="card bg-light mb-2">
                            <div class="text-info font-weight-bold">${rec.title}</div>
                            <div>
                                <a class="text-white btn btn-secondary btn-sm " href="/FindJobApp/recruitment/${rec.id}">Xem chi tiết</a>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>         
    </c:if>
</div>

<!-- ADMIN -->
<c:if test="${user[0].role.toString() == 'ADMIN'}">
    <div class="m-4 text-center">
        <a href="/FindJobApp/admin" class="btn btn-danger font-weight-bold">Đi đến trang quản trị</a>
    </div>
</c:if>

                
                <!-- MODAL -->           

<!-- Update User modal -->
<div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <c:url value="/updateUser" var="updateUserAction" />
            <form:form method="post" action="${updateUserAction}" modelAttribute="userUpdate" enctype="multipart/form-data">
                <div class="modal-header">
                    <h4 class="modal-title text-info font-weight-bold" id="exampleModalLongTitle">Chỉnh sửa thông tin người dùng</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="p-2">
                        <c:if test="${user[0].role.toString() == 'CANDIDATE'}">
                            <div class="row mt-4">
                                <!-- input first name -->
                                <div class="form-group col-md-6 col-xl-6">
                                    <div class="text-info font-weight-bold">Tên</div>
                                    <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                             </div>
                                            <form:input path="firstName" class="form-control" value="${user[0].firstName}" type="text"/>
                                    </div>
                                </div>

                                <!-- input last name -->
                                <div class="form-group col-md-6 col-xl-6">
                                    <div class="text-info font-weight-bold">Họ</div>
                                    <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                             </div>
                                            <form:input path="lastName" class="form-control" value="${user[0].lastName}" type="text"/>
                                    </div>
                                </div> 

                            </div>
                        </c:if>

                        <c:if test="${user[0].role.toString() == 'RECRUITER'}">
                            <!-- input company name -->
                            <div class="form-group">
                                <div class="text-info font-weight-bold">Tên doanh nghiệp</div>
                                <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-building-o" style="width: 15px"></i> </span>
                                         </div>
                                        <form:input path="companyName" class="form-control" value="${user[0].companyName}" type="text"/>
                                </div>
                            </div>
                        </c:if>

                        <!-- input email -->
                        <div class="form-group">
                            <div class="text-info font-weight-bold">Email</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-envelope" style="width: 15px"></i> </span>
                                     </div>
                                    <form:input path="mail" class="form-control" value="${user[0].mail}" type="email"/>
                            </div>
                        </div>

                        <div class="row mt-4">

                            <!-- input phone -->
                            <div class="form-group col-md-6 col-xl-8">
                                <div class="text-info font-weight-bold">Số điện thoại</div>
                                <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-phone" style="width: 15px"></i> </span>
                                         </div>
                                        <form:input path="phone" class="form-control" value="${user[0].phone}" type="phone"/>
                                </div>
                            </div>

                            <c:if test="${user[0].role.toString() == 'CANDIDATE'}">
                                <!-- select sex -->
                                <div class="form-group col-md-6 col-xl-4">
                                    <div class="text-info font-weight-bold">Giới tính</div>
                                    <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"> <i class="fa fa-venus-mars" style="width: 15px"></i> </span>
                                             </div>
                                            <form:select path="sex" class="form-control" aria-label=".form-select-sm example" id="sex">
                                                <option selected>Giới tính</option>
                                                <option value="0">Nam</option>
                                                <option value="1">Nữ</option>
                                                <option value="2">Giới tính khác</option>
                                            </form:select>
                                    </div>
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
                                        <form:input path="address" class="form-control" value="${user[0].location.address}" type="text"/>
                                </div>
                            </div>

                            <!-- select province -->
                            <div class="form-group col-md-4 col-xl-4">
                                <div class="text-info font-weight-bold">Tỉnh thành</div>
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
                            <!-- choose avatar -->
                            <div class="form-group col-md-7 col-xl-7">
                                <div class="text-info font-weight-bold">Ảnh đại diện</div>
                                <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text"> <i class="fa fa-user" style="width: 15px"></i> </span>
                                         </div>
                                        <form:input path="file" class="form-control" type="file"/>
                                </div>
                            </div>

                            <!-- avatar view -->
                            <div class="form-group col-md-5 col-xl-5">
                                <div>
                                    <img src="${user[0].avatar}" class="img-thumbnail rounded" />
                                </div>
                            </div> 

                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-info btn-lg">Cập nhật</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
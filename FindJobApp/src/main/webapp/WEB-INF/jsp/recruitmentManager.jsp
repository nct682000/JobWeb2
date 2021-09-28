<%-- 
    Document   : recruitmentManager
    Created on : Aug 16, 2021, 7:25:45 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<div class="container-fluid" style="width: 95%">
    <h2 class="text-center text-primary mb-4">TRANG QUẢN LÝ TUYỂN DỤNG</h2>
    <c:if test="${errMsg != null}">
        <h3 class="alert alert-danger text-center font-weight-bold text-danger">${errMsg}</h3>
    </c:if>
    
    <h4 class="text-info ml-3 ">CÁC TIN ĐÃ ĐĂNG</h4>
    <table class="table align-middle">
        <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">TIÊU ĐỀ</th>
                <th scope="col">NGÀNH NGHỀ</th>
                <th scope="col">CHỨC VỤ</th>
                <th class="text-center" scope="col">LƯỢT ỨNG TUYỂN</th>
                <th class="text-center" scope="col">TRẠNG THÁI</th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="r" items="${recRecruitments}" >
                <tr>
                    <th class="align-middle" scope="row">${r.id}</th>
                    <td class="align-middle">${r.title}</td>
                    <td class="align-middle">${r.career.name}</td>
                    <td class="align-middle">${r.form.toString()}</td>
                    <td class="align-middle text-center text-info font-weight-bold">apply</td>
                    <c:if test="${r.active == true}">
                        <td class="align-middle text-center"><i class="fa fa-check-square text-primary"></i></td>
                        <td class="align-middle"><button class="btn btn-danger" onclick="hideRecruitment(${r.id})">Tắt tuyển dụng</button></td>
                    </c:if>
                    <c:if test="${r.active == false}">
                        <td class="align-middle text-center"><i class="fa fa-window-close text-danger"></i></td>
                        <td class="align-middle"><button class="btn btn-primary">Bật tuyển dụng</button></td>
                    </c:if>
                        <td class="align-middle text-center"><button class="btn btn-info"><i class="fa fa-edit"></i></button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="row">
        
        <!-- col 1 -->
        <div class="col-6">
            <button class="btn btn-lg btn-primary m-3" id="btn-showAddRecruitment" onclick="showAddRecruitment()">
                Thêm tin tuyển dụng mới
            </button>
            <button class="btn btn-lg btn-secondary m-3" id="btn-hiddenAddRecruitment" onclick="showAddRecruitment()" style="display: none">
                Ẩn
            </button>
            
            <c:if test="${errMsg != null}">
                <div class="alert alert-danger text-center text-danger">${errMsg}</div>
            </c:if>
                
            <div id="form-showAddRecruitment" style="display: none" class="bg-light p-3">
                <h4 class="text-info text-center">Thêm tin tuyển dụng mới</h4>
                <c:url value="/user/${currentUser.username}/recruitment" var="addRecruitmentAction" />
                <form:form method="post" action="${addRecruitmentAction}" modelAttribute="recruitment" enctype="multipart/form-data">

                        <!-- input title  -->
                    <div class="form-group">
                        <div class="text-primary font-weight-bold">Tiêu đề</div>
                        <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-file-text-o " style="width: 15px"></i> </span>
                                 </div>
                                <form:input path="title" class="form-control" type="text"/>
                        </div>
                        <form:errors path="title" cssClass="text-danger" element="div" />
                    </div>

                    <!-- Salary -->  
                    <div class="row mt-4">

                        <!-- input salary from --> 
                        <div class="form-group col-6">
                            <div class="text-primary font-weight-bold">Mức lương khởi đầu</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-money" style="width: 15px"></i> </span>
                                     </div>
                                    <form:input path="salaryFrom" class="form-control" type="phone"/>
                            </div>
                            <form:errors path="salaryFrom" cssClass="text-danger" element="div" />
                        </div>

                        <!-- input salary from -->  
                        <div class="form-group col-6">
                            <div class="text-primary font-weight-bold">Mức lương kết thúc</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-money" style="width: 15px"></i> </span>
                                     </div>
                                    <form:input path="salaryTo" class="form-control" type="phone"/>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <!-- select form -->  
                        <div class="form-group col-6">
                            <div class="text-primary font-weight-bold">Chức vụ</div>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-briefcase" style="width: 15px"></i> </span>
                                 </div>
                                <form:select path="form" class="form-control" aria-label=".form-select-sm example">
                                    <option value="">--Chọn chức vụ--</option>
                                    <option value="INTERN">Thực tập sinh</option>
                                    <option value="GRADUATED">Mới ra trường</option>
                                    <option value="STAFF">Nhân viên</option>
                                    <option value="LEADER">Trưởng nhóm</option>
                                    <option value="MANAGER">Quản lý</option>
                                    <option value="SENIOR_MANAGER">Quản lý cấp cao</option>
                                    <option value="EXECUTIVES">Giám đốc điều hành</option>
                                </form:select>
                            </div>
                            <form:errors path="form" cssClass="text-danger" element="div" />
                        </div>

                        <!-- select career --> 
                        <div class="form-group col-6">
                            <div class="text-primary font-weight-bold">Ngành nghề</div>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-cogs" style="width: 15px"></i> </span>
                                 </div>
                                <form:select path="career" class="form-control" aria-label=".form-select-sm example">
                                    <option value="">--Chọn ngành nghề--</option>
                                    <c:forEach var="c" items="${careers}">
                                    <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <form:errors path="career" cssClass="text-danger" element="div" />
                        </div>
                    </div>

                        <!-- input description --> 
                    <div class="form-group">
                        <div class="text-primary font-weight-bold">Chi tiết</div>
                        <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-file-text" style="width: 15px"></i> </span>
                                 </div>
                                <form:textarea path="description" class="form-control" type="text"/>
                        </div>
                    </div>

                    <div class="text-center">
                        <input type="submit" class="btn btn-primary btn-block btn-lg" value="Thêm tin">
                    </div>
                </form:form>
            </div>
        </div>
                
                <!-- col 2 -->
        <div class="col-6">
            <button class="btn btn-lg btn-info m-3" id="btn-showUpdateRecruitment" onclick="showUpdateRecruitment()">
                Cập nhật tin tuyển dụng
            </button>
            <button class="btn btn-lg btn-secondary m-3" id="btn-hiddenUpdateRecruitment" onclick="showUpdateRecruitment()" style="display: none">
                Ẩn
            </button>
            <%--<c:if test="${errMsg != null}">--%>
                <!--<div class="alert alert-danger">${errMsg}</div>-->
            <%--</c:if>--%>
            <div id="form-showUpdateRecruitment" style="display: none" class="bg-light p-3">
                <h4 class="text-info text-center">Cập nhật tin tuyển dụng</h4>
                <c:url value="/user/${currentUser.username}/recruitment" var="addRecruitmentAction" />
                <form:form method="post" action="${addRecruitmentAction}" modelAttribute="recruitment" enctype="multipart/form-data">

                        <!-- input title  -->
                    <div class="form-group">
                        <div class="text-primary font-weight-bold">Tiêu đề</div>
                        <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-file-text-o " style="width: 15px"></i> </span>
                                 </div>
                                <form:input path="title" class="form-control" type="text"/>
                        </div>
                        <form:errors path="title" cssClass="text-danger" element="div" />
                    </div>

                    <!-- Salary -->  
                    <div class="row mt-4">

                        <!-- input salary from --> 
                        <div class="form-group col-6">
                            <div class="text-primary font-weight-bold">Mức lương khởi đầu</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-money" style="width: 15px"></i> </span>
                                     </div>
                                    <form:input path="salaryFrom" class="form-control" type="phone"/>
                            </div>
                            <form:errors path="salaryFrom" cssClass="text-danger" element="div" />
                        </div>

                        <!-- input salary from -->  
                        <div class="form-group col-6">
                            <div class="text-primary font-weight-bold">Mức lương kết thúc</div>
                            <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-money" style="width: 15px"></i> </span>
                                     </div>
                                    <form:input path="salaryTo" class="form-control" type="phone"/>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <!-- select form -->  
                        <div class="form-group col-6">
                            <div class="text-primary font-weight-bold">Chức vụ</div>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-briefcase" style="width: 15px"></i> </span>
                                 </div>
                                <form:select path="form" class="form-control" aria-label=".form-select-sm example">
                                    <option value="">--Chọn chức vụ--</option>
                                    <option value="INTERN">Thực tập sinh</option>
                                    <option value="GRADUATED">Mới ra trường</option>
                                    <option value="STAFF">Nhân viên</option>
                                    <option value="LEADER">Trưởng nhóm</option>
                                    <option value="MANAGER">Quản lý</option>
                                    <option value="SENIOR_MANAGER">Quản lý cấp cao</option>
                                    <option value="EXECUTIVES">Giám đốc điều hành</option>
                                </form:select>
                            </div>
                            <form:errors path="form" cssClass="text-danger" element="div" />
                        </div>

                        <!-- select career --> 
                        <div class="form-group col-6">
                            <div class="text-primary font-weight-bold">Ngành nghề</div>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-cogs" style="width: 15px"></i> </span>
                                 </div>
                                <form:select path="career" class="form-control" aria-label=".form-select-sm example">
                                    <option value="">--Chọn ngành nghề--</option>
                                    <c:forEach var="c" items="${careers}">
                                    <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <form:errors path="career" cssClass="text-danger" element="div" />
                        </div>
                    </div>

                        <!-- input description --> 
                    <div class="form-group">
                        <div class="text-primary font-weight-bold">Chi tiết</div>
                        <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"> <i class="fa fa-file-text" style="width: 15px"></i> </span>
                                 </div>
                                <form:textarea path="description" class="form-control" type="text"/>
                        </div>
                    </div>

                    <div class="text-center">
                        <input type="submit" class="btn btn-info btn-block btn-lg" value="Cập nhật">
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
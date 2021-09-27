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

<h2 class="text-center text-primary">TRANG QUẢN LÝ TUYỂN DỤNG</h2>

<button class="btn btn-lg btn-primary" id="btn-showAddRecruitment" onclick="showAddRecruitment()">
    Thêm tin tuyển dụng mới
</button>
<button class="btn btn-lg btn-secondary" id="btn-hiddenAddRecruitment" onclick="showAddRecruitment()" style="display: none">
    Ẩn
</button>
<div id="form-showAddRecruitment" style="display: none" class="bg-light p-3">
    <h4 class="text-info text-center">Thêm tin tuyển dụng mới</h4>
    <c:url value="/user/${currentUser.username}/recruitment" var="addRecruitmentAction" />
    <form:form method="post" action="${addRecruitmentAction}" modelAttribute="recruitment" enctype="multipart/form-data">

        <c:if test="${errMsg != null}">
            <div class="alert alert-danger">${errMsg}</div>
        </c:if>

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
                    <form:input path="description" class="form-control" type="text"/>
            </div>
        </div>

        <div class="text-center">
            <input type="submit" class="btn btn-primary btn-block btn-lg" value="Thêm tin">
        </div>
    </form:form>
</div>
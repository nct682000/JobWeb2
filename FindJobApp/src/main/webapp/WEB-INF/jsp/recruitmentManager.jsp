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
        <h2 class="text-center text-primary font-weight-bold">TRANG QUẢN LÝ TUYỂN DỤNG</h2>

        <div class="row">

            <!-- col 1 -->
            <div class="col-5 mt-3">
                <!--<button class="btn btn-lg btn-primary font-weight-bold m-3" id="btn-showAddRecruitment" onclick="showAddRecruitment()">
                    THÊM TIN TUYỂN DỤNG MỚI
                </button>
                <button class="btn btn-lg btn-secondary m-3 font-weight-bold" id="btn-hiddenAddRecruitment" onclick="showAddRecruitment()" style="display: none">
                    ẨN
                </button>-->
                <h4 class="font-weight-bold">THÊM TIN TUYỂN DỤNG MỚI</h4>

                <c:if test="${errMsg != null}">
                    <div class="alert alert-danger text-center text-danger font-weight-bold">${errMsg}</div>
                </c:if>

                <div class="bg-light p-3">
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

                        <div class="form-group">
                            <div class="text-primary font-weight-bold">Thêm nhãn</div>
                            <div class="input-group">
                                <select  multiple data-live-search="true">
                                    <option>Mustard</option>
                                    <option>Ketchup</option>
                                    <option>Relish</option>
                                </select>
                            </div>
                        </div>


                        <div class="text-center">
                            <input type="submit" class="btn btn-primary font-weight-bold btn-block btn-lg" value="THÊM TIN">
                        </div>
                    </form:form>

                </div>
            </div>

            <!-- col 2 -->
            <div class="col-7 mt-3">
                <h4 class="font-weight-bold">THỐNG KÊ ỨNG TUYỂN</h4>
                <div class="bg-light">
                    <form class="form-group font-weight-bold">
                        <div class="row">
                            <div class="col-5">
                                <div>Ngày bắt đầu:</div>
                                <input type="date" name="from" class="form-control">
                            </div>
                            <div class="col-5">
                                <div>Ngày kết thúc:</div>
                                <input type="date" name="to" class="form-control">
                            </div>
                            <div class="col-2">
                                <div>.</div>
                                <input type="submit" value="Xem" class="form-control btn btn-primary font-weight-bold">
                            </div>
                        </div>

                    </form>
                    <canvas id="myRecruitmentStatsChart"></canvas>
                </div>
            </div>
        </div>

        <h4 class="font-weight-bold ">CÁC TIN ĐÃ ĐĂNG</h4>
        <table class="table align-middle bg-light">
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
                        <td class="align-middle"><a href="<c:url value="/recruitment/${r.id}" />">${r.title}</a></td>
                        <td class="align-middle">${r.career.name}</td>
                        <td class="align-middle">${r.form.toString()}</td>
                        <td class="align-middle text-center">
                            <div class="dropdown">
                                <button class="btn dropdown-toggle text-info font-weight-bold" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    ${r.applies.size()}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <c:forEach var="ra" items="${r.applies}">
                                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#applyInfoModal-${ra.id}">từ ${ra.candidate.firstName} ${ra.candidate.lastName}</a>
                                    </c:forEach>
                                </div>
                            </div>
                        </td>
                        <c:if test="${r.active == true}">
                            <td class="align-middle text-center" id="icon-active-show-${r.id}"><i class="fa fa-check-square text-primary"></i></td>
                            <td class="align-middle"><button class="btn text-white" onclick="switchActiveRecruitment(${r.id})" id="btn-active-show-${r.id}" style="background-color: rgb(220, 53, 69)">Tắt tuyển dụng</button></td>
                        </c:if>
                        <c:if test="${r.active == false}">
                            <td class="align-middle text-center" id="icon-active-hide-${r.id}"><i class="fa fa-window-close text-danger"></i></td>
                            <td class="align-middle"><button class="btn text-white" onclick="switchActiveRecruitment(${r.id})" id="btn-active-hide-${r.id}"  style="background-color: rgb(0, 123, 255)">Bật tuyển dụng</button></td>
                        </c:if>
                        <td class="align-middle text-center"><button class="btn btn-info" data-toggle="modal" data-target="#recruitmentUpdateModal-${r.id}"><i class="fa fa-edit"></i></button></td>
                    </tr>

                    <!-- Recruitment Update Modal -->
                    <div class="modal fade" id="recruitmentUpdateModal-${r.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                            <div class="modal-content">
                                <c:url value="/user/${currentUser.username}/recruitment" var="addRecruitmentAction" />
                                <form:form method="post" action="${addRecruitmentAction}" modelAttribute="recruitment" enctype="multipart/form-data">
                                    <div class="modal-header">
                                        <h5 class="modal-title text-info font-weight-bold" id="exampleModalLongTitle">CẬP NHẬT TIN TUYỂN DỤNG</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- input title  -->
                                        <div class="form-group">
                                            <div class="text-info font-weight-bold">Tiêu đề</div>
                                            <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"> <i class="fa fa-file-text-o " style="width: 15px"></i> </span>
                                                     </div>
                                                    <form:input path="title" class="form-control" type="text" value="${r.title}"/>
                                            </div>
                                            <form:errors path="title" cssClass="text-danger" element="div" />
                                        </div>

                                        <!-- Salary -->  
                                        <div class="row mt-4">

                                            <!-- input salary from --> 
                                            <div class="form-group col-6">
                                                <div class="text-info font-weight-bold">Mức lương khởi đầu</div>
                                                <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"> <i class="fa fa-money" style="width: 15px"></i> </span>
                                                         </div>
                                                        <form:input path="salaryFrom" class="form-control" type="phone" value="${r.salaryFrom}"/>
                                                </div>
                                                <form:errors path="salaryFrom" cssClass="text-danger" element="div" />
                                            </div>

                                            <!-- input salary from -->  
                                            <div class="form-group col-6">
                                                <div class="text-info font-weight-bold">Mức lương kết thúc</div>
                                                <div class="input-group">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text"> <i class="fa fa-money" style="width: 15px"></i> </span>
                                                         </div>
                                                        <form:input path="salaryTo" class="form-control" type="phone" value="${r.salaryTo}"/>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <!-- select form -->  
                                            <div class="form-group col-6">
                                                <div class="text-info font-weight-bold">Chức vụ</div>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"> <i class="fa fa-briefcase" style="width: 15px"></i> </span>
                                                     </div>
                                                    <form:select path="form" class="form-control" aria-label=".form-select-sm example">
                                                        <option value="${r.form}">--Chọn chức vụ--</option>
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
                                                <div class="text-info font-weight-bold">Ngành nghề</div>
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"> <i class="fa fa-cogs" style="width: 15px"></i> </span>
                                                     </div>
                                                    <form:select path="career" class="form-control" aria-label=".form-select-sm example">
                                                        <option value="${r.career.id}">--Chọn ngành nghề--</option>
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
                                            <div class="text-info font-weight-bold">Chi tiết</div>
                                            <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"> <i class="fa fa-file-text" style="width: 15px"></i> </span>
                                                     </div>
                                                    <form:input path="description" class="form-control" type="textarea" value="${r.description}"/>
                                            </div>
                                        </div>
                                    </div>
                                            <!-- ID -->
                                            <form:input path="id" type="hidden" value="${r.id}" />
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary btn-lg font-weight-bold" data-dismiss="modal">HỦY</button>
                                        <input type="submit" class="btn btn-info btn-lg font-weight-bold" value="CẬP NHẬT">
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                </c:forEach>
            </tbody>
        </table>

    </div>
</c:if>
                

<!-- MODAL -->
<!-- Apply Info Modals -->
<c:forEach var="r" items="${recRecruitments}">
    <c:forEach var="ra" items="${r.applies}">
        <div class="modal fade" id="applyInfoModal-${ra.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">THÔNG TIN THƯ ỨNG TUYỂN</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body row">

                        <!-- col 1 -->
                        <div class="col 5">
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
</c:forEach>

<!-- SCRIPT -->
<script>
    let recruitmentLabels=[], recruitmentInfo=[]
    <c:forEach var="r" items="${recruitmentStats}">
        console.info(${r[0]})
        recruitmentLabels.push('${r[1]}')
        recruitmentInfo.push(${r[2]})
    </c:forEach>
    
    window.onload = function(){
        recruitmentChart("myRecruitmentStatsChart", recruitmentLabels, recruitmentInfo)
    }
</script>
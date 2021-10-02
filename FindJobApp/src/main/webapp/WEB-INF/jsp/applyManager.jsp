<%-- 
    Document   : applyManager
    Created on : Aug 18, 2021, 2:47:28 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<div class="container-fluid" style="width: 95%">
    <h2 class="text-info text-center">TRANG QUẢN LÝ ỨNG TUYỂN</h2>
    <c:if test="${errMsg != null}">
        <h3 class="alert alert-danger text-center font-weight-bold text-danger">${errMsg}</h3>
    </c:if>
    
    <h4 class="text-info ml-3 ">CÁC TIN ĐÃ ĐĂNG</h4>
    <table class="table align-middle">
        <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">CHỦ ĐỀ</th>
                <th scope="col">CÔNG VIỆC</th>
                <th scope="col">DOANH NGHIỆP</th>
                <th class="text-center" scope="col">NGÀY ỨNG TUYỂN</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="a" items="${myApplies}" >
                <tr>
                    <th class="align-middle" scope="row">${a.id}</th>
                    <td class="align-middle"><a class="text-info font-weight-bold" href="#" data-toggle="modal" data-target="#applyInfoModal-${a.id}">${a.title}</a></td>
                    <td class="align-middle"><a href="/FindJobApp/recruitment/${a.recruitment.id}">${a.recruitment.title}</a></td>
                    <td class="align-middle"><a href="/FindJobApp/recruiter/${a.recruitment.recruiter.id}">${a.recruitment.recruiter.companyName}</a></td>
                    <td class="align-middle text-center">${a.createdDate}</td>
                    <td class="align-middle"><button class="btn btn-danger">Xóa</button></td>
                </tr>
                
                <!-- Apply Info Modal -->
                <div class="modal fade" id="applyInfoModal-${a.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Thông tin đơn ứng tuyển</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body text-center">
                                <div class="font-weight-bold text-dark">${a.title}</div>
                                <div>${a.content}</div>
                                <img src="${a.cv}" class="img-fluid rounded"/>
                                <div class="text-right mr-3">${a.createdDate}</div>
                            </div>
                            <div class="modal-footer">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </tbody>
    </table>
</div>


<!-- MODAL -->

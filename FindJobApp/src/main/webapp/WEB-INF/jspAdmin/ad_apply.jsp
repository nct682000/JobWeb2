<%-- 
    Document   : ad_apply
    Created on : Sep 9, 2021, 3:11:01 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div class="content" id="main">
    <h1>${fullName}</h1>
    <div class="container-fluid">

        <div class="row" style="transition: 0.4s">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-primary row">
                        <h4 class="card-title col">Thông tin khách hàng</h4>

                        <!--    lọc người ứng tuyển || người tuyển chọn     -->
                        <div class="col">
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">RECRUITER</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">CANDIDATE</a>
                                </li>
                            </ul>
                        </div>

                        <!--    tìm kiếm    -->
                        <div class="simple-search col">
                            <input type="email" placeholder="name . . ."/>
                            <button class="fa fa-search"></button>
                        </div>

                        <!--    lọc theo công ty    -->
                        <div class="col">
                            <select class="form-select" aria-label="Default select example">
                                <option selected>Công ty</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>

                        <!--    phân trang      -->
                        <div class="col">
                            <div class="row">
                                <div class="col-9">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination">
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                                                <li class="page-item"><a class="page-link" href="<c:url value="/admin/applies" />?page=${i}">${i}</a></li>
                                                </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>

                                <!--    btn add     -->
                                <div class="col-3">
                                    <a href="/FindJobApp/admin/customers/add-user" class="bi bi-plus btn btn-lg btn-outline-success"></a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="table-responsive">
                        <table class="table">
                            <thead class="table-dark">
                            <th>
                                Tiêu đề
                            </th>
                            <th>
                                Nội dung
                            </th>
                            <th>
                                CV
                            </th>
                            <th>
                                Ngày đăng
                            </th>
                            <th>
                                Trong tin tuyển dụng
                            </th>
                            <th>
                                Đăng bởi
                            </th>
                            <th>
                                
                            </th>                            
                            </thead>
                            <tbody>
                                <c:forEach items="${applys}" var="a" >
                                    <c:choose>
                                        <c:when test="${a.id % 2 == 0}">
                                            <tr class="">
                                                <td class="text-primary">
                                                    ${a.title} 
                                                </td>
                                                <td>
                                                    ${a.content}
                                                </td>                                            
                                                <td>
                                                    file cv  
                                                </td>
                                                <td>
                                                    ${a.createdDate} 
                                                </td>
                                                <td>
                                                    link tin tuyển dụng 
                                                </td>
                                                <td>
                                                    tên người dùng
                                                </td>
                                                <td>
                                                    <!--<button class="bi bi-trash-fill" onclick="deleteTinTuc(${u.id})"></button>-->
                                                    <div class="d-flex">
                                                        <button class="btn btn-success">Enable</button>
                                                        <button class="bi bi-pencil-fill btn"></button>
                                                        <button class="bi bi-trash-fill btn"></button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${a.id % 2 != 0}">
                                            <tr class="table-secondary text-dark">
                                                <td class="text-primary">
                                                    ${a.title} 
                                                </td>
                                                <td>
                                                    ${a.content}
                                                </td>                                            
                                                <td>
                                                    file cv  
                                                </td>
                                                <td>
                                                    ${a.createdDate} 
                                                </td>
                                                <td>
                                                    link tin tuyển dụng 
                                                </td>
                                                <td>
                                                    tên người dùng
                                                </td>
                                                <td>
                                                    <!--<button class="bi bi-trash-fill" onclick="deleteTinTuc(${u.id})"></button>-->
                                                    <div class="d-flex">
                                                        <button class="btn btn-success">Enable</button>
                                                        <button class="bi bi-pencil-fill btn"></button>
                                                        <button class="bi bi-trash-fill btn"></button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

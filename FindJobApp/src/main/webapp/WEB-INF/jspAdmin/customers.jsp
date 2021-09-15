<%-- 
    Document   : customers
    Created on : Aug 19, 2021, 3:43:35 PM
    Author     : DELL
--%>

<link
    rel="stylesheet"  href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"  integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
    crossOrigin="anonymous"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="content" id="main">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-primary row">
                        <!--    lọc người ứng tuyển || người tuyển chọn     -->
                        <div class="col-4">
                            <div class="row">
                                <c:if test="${typeUser == 'cadidates'}">
                                    <div class="col btn btn-lg btn-outline-success active">Người ứng tuyển</div>
                                    <a href="/FindJobApp/admin/customers/recruiters" 
                                       class="col btn btn-lg btn-outline-success">Nhà tuyển dụng</a>
                                </c:if>
                                <c:if test="${typeUser == 'recruiters'}">
                                    <a href="/FindJobApp/admin/customers/cadidates" 
                                       class="col btn btn-lg btn-outline-success ">Người ứng tuyển</a>
                                    <div class="col btn btn-lg btn-outline-success active">Nhà tuyển dụng</div>
                                </c:if>
                            </div>
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
                                                <li class="page-item"><a class="page-link" href="<c:url value="/admin/customers/cadidates" />?page=${i}">${i}</a></li>
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


                    <!--    Bảng dữ liệu      -->
                    <div class="table-responsive">
                        <!--    Người ứng tuyển      -->
                        <c:if test="${typeUser == 'cadidates'}">
                            <table class="table">
                                <thead class="table-dark">
                                <th>
                                    Tên đăng nhập
                                </th>
                                <th>
                                    Tên khách hàng
                                </th>
                                <th>
                                    Giới tính
                                </th>
                                <th>
                                    Email
                                </th>
                                <th>
                                    Số điện thoại
                                </th>
                                <th>
                                    Địa chỉ
                                </th>
                                <th>
                                    Hoạt động
                                </th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${users}" var="u">                                        
                                        <tr class="table-secondary text-dark">
                                            <td class="text-primary">
                                                <a href="/FindJobApp/admin/customers/${u.username}" class="text-dark">${u.username}</a>
                                            </td>                                            
                                            <td>
                                                ${u.firstName}  ${u.lastName}  
                                            </td>
                                            <td>
                                                <c:if test="${u.sex == 'MALE'}">
                                                    Nam
                                                </c:if>
                                                <c:if test="${u.sex == 'FEMALE'}">
                                                    Nữ
                                                </c:if>
                                                <c:if test="${u.sex == 'NEUTRAL'}">
                                                    Khác
                                                </c:if>
                                            </td>
                                            <td>
                                                ${u.mail} 
                                            </td>
                                            <td>
                                                ${u.phone} 
                                            </td>
                                            <td>
                                                ${u.location.address},  ${u.location.province.name}
                                            </td>
                                            <td>
                                                <!--<button class="bi bi-trash-fill" onclick="deleteTinTuc(${u.id})"></button>-->
                                                <button class="btn btn-success">Enable</button>
                                                <button class="bi bi-pencil-fill btn"></button>
                                                <button class="bi bi-trash-fill btn"></button>
                                            </td>
                                        </tr>                                                                                                                   
                                    </c:forEach>
                                </tbody>
                            </table>

                        </c:if>
                        <!--    Nhà tuyển dụng      -->
                        <c:if test="${typeUser == 'recruiters'}">
                            <table class="table">
                                <thead class="table-dark">
                                <th>
                                    Tên đăng nhập
                                </th>
                                <th>
                                    Tên công ty
                                </th>
                                <th>
                                    Email
                                </th>
                                <th>
                                    Số điện thoại
                                </th>
                                <th>
                                    Địa chỉ
                                </th>
                                <th>
                                    Hoạt động
                                </th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${users}" var="u">                                        
                                        <tr class="table-secondary text-dark">
                                            <td class="text-primary">
                                                <a href="/FindJobApp/admin/customers/${u.username}" class="text-dark">${u.username}</a>
                                            </td> 
                                            <td>
                                                ${u.companyName} 
                                            </td>
                                            <td>
                                                ${u.mail} 
                                            </td>
                                            <td>
                                                ${u.phone} 
                                            </td>
                                            <td>
                                                ${u.location.address},  ${u.location.province.name}
                                            </td>
                                            <td>
                                                <!--<button class="bi bi-trash-fill" onclick="deleteTinTuc(${u.id})"></button>-->
                                                <button class="btn btn-success">Enable</button>
                                                <button class="bi bi-pencil-fill btn"></button>
                                                <button class="bi bi-trash-fill btn"></button>
                                            </td>
                                        </tr>                                                                                                                   
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>


                    </div>



                </div>
            </div>
        </div>
    </div>
</div>


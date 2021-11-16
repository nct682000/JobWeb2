<%-- 
    Document   : ad_employees
    Created on : Sep 22, 2021, 10:53:43 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-primary row">
                        <div class="col-4">
                            <div class="row">
                                <h3>Thông tin nhân viên</h3>
                            </div>
                        </div>

                        <!--    tìm kiếm theo mail   -->
                        <div class="col-4 ">
                            <div class="row justify-content-end">
                                <form action="/FindJobApp/admin/employees"  class="col-10">
                                    <div class="input-group input-group-lg">
                                        <input type="text" placeholder="email . . ." name="email" class="form-control"/>
                                        <button class="btn btn-outline-success fa fa-search"></button>                                                         
                                    </div>                                    
                                </form>
                            </div>
                        </div>


                        <!--    phân trang      -->
                        <div class="col-3 ">
                            <div class="row justify-content-end">
                                <div class="col-6">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination ">
                                            <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                                                <li class="page-item" >
                                                    <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/employees" />?page=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </nav>
                                </div>

                                <!--    btn add     -->
                                <div class="col-3">
                                    <a href="/FindJobApp/admin/employees/new" class="bi bi-plus btn btn-lg btn-outline-success"></a>
                                </div>
                            </div>
                        </div>


                        <!--    Bảng dữ liệu      -->
                        <div class="table-responsive">
                            <table class="table table-striped table-hover stt">
                                <thead class="table-dark">
                                <th>Stt</th>
                                <th>
                                    Tên đăng nhập
                                </th>
                                <th>
                                    Email
                                </th>
                                <th>
                                    Số điện thoại
                                </th>
                                <th>
                                </th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${users}" var="u">                                        
                                        <tr class="table-secondary text-dark">
                                            <td></td>
                                            <td class="text-primary">
                                                <a href="/FindJobApp/admin/employees/${u.id}/edit">${u.username}</a>
                                                <!--${u.username}-->
                                            </td>                                            
                                            <td>
                                                ${u.mail} 
                                            </td>
                                            <td>
                                                ${u.phone} 
                                            </td>
                                            <td>
                                                <a href="javascript:;" class="btn btn-secondary bi bi-trash-fill btn" onclick="deleteUser(${u.id})" style="font-size: 22px;"></a>
                                            </td>
                                        </tr>                                                                                                                   
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/js/assets/user.js" />"></script>


<%-- 
    Document   : customers
    Created on : Aug 19, 2021, 3:43:35 PM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div >
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-primary row">
                        <!--    lọc người ứng tuyển || người tuyển chọn     -->
                        <div class="col-4">
                            <div class="row">
                                <c:if test="${typeUser == 'cadidates'}">                            
                                    <c:if test="${status == 'active'}">
                                        <div class="col btn btn-lg btn-outline-success active">Người ứng tuyển</div>
                                        <a href="/FindJobApp/admin/customers/recruiters" 
                                           class="col btn btn-lg btn-outline-success">Nhà tuyển dụng</a>
                                    </c:if>
                                    <c:if test="${status == 'inactive'}">
                                        <div class="col btn btn-lg btn-outline-success active">Người ứng tuyển</div>
                                        <a href="/FindJobApp/admin/customers/recruiters/inactive" 
                                           class="col btn btn-lg btn-outline-success">Nhà tuyển dụng</a>
                                    </c:if>
                                </c:if>
                                <c:if test="${typeUser == 'recruiters'}">
                                    <c:if test="${status == 'active'}">
                                        <a href="/FindJobApp/admin/customers/cadidates" 
                                           class="col btn btn-lg btn-outline-success ">Người ứng tuyển</a>
                                        <div class="col btn btn-lg btn-outline-success active">Nhà tuyển dụng</div>
                                    </c:if>
                                    <c:if test="${status == 'inactive'}">
                                        <a href="/FindJobApp/admin/customers/cadidates/inactive" 
                                           class="col btn btn-lg btn-outline-success ">Người ứng tuyển</a>
                                        <div class="col btn btn-lg btn-outline-success active">Nhà tuyển dụng</div>
                                    </c:if>
                                </c:if>
                            </div>
                        </div>

                        <!--    tìm kiếm theo mail   -->
                        <div class="col-4 ">
                            <div class="row justify-content-end">
                                <c:if test="${typeUser == 'cadidates'}">
                                    <c:if test="${status == 'active'}">
                                        <form action="/FindJobApp/admin/customers/cadidates"  class="col-10">
                                            <div class="input-group input-group-lg">
                                                <input type="text" placeholder="email . . ." name="email" class="form-control"/>
                                                <button class="btn btn-outline-success fa fa-search"></button>                                                         
                                            </div>                                    
                                        </form>
                                    </c:if>
                                    <c:if test="${status == 'inactive'}">
                                        <form action="/FindJobApp/admin/customers/cadidates/inactive"  class="col-10">
                                            <div class="input-group input-group-lg">
                                                <input type="text" placeholder="email . . ." name="email" class="form-control"/>
                                                <button class="btn btn-outline-success fa fa-search"></button>                                                         
                                            </div>                                    
                                        </form>
                                    </c:if>
                                </c:if>
                                <c:if test="${typeUser == 'recruiters'}">
                                    <c:if test="${status == 'active'}">
                                        <form action="/FindJobApp/admin/customers/recruiters"  class="col-10">
                                            <div class="input-group input-group-lg">
                                                <input type="text" placeholder="email . . ." name="email" class="form-control"/>
                                                <button class="btn btn-outline-success fa fa-search"></button>                                                         
                                            </div>                                    
                                        </form>
                                    </c:if>
                                    <c:if test="${status == 'inactive'}">
                                        <form action="/FindJobApp/admin/customers/recruiters/inactive"  class="col-10">
                                            <div class="input-group input-group-lg">
                                                <input type="text" placeholder="email . . ." name="email" class="form-control"/>
                                                <button class="btn btn-outline-success fa fa-search"></button>                                                         
                                            </div>                                    
                                        </form>
                                    </c:if>
                                </c:if>                                
                            </div>
                        </div>


                        <!--    phân trang      -->
                        <div class="col-3 ">
                            <!--${counter}-->
                            <!--người ứng tuyển-->
                            <c:if test="${typeUser == 'cadidates'}">
                                <!--    đã kích hoạt tài khoản   -->
                                <c:if test="${status == 'active'}">
                                    <div class="row justify-content-end">
                                        <div class="col-6">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination ">
                                                    <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                                                        <li class="page-item" >
                                                            <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/customers/cadidates" />?page=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </nav>
                                        </div>

                                        <!--    btn add     -->
                                        <div class="col-3">
                                            <a href="/FindJobApp/admin/customers/cadidates/new" class="bi bi-plus btn btn-lg btn-outline-success"></a>
                                        </div>
                                    </div>
                                </c:if>

                                <!--    chưa kích hoạt tài khoản   -->
                                <c:if test="${status == 'inactive'}">
                                    <div class="row justify-content-end">
                                        <div class="col-6">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination">
                                                    <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                                                        <li class="page-item">
                                                            <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/customers/cadidates/inactive" />?page=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>

                            <!--nhà tuyển dụng-->
                            <c:if test="${typeUser == 'recruiters'}">
                                <!--    đã kích hoạt tài khoản  -->
                                <c:if test="${status == 'active'}">
                                    <div class="row justify-content-end">
                                        <div class="col-6">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination">
                                                    <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                                                        <li class="page-item">
                                                            <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/customers/recruiters" />?page=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </nav>
                                        </div>

                                        <!--    btn add     -->
                                        <div class="col-3">
                                            <a href="/FindJobApp/admin/customers/recruiters/new" class="bi bi-plus btn btn-lg btn-outline-success"></a>
                                        </div>
                                    </div>
                                </c:if>

                                <!--    chưa kích hoạt tài khoản   -->
                                <c:if test="${status == 'inactive'}">
                                    <div class="row justify-content-end">
                                        <div class="col-6">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination">
                                                    <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                                                        <li class="page-item">
                                                            <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/customers/cadidates/inactive" />?page=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </c:if>
                            </c:if>

                        </div>


                        <!--    Bảng dữ liệu      -->
                        <div class="table-responsive">
                            <!--    Người ứng tuyển      -->
                            <c:if test="${typeUser == 'cadidates'}">
                                <table class="table table-striped table-hover">
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
                                                    <a href="/FindJobApp/admin/customers/cadidates/${u.id}/edit">${u.username}</a>
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
                                                    <c:if test="${status == 'active'}">
                                                        <a href="javascript:;" class="btn btn-secondary" onclick="enableUser(${u.id}, 'cadidates', 'active')">Disable</a>
                                                    </c:if>
                                                    <c:if test="${status == 'inactive'}">
                                                        <a href="javascript:;" class="btn btn-success" onclick="enableUser(${u.id}, 'cadidates', 'inactive')">Enable</a>
                                                        <a href="javascript:;" class="btn btn-secondary bi bi-trash-fill btn" onclick="deleteUser(${u.id})" style="font-size: 22px;"></a>
                                                    </c:if>
                                                </td>
                                            </tr>                                                                                                                   
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </c:if>
                            <!--    Nhà tuyển dụng      -->
                            <c:if test="${typeUser == 'recruiters'}">
                                <table class="table  table-striped table-hover">
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
                                                    <a href="/FindJobApp/admin/customers/recruiters/${u.id}/edit" >${u.username}</a>
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
                                                    <c:if test="${status == 'active'}">
                                                        <a href="javascript:;" class="btn btn-secondary" onclick="enableUser(${u.id}, 'recruiters', 'active')">Disable</a>
                                                    </c:if>
                                                    <c:if test="${status == 'inactive'}">
                                                        <a href="javascript:;" class="btn btn-success" onclick="enableUser(${u.id}, 'recruiters', 'inactive')">Enable</a>
                                                        <a href="javascript:;" class="btn btn-secondary bi bi-trash-fill btn" onclick="deleteUser(${u.id})" style="font-size: 22px;"></a>
                                                    </c:if>
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
</div>
<script src="<c:url value="/js/assets/user.js" />"></script>

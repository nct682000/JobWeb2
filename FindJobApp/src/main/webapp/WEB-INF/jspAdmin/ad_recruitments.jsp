<%-- 
    Document   : ad_recruitments
    Created on : Aug 24, 2021, 10:07:07 PM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<c:if test="${status2 == 'number'}">
    <c:url value="/admin/recruitment/search-salary" var="action" />
</c:if>
<c:if test="${status2 == 'text'}">
    <c:url value="/admin/recruitment/search-title" var="action" />
</c:if>
<c:if test="${status == 'inactive'}">
    <c:url value="/admin/recruitment/inactive" var="action" />
</c:if>

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-primary row">
                        <form action="${action}"  class="col-10">
                            <div class="row" style="justify-content: space-around">
                                <!--    lọc tin tuyển dụng theo active     -->
                                <c:if test="${status == 'active'}">
                                    <div class="col-3">
                                        <div class="row ">
                                            <!--<input type="type" checked id="true" name="active" value="true" class="form-control" style="display: none"/>-->                                          
                                            <div class="col btn btn-lg btn-outline-success active">Đăng tuyển</div>    
                                            <a class="col btn btn-lg btn-outline-secondary" href="<c:url value="/admin/recruitment/inactive" />">Hết hiệu lực</a>                                                   
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="row ">
                                            <c:if test="${status2 == 'number'}">
                                                <!--<input type="type" checked id="true" name="salary" value="true" class="form-control" style="display: none"/>-->                                          
                                                <div class="col btn btn-lg btn-outline-success active">Lương thường</div>    
                                                <a style="padding-left: 0; padding-right: 0" class="col btn btn-lg btn-outline-secondary" href="<c:url value="/admin/recruitment/search-title" />">Thỏa thuận</a>                                                   
                                            </c:if>
                                            <c:if test="${status2 == 'text'}">
                                                <a class="col btn btn-lg btn-outline-success" href="<c:url value="/admin/recruitment/search-salary" />">Lương thường</a>                                                            
                                                <!--<input type="type" checked id="true" name="salary" value="false" class="form-control" style="display: none"/>-->
                                                <div style="padding-left: 0; padding-right: 0" class="col btn btn-lg btn-outline-secondary active">Thỏa thuận</div>                                                         
                                            </c:if>
                                        </div>
                                    </div>
                                    <!--    lọc tin tuyển dụng theo salary     -->
                                    <div class="col-6">
                                        <c:if test="${status2 == 'number'}">
                                            <div class="input-group input-group-lg col-10">
                                                <input type="text" name="title"  placeholder="Tiêu đề bài viết . . ." class="form-control" >
                                                <input type="number" name="salaryFrom"  placeholder="lương từ . . ." class="form-control" style="max-width: 150px">
                                                <input type="number" name="salaryTo" placeholder="lương đến . . ."    class="form-control" style="max-width: 150px">
                                                <button class="btn btn-outline-success fa fa-search"></button>         
                                            </div>       
                                        </c:if>
                                        <c:if test="${status2 == 'text'}">
                                            <div class="input-group input-group-lg col-10">
                                                <input type="text" name="title"  placeholder="Tiêu đề bài viết . . ." class="form-control" >
                                                <button class="btn btn-outline-success fa fa-search"></button>         
                                            </div>       
                                        </c:if>
                                    </div>
                                </c:if>

                                <!--    lọc tin tuyển dụng theo inactive     -->
                                <c:if test="${status == 'inactive'}">
                                    <div class="col-3">
                                        <div class="row ">
                                            <a class="col btn btn-lg btn-outline-success" href="<c:url value="/admin/recruitment" />">Đăng tuyển</a>                                                            
                                            <!--<input type="type" checked id="true" name="active" value="false" class="form-control" style="display: none"/>-->
                                            <div class="col btn btn-lg btn-outline-secondary active">Hết hiệu lực</div>                                                         
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <div class="input-group input-group-lg col-10">
                                            <input type="text" name="title"  placeholder="Tiêu đề bài viết . . ." class="form-control" >
                                            <button class="btn btn-outline-success fa fa-search"></button>         
                                        </div>       
                                    </div>
                                </c:if>


                            </div>
                        </form>

                        <!--    phân trang      -->
                        <div class="col-2">
                            <!--${counter}-->
                            <div class="row justify-content-center">
                                <div class="col-6">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination ">
                                            <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                                                <li class="page-item" >
                                                    <c:if test="${status2 == 'text'}">
                                                        <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/recruitment/search-title" />?page=${i}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${status2 == 'number'}">
                                                        <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/recruitment/search-salary" />?page=${i}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${status == 'inactive'}">
                                                        <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/recruitment/inactive" />?page=${i}">${i}</a>
                                                    </c:if>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>


                    </div>




                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                            <th>
                                Tiêu đề
                            </th>
                            <th>
                                Mức lương
                            </th>
                            <th>
                                Mô tả
                            </th>
                            <th>
                                Cập nhập
                            </th>
                            <th>
                                Hoạt động
                            </th>
                            </thead>
                            <tbody>
                                <c:forEach items="${recruitments}" var="u">
                                    <tr class="table-secondary text-dark">
                                        <td class="text-primary">                                              
                                            <a href="/FindJobApp/recruitment/${u.id}">${u.title}</a>
                                        </td>                                            
                                        <td>
                                            <c:if test="${status2 == 'number'}">
                                                ${u.salaryFrom} ~ ${u.salaryTo}  
                                            </c:if>
                                            <c:if test="${status2 == 'text'}">
                                                thỏa thuận
                                            </c:if>
                                        </td>
                                        <td>
                                            ${u.description.substring(0, 15)}. . . 
                                        </td>
                                        <td>
                                            ${u.updatedDate} 
                                        </td>
                                        <td>
                                            <c:if test="${status == 'active'}">
                                                <a href="javascript:;" class="btn btn-secondary" onclick="enableRecruitment(${u.id}, 'active')">Disable</a>
                                            </c:if>
                                            <c:if test="${status == 'inactive'}">
                                                <a href="javascript:;" class="btn btn-success" onclick="enableRecruitment(${u.id}, 'inactive')">Enable</a>
                                                <a href="javascript:;" class="btn btn-secondary bi bi-trash-fill btn" onclick="deleteRecruitment(${u.id})" style="font-size: 22px;"></a>
                                            </c:if>
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
<script src="<c:url value="/js/assets/recruitment.js" />"></script>
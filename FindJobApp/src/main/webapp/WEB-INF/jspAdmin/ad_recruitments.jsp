<%-- 
    Document   : ad_recruitments
    Created on : Aug 24, 2021, 10:07:07 PM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">

                    <div class="card-header card-header-primary row">
                        <form action="/FindJobApp/admin/recruitment"  class="col-9">
                            <div class="row" style="justify-content: space-around">
                                <!--    lọc tin tuyển dụng theo active     -->
                                <div class="col-4">
                                    <div class="row ">
                                        <c:if test="${status == 'active'}">
                                            <input type="type" checked id="true" name="active" value="true" class="form-control" style="display: none"/>                                          
                                            <div class="col btn btn-lg btn-outline-success active">Đăng tuyển</div>    
                                            <a class="col btn btn-lg btn-outline-secondary" href="<c:url value="/admin/recruitment" />?active=false">Hết hiệu lực</a>                                                   
                                        </c:if>
                                        <c:if test="${status == 'inactive'}">
                                            <a class="col btn btn-lg btn-outline-success" href="<c:url value="/admin/recruitment" />?active=true">Đăng tuyển</a>                                                            
                                            <input type="type" checked id="true" name="active" value="false" class="form-control" style="display: none"/>
                                            <div class="col btn btn-lg btn-outline-secondary active">Hết hiệu lực</div>                                                         
                                        </c:if>
                                    </div>
                                </div>

                                <!--    lọc tin tuyển dụng theo salary     -->
                                <div class="col-6">
                                    <c:if test="${status == 'active'}">
                                        <div class="input-group input-group-lg col-10">
                                            <input type="number" name="salaryFrom"  placeholder="lương từ . . ." class="form-control">
                                            <input type="number" name="salaryTo" placeholder="lương đến . . ."    class="form-control">
                                            <button class="btn btn-outline-success fa fa-search"></button>         
                                        </div>                                
                                    </c:if>
                                    <c:if test="${status == 'inactive'}">
                                        <div class="input-group input-group-lg col-10">
                                            <input type="number" name="salaryFrom"  placeholder="lương từ . . ." class="form-control">
                                            <input type="number" name="salaryTo" placeholder="lương đến . . ."    class="form-control">
                                            <button class="btn btn-outline-success fa fa-search"></button>         
                                        </div>                                
                                    </c:if>
                                </div>
                            </div>
                        </form>





                        <!--    phân trang      -->
                        <div class="col-3">
                            <!--${counter}-->
                            <div class="row justify-content-end">
                                <div class="col-6">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination ">
                                            <c:forEach begin="1" end="${Math.ceil(counter/6)}" var="i">
                                                <li class="page-item" >
                                                    <c:if test="${status == 'active'}">
                                                        <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/recruitment" />?page=${i}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${status == 'inactive'}">
                                                        <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/recruitment?active=false" />?page=${i}">${i}</a>
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
                                            <a href="/FindJobApp/admin/recruitment/${u.id}">${u.title}</a>
                                        </td>                                            
                                        <td>
                                            ${u.salaryFrom} - ${u.salaryTo}  
                                        </td>
                                        <td>
                                            ${u.description} 
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
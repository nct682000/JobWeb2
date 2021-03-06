<%-- 
    Document   : ad_apply
    Created on : Sep 9, 2021, 3:11:01 PM
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-primary row">
                        <form action="/FindJobApp/admin/applies"  class="col-9">
                            <div class="row" style="justify-content: space-around">
                                <!--    lọc thư ứng tuyển theo active     -->
                                <div class="col-4">
                                    <div class="row ">
                                        <c:if test="${status == 'active'}">
                                            <input type="type" checked id="true" name="active" value="true" class="form-control" style="display: none"/>                                          
                                            <div class="col btn btn-lg btn-outline-success active">Đăng tuyển</div>    
                                            <a class="col btn btn-lg btn-outline-secondary" href="<c:url value="/admin/applies" />?active=false">Đã ẩn đi</a>                                                   
                                        </c:if>
                                        <c:if test="${status == 'inactive'}">
                                            <a class="col btn btn-lg btn-outline-success" href="<c:url value="/admin/applies" />?active=true">Đăng tuyển</a>                                                            
                                            <input type="type" checked id="true" name="active" value="false" class="form-control" style="display: none"/>
                                            <div class="col btn btn-lg btn-outline-secondary active">Đã ẩn đi</div>                                                         
                                        </c:if>
                                    </div>
                                </div>

                                <!--    lọc thư ứng tuyển theo tiêu đề     -->
                                <div class="col-5">
                                    <c:if test="${status == 'active'}">
                                        <div class="input-group input-group-lg col-10">
                                            <input type="text" name="title"  placeholder="Tiêu đề bài viết . . ." class="form-control">
                                            <button class="btn btn-outline-success fa fa-search"></button>         
                                        </div>                                
                                    </c:if>
                                    <c:if test="${status == 'inactive'}">
                                        <div class="input-group input-group-lg col-10">
                                            <input type="text" name="title"  placeholder="Tiêu đề bài viết . . ." class="form-control">
                                            <button class="btn btn-outline-success fa fa-search"></button>         
                                        </div>                                
                                    </c:if>
                                </div>
                                <div class="col-3">
                                    <div class="input-group input-group-lg col-10">
                                        <input placeholder="Select date" type="date" name="dateFilter" id="example" class="form-control">
                                    </div>
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
                                                        <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/applies" />?page=${i}">${i}</a>
                                                    </c:if>
                                                    <c:if test="${status == 'inactive'}">
                                                        <a class="page-link" style="padding: 10px 15px;" href="<c:url value="/admin/applies?active=false" />?page=${i}">${i}</a>
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
                        <table class="table table-striped table-hover stt">
                            <thead class="table-dark">
                            <th>Stt</th>
                            <th>Tiêu đề</th>
                            <th>Nội dung</th>
                            <th>CV</th>
                            <th>Ngày đăng</th>
                            <th>Đăng bởi</th>
                            <th></th>                            
                            </thead>
                            <tbody>
                                <c:forEach items="${applys}" var="a" >
                                    <tr class="">
                                        <td></td>
                                        <td class="text-primary">
                                            <a href="/FindJobApp/admin/applies/${a.id}/detail">${a.title} </a>
                                        </td>
                                        <td>
                                            <c:if test="${a.content.length() > 50}">
                                                ${a.content.substring(0, 50)}. . .
                                            </c:if>
                                            <c:if test="${a.content.length() <= 50}">
                                                ${a.content}
                                            </c:if>
                                        </td>                                            
                                        <td>
                                            <a href="${a.cv}">CV</a>
                                        </td>
                                        <td>
                                            ${a.createdDate.toString().substring(0, 10)} 
                                        </td>
                                        <td>
                                            ${a.candidate.lastName} ${a.candidate.firstName}
                                        </td>
                                        <td>
                                            <c:if test="${status == 'active'}">
                                                <a href="javascript:;" class="btn btn-secondary" onclick="enableApply(${a.id}, 'active')">Disable</a>
                                            </c:if>
                                            <c:if test="${status == 'inactive'}">
                                                <a href="javascript:;" class="btn btn-success" onclick="enableApply(${a.id}, 'inactive')">Enable</a>
                                                <a href="javascript:;" class="btn btn-secondary bi bi-trash-fill btn" onclick="deleteApply(${a.id})" style="font-size: 22px;"></a>
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
<script src="<c:url value="/js/assets/apply.js" />"></script>


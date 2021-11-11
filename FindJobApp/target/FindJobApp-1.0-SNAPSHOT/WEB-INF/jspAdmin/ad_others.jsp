<%-- 
    Document   : test
    Created on : Aug 25, 2021, 2:17:14 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="content">
    <div class="container-fluid">
        <div class="row">
            <!--benefits-->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header card-header-primary row">                        
                        <h3 style="text-align: center">Tag phúc lợi</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                            <th>Id</th>
                            <th>Tên</th>
                            <th></th>               
                            </thead>
                            <tbody>
                                <c:forEach items="${benefits}" var="a" >
                                    <tr class="">
                                        <td class="text-primary">${a.id}</td>
                                        <td>${a.name}</td>                                            
                                        <td><a href="javascript:;" class="btn btn-secondary bi bi-trash-fill btn" onclick="deleteBenefit(${a.id})" style="font-size: 22px;"></a> </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!--careers-->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header card-header-primary row">
                        <h3 style="text-align: center">Tag nghề nghiệp</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                            <th>Id</th>
                            <th>Tên</th>
                            <th></th>               
                            </thead>
                            <tbody>
                                <c:forEach items="${careers}" var="a" >
                                    <tr class="">
                                        <td class="text-primary">${a.id}</td>
                                        <td>${a.name}</td>                                            
                                        <td><a href="javascript:;" class="btn btn-secondary bi bi-trash-fill btn" onclick="deleteCareer(${a.id})" style="font-size: 22px;"></a> </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!--tags-->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header card-header-primary row">
                        <h3 style="text-align: center">Tag tìm kiếm</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="table-dark">
                            <th>Id</th>
                            <th>Tên</th>
                            <th></th>               
                            </thead>
                            <tbody>
                                <c:forEach items="${tags}" var="a" >
                                    <tr class="">
                                        <td class="text-primary">${a.id}</td>
                                        <td>${a.content}</td>                                            
                                        <td><a href="javascript:;" class="btn btn-secondary bi bi-trash-fill btn" onclick="deleteTag(${a.id})" style="font-size: 22px;"></a> </td>
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
<script src="<c:url value="/js/assets/others.js" />"></script>


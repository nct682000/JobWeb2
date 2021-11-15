<%-- 
    Document   : test
    Created on : Aug 25, 2021, 2:17:14 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--<c:url value="/admin/others/benefit/new" var="actionBenefits" />--%>
<%--<c:url value="/admin/others/career/new" var="actionCareers" />--%>
<%--<c:url value="/admin/others/tag/new" var="actionTags" />--%>

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <h2 style="text-align: center; padding: 30px">Quản lý các thẻ tag</h2>
            <!--<div class="alert alert-success" role="alert">Đã thêm thành công</div>-->
            <!--benefits-->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header card-header-primary row">                        
                        <h3 class="col-md-8" style="text-align: center">Tag phúc lợi</h3>
                        <a href="/FindJobApp/admin/others/benefit/new" class="col btn btn-lg btn-outline-success col-md-4">Tạo mới</a>
                    </div>
                    <c:if test="${errorBenefit != null}">
                        <div class="alert alert-warning">
                            ${errorBenefit}
                        </div>
                    </c:if>
                    <c:if test="${type == 'createBenefit'}">
                        <c:url value="/admin/others/benefit/new" var="actionBenefits" />
                        <form:form method="post" action="${actionBenefits}" modelAttribute="benefit" enctype="multipart/form-data"
                                   cssClass="container col-md-12" cssStyle="margin-bottom: 10px; background-color: #dbedce">
                            <div class="row">
                                <form:input path="name"         id="nameBenefit"           cssClass="form-control col-md-9"     placeholder="Tên phúc lợi. . ."     type="text"     cssStyle="width: 70%" />
                                <button class="btn btn-success col-md-3" type="submit" style="">Tạo mới</button>
                            </div>
                        </form:form>
                    </c:if>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover stt">
                            <thead class="table-dark">
                                <tr>
                                    <th>stt</th>
                                    <th>Tên</th>
                                    <th></th>      
                                </tr>         
                            </thead>
                            <tbody class="">
                                <c:forEach items="${benefits}" var="a" >
                                    <tr class="stt">
                                        <td></td>
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
                        <h3 class="col-md-8" style="text-align: center">Tag nghề nghiệp</h3>
                        <a href="/FindJobApp/admin/others/career/new" class="col btn btn-lg btn-outline-success col-md-4">Tạo mới</a>
                    </div>
                    <c:if test="${errorCareer != null}">
                        <div class="alert alert-warning">
                            ${errorCareer}
                        </div>
                    </c:if>
                    <c:if test="${type == 'createCareer'}">
                        <c:url value="/admin/others/career/new" var="actionCareers" />
                        <form:form method="post" action="${actionCareers}" modelAttribute="career" enctype="multipart/form-data"
                                   cssClass="container col-md-12" cssStyle="margin-bottom: 10px; background-color: #dbedce">
                            <div class="row">
                                <form:input path="name"         id="nameCareer"           cssClass="form-control col-md-9"    placeholder="Tên nghề nghiệp. . ."     type="text"     cssStyle="width: 70%" />
                                <button class="btn btn-success col-md-3" type="submit" style="">Tạo mới</button>
                            </div>
                        </form:form>
                    </c:if>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover stt">
                            <thead class="table-dark">
                            <th>Stt</th>
                            <th>Tên</th>
                            <th></th>               
                            </thead>
                            <tbody>
                                <c:forEach items="${careers}" var="a" >
                                    <tr class="">
                                        <td></td>
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
                        <h3 class="col-md-8" style="text-align: center">Tag tìm kiếm</h3>
                        <a href="/FindJobApp/admin/others/tag/new" class="col btn btn-lg btn-outline-success col-md-4">Tạo mới</a>
                    </div>
                    <c:if test="${errorTag != null}">
                        <div class="alert alert-warning">
                            ${errorTag}
                        </div>
                    </c:if>
                    <c:if test="${type == 'createTag'}">
                        <c:url value="/admin/others/tag/new" var="actionTags" />
                        <form:form method="post" action="${actionTags}" modelAttribute="tag" enctype="multipart/form-data"
                                   cssClass="container col-md-12" cssStyle="margin-bottom: 10px; background-color: #dbedce">
                            <div class="row">
                                <form:input path="content"         id="contentTag"           cssClass="form-control col-md-9"     placeholder="Tag tìm kiếm. . ."     type="text"      cssStyle="width: 70%" />
                                <button class="btn btn-success col-md-3" type="submit" style="">Tạo mới</button>
                            </div>
                        </form:form>
                    </c:if>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover stt">
                            <thead class="table-dark">
                                <tr>
                                    <th>Stt</th>
                                    <th>Tên</th>
                                    <th></th>               
                            </thead>
                            </tr>
                            <tbody>
                                <c:forEach items="${tags}" var="a" >
                                    <tr class="">
                                        <td></td>
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
<!--<style type="text/css">
    table {
        width: 50%;
        counter-reset: row-num;
    }
    table tr {
        counter-increment: row-num;
    }
    table tr td:first-child::before {
        content: counter(row-num) ". ";
    }
</style>-->

<%-- 
    Document   : ad_recruitments
    Created on : Aug 24, 2021, 10:07:07 PM
    Author     : DELL
--%>

<link
    rel="stylesheet"  href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"  integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
    crossOrigin="anonymous"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="content" id="main">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-primary row">
                        <h4 class="card-title col">Thông tin tuyển dụng</h4>
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
                        <div class="simple-search col">
                            <input type="email" placeholder="name . . ."/>
                            <button class="fa fa-search"></button>
                        </div>
                        <div class="col">
                            <select class="form-select" aria-label="Default select example">
                                <option selected>Công ty</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead class="table-dark">
                            <th>
                                Mã 
                            </th>
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
                                    <c:choose>
                                        <c:when test="${u.id % 2 == 0}">
                                            <tr class="table-secondary text-dark">
                                                <td class="text-primary">
                                                    ${u.id} 
                                                </td>
                                                <td>
                                                    ${u.title}
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
                                                    <!--<button class="bi bi-trash-fill" onclick="deleteTinTuc(${u.id})"></button>-->
                                                    <button class="btn btn-secondary">Enable</button>
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:when test="${u.id % 2 != 0}">
                                            <tr class="">
                                                <td class="text-primary">
                                                    ${u.id} 
                                                </td>
                                                <td>
                                                    ${u.title}
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
                                                    <!--<button class="bi bi-trash-fill" onclick="deleteTinTuc(${u.id})"></button>-->
                                                    <button class="btn btn-secondary">Enable</button>
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
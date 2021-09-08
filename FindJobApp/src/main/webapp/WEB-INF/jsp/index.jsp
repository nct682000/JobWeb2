<%-- 
    Document   : clienttest
    Created on : Aug 12, 2021, 3:34:24 PM
    Author     : DELL
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
        <!-- Page name -->
        <h1 class="text-center text-primary">My Job Website</h1>
        
        <a href="/FindJobApp/add/recruitment">Thêm tin</a>
        <br>
        <a href="/FindJobApp/add/tag">Thêm nhãn & quyền lợi</a>
         <br>
        <a href="/FindJobApp/add/apply">Ứng tuyển</a>
        
        <div class="row m-4">
            
            <!-- Find Job card -->
            <div class="col-xl-5 col-md-12 card bg-light">
                <div class="container">
                    <h2 class="text-info">Tìm kiếm</h2>
                    <form action="/FindJobApp/recruitments/">
                        <input type="text" class="form-control m-2 mb-3 " placeholder="Tên công ty, ngành nghề, công việc, chức danh"  name="kw">
                        <div class="row m-2 mb-3">
                            
                            <!-- province search -->
                            <select class="form-control col mr-2" aria-label=".form-select-sm example" id="career">
                                <option selected>Tất cả địa điểm</option>
                                <c:forEach var="p" items="${provinces}">
                                <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </select>
                            
                            <!-- career search -->
                            <select class="form-control col ml-2" aria-label=".form-select-sm example">
                                <option selected>Ngành nghề</option>
                                <c:forEach var="c" items="${careers}">
                                <option value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div> 
                        
                        <div class="row m-2 mb-3">
                            
                            <!-- salary search -->
                            <input type="number" class="form-control col mr-2 " placeholder="Nhập mức lương" id="salary">
                            
                            <!-- form search -->
                            <select class="form-control col ml-2" aria-label=".form-select-sm example">
                                <option value="">--Chức vụ--</option>
                                <option value="0">Thực tập sinh</option>
                                <option value="1">Mới ra trường</option>
                                <option value="2">Nhân viên</option>
                                <option value="3">Trưởng phòng</option>
                                <option value="4">Quản lý</option>
                                <option value="5">Quản lý cấp cao</option>
                                <option value="6">Giám đốc điều hành</option>
                            </select>
                        </div> 
                        
                        <!-- search button -->
                        <button type="submit" class="btn btn-info btn-block btn-lg mb-3">Tìm việc ngay</button>
                    </form>
                </div>
            </div>
            
            <!-- carousel image -->
            <div id="carouselExampleSlidesOnly" class="carousel slide col-xl-7 col-md-12" data-ride="carousel">
                <div class="carousel-inner" >
                  <div class="carousel-item active">
                      <img class="d-block w-100" src="<c:url value="/images/carousel1.png" />" alt="carousel1" style="height: 320px" >
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="<c:url value="/images/carousel2.png" />" alt="carousel2" style="height: 320px">
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="<c:url value="/images/carousel3.jpg" />" alt="carousel3"style="height: 320px">
                  </div>
                </div>
            </div>
                  
        </div>
        
        <!-- List Recruitment -->
        <div class="row m-4">
            <c:forEach var="r" items="${recruitments}">

                <div class="col-xl-6 col-md-12 mt-4">
                    <div class="card overflow-hidden bg-light">
                      <div class="card-content">
                        <div class="card-body cleartfix">
                          <div class="media align-items-stretch">
                              
                              <!-- image -->
                            <div class="align-self-center mr-3">
                                <a href="/FindJobApp/recruitment/${r.id}"><image src="${r.recruiter.avatar}" alt="Ảnh" style="width:150px; height: 150px"/></a>
                            </div>
                              
                            <div class="media-body">
                                
                                <!-- title -->
                                <h5><a href="/FindJobApp/recruitment/${r.id}" class="text-dark">${r.title}</a></h5> 
                                
                                <!-- company_name -->
                                <div><a href="/FindJobApp/recruiter/${r.recruiter.id}">${r.recruiter.companyName}</a></div> 
                                
                                <!-- form -->
                                <div>Chức vụ: ${r.form.toString()}</div>
                              
                                <!-- salary -->
                                <div class="text-success font-weight-bold">
                                  <c:if test="${r.salaryFrom != null && r.salaryTo != null}">
                                      $Lương: <fmt:formatNumber value="${r.salaryFrom}" type="number" />đ - <fmt:formatNumber value="${r.salaryTo}" type="number" />đ 
                                  </c:if>
                                  <c:if test="${r.salaryFrom != null && r.salaryTo == null}">
                                      $Lương: từ <fmt:formatNumber value="${r.salaryFrom}" type="number" />đ 
                                  </c:if>
                                  <c:if test="${r.salaryFrom == null && r.salaryTo != null}">
                                      $Lương: lên đến <fmt:formatNumber value="${r.salaryTo}" type="number" />đ 
                                  </c:if>
                                  <c:if test="${r.salaryFrom == null && r.salaryTo == null}">
                                      $Lương: thỏa thuận
                                  </c:if>
                                </div>
                            
                                <!-- Province -->
                                <div>Khu vực: ${r.recruiter.location.province.name}</div>
                                
                            </div>
                                
                                <!-- updated_date -->
                            <div class="font-weight-bold text-secondary">
                                <fmt:formatDate type="date" value="${r.updatedDate}" />                      
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
                            
            </c:forEach>
            
        </div>
        
        <ul class="pagination">
            <c:forEach begin="1" end="${Math.ceil(countR / 4)}" var="i">
                <li class="page-item"><a class="page-link" href="<c:url value="/" />?page=${i}">${i}</a></li>
            </c:forEach>
        </ul>
                
    </body>
</html>

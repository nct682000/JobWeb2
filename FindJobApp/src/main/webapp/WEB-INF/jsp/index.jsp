<%-- 
    Document   : clienttest
    Created on : Aug 12, 2021, 3:34:24 PM
    Author     : DELL
--%>

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
        
        <div class="row m-4">
            
            <!-- Find Job card -->
            <div class="col-xl-5 col-md-12 card bg-light">
                <div class="container">
                    <h2 class="text-info">Tìm kiếm</h2>
                    <form>
                        <input type="text" class="form-control m-2 mb-3 " placeholder="Tên công ty, ngành nghề, công việc, chức danh" id="kw">
                        <div class="row m-2 mb-3">
                            
                            <!-- province search -->
                            <select class="form-control col mr-2" aria-label=".form-select-sm example" id="career">
                                <option selected>Tất cả địa điểm</option>
                                <c:forEach var="p" items="${provinces}">
                                <option value="${p.id}">${p.name}</option>
                                </c:forEach>
                            </select>
                            
                            <!-- career search -->
                            <select class="form-control col ml-2" aria-label=".form-select-sm example" id="career">
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
                            <select class="form-control col ml-2" aria-label=".form-select-sm example" id="form">
                                <option selected>Chức vụ</option>
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
                            <div class="align-self-center f">
                                <div style="width:120px">Image</div>   <!-- image -->
                            </div>
                            <div class="media-body">
                                <h5><a href="/FindJobApp/home/" target="target" class="text-dark">${r.title}</a></h5>   <!-- title -->
                              <div>${r.recruiter.companyName}</div>         <!-- company name -->
                              <div>Chức vụ: ${r.form.toString()}</div>            <!-- form -->
                              <div class="text-success font-weight-bold">
                                  $Lương: đ${r.salaryFrom} - đ${r.salaryTo}         <!-- salary -->
                              </div>
                                  <div>${r.recruiter.location.province.name}</div>     <!-- province -->
                            </div>
                            <div class="font-weight-bold text-secondary">
                              ${r.updatedDate}                      <!-- updated date -->
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
    </body>
</html>

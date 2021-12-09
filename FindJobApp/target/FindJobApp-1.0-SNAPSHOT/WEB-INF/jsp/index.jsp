<%-- 
    Document   : clienttest
    Created on : Aug 12, 2021, 3:34:24 PM
    Author     : DELL
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<div class="container-fluid" style="width: 95%">

    <!-- Page name -->
    <h2 class="text-center text-primary font-weight-bold mb-3">TRANG CHỦ</h2>

    <div class="row m-2">

        <!-- Find Job card -->
        <div class="col-xl-5 col-md-12 card bg-light">
            <div class="container">
                <h2 class="text-info">TÌM KIẾM</h2>
                <form action="<c:url value="/recruitments" />">
                    <input type="text" class="form-control m-2 mb-3 " placeholder="Tên công ty, ngành nghề, công việc, chức danh"  name="kw">
                    <div class="row m-2 mb-3">

                        <!-- province search -->
                        <select class="form-control col mr-2" aria-label=".form-select-sm example" name="provinceId">
                            <option selected value=0>Tất cả địa điểm</option>
                            <c:forEach var="p" items="${provinces}">
                            <option value="${p.id}">${p.name}</option>
                            </c:forEach>
                        </select>

                        <!-- career search -->
                        <select class="form-control col" aria-label=".form-select-sm example" name="careerId">
                            <option selected value=0>Ngành nghề</option>
                            <c:forEach var="c" items="${careers}">
                            <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </div> 

                    <div class="row m-2 mb-3">

                        <!-- salary search -->
                        <select class="form-control col mr-2" aria-label=".form-select-sm example" name="salary">
                            <option value="0">--Chọn mức lương--</option>
                            <option value="2000000">Từ 2.000.000đ</option>
                            <option value="5000000">Từ 5.000.000đ</option>
                            <option value="10000000">Từ 10.000.000đ</option>
                            <option value="20000000">Từ 20.000.000đ</option>
                            <option value="50000000">Từ 50.000.000đ</option>
                        </select>

                        <!-- form search -->
                        <select class="form-control col" aria-label=".form-select-sm example" name="form">
                            <option value="-1">--Chức vụ--</option>
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
                    <button type="submit" class="btn btn-info btn-block btn-lg font-weight-bold mb-3">TÌM VIỆC NGAY</button>
                </form>
            </div>
        </div>

        <!-- carousel image -->
        <div id="carouselExampleIndicators" class="carousel slide col-xl-7 col-md-12" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" >
                <div class="carousel-item active">
                    <img class="d-block w-100" src="<c:url value="/images/carousel3.jpg" />" alt="carousel1" style="height: 320px">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="<c:url value="/images/carousel4.jpg" />" alt="carousel2" style="height: 320px">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="<c:url value="/images/carousel5.jpg" />" alt="carousel3" style="height: 320px">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="<c:url value="/images/carousel6.png" />" alt="carousel4" style="height: 320px">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

    </div>
              
    <div class="container text-center mt-4">
        <hr>
        <h4 class="font-weight-bold text-info">-----DOANH NGHIỆP HÀNG ĐẦU-----</h4>
        <div class="row">
            <c:forEach var="r" items="${topRecruiter}">
                <div class="col m-2">
                    <a href="<c:url value="/recruiter/${r[0]}" />" class="text-dark">
                        <div class="card">
                            <div class="my-img-container">
                                <img class="card-img-top img-fluid my-img" src="${r[2]}" alt="avatar">
                            </div>
                            <div class=" font-weight-bold">${r[1]}</div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
        <hr>
    </div>
              
    <!-- List Recruitment -->
    <h4 class="text-dark font-weight-bold mt-4">TIN MỚI NHẤT</h4>
    <div class="row">
        <c:forEach var="r" items="${recruitments}">

            <div class="col-xl-6 col-md-12 mb-4">
                <div class="bg-light mx-2 card">
                    <div class="row">
                        <!-- image -->
                        <div class="col-3">
                            <a href="<c:url value="/recruitment/${r.id}" />">
                                <div class="my-img-container"><image class="my-img" src="${r.recruiter.avatar}" alt="Ảnh" class="img-fluid rounded"/></div>
                            </a>
                        </div>

                        <div class="col-6">

                            <!-- title -->
                            <h5><a href="<c:url value="/recruitment/${r.id}" />" class="text-dark">${r.title}</a></h5> 

                            <!-- company_name -->
                            <div><a href="<c:url value="/recruiter/${r.recruiter.id}" />">${r.recruiter.companyName}</a></div> 

                            <!-- form -->
                            <div>Chức vụ: ${r.form.toString()}</div>

                            <!-- salary -->
                            <div class="text-success font-weight-bold">
                                <c:if test="${r.salaryFrom != null && r.salaryTo != null && r.salaryFrom != r.salaryTo}">
                                    $Lương: <fmt:formatNumber value="${r.salaryFrom}" type="number" />đ - <fmt:formatNumber value="${r.salaryTo}" type="number" />đ 
                                </c:if>
                                <c:if test="${r.salaryFrom != null && r.salaryTo != null && r.salaryFrom == r.salaryTo}">
                                    $Lương: <fmt:formatNumber value="${r.salaryFrom}" type="number" />đ
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
                        <div class="font-weight-bold text-secondary col-3">
                            <fmt:formatDate type="date" value="${r.updatedDate}" />                      
                        </div>
                    </div>

                </div>
            </div>
           
        </c:forEach>

    </div>

    <ul class="pagination font-weight-bold">
        <c:forEach begin="1" end="${Math.ceil(countR / 10)}" var="i">
            <li class="page-item"><a class="page-link" href="<c:url value="/" />?page=${i}">${i}</a></li>
        </c:forEach>
    </ul>
    
</div>

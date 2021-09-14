<%-- 
    Document   : recruitmentDetail
    Created on : Aug 19, 2021, 8:36:44 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<h1 class="text-primary text-center">CHI TIẾT VỀ TIN TUYỂN DỤNG</h1>
<div class="container-fluid" style="width: 95%">
    <h3 class="text-info font-weight-bold">${recDetail.title}</h3>
    <h4><a href="/FindJobApp/recruiter/${recDetail.recruiter.id}" class="text-dark">${recDetail.recruiter.companyName}</a></h4>
    <!-- Card info -->
    <div class="card overflow-hidden bg-light my-3">
        <div class="card-content">
          <div class="card-body cleartfix">
            <div class="media align-items-stretch row">
                <!-- Image -->
              <div class="align-self-center col-3">
                  <image src="${recDetail.recruiter.avatar}" alt="Ảnh" class="img-fluid rounded"/>
              </div>
              <div class="media-body mt-3 col-7">
                    <!-- text -->
                    <h5 class="text-info font-weight-bold">THÔNG TIN TUYỂN DỤNG</h5>
                    
                    <!-- career -->
                    <div class="d-flex mb-3 text-secondary font-weight-bold">
                        <i class="fa fa-cogs mr-2" aria-hiden="true" style="width: 20px"></i>
                        <div class="" style="width: 145px">Ngành nghề: </div>
                        <div class="text-info">${recDetail.career.name}</div>
                    </div>
                    
                    <!-- form -->
                    <div class="d-flex mb-3 text-secondary font-weight-bold">
                        <i class="fa fa-briefcase mr-2" aria-hiden="true" style="width: 20px"></i>
                        <div class="" style="width: 145px">Chức vụ: </div>
                        <div class="text-primary">${recDetail.form.toString()}</div>
                    </div>
                    
                    <!-- salary -->
                    <div class="d-flex mb-3 text-secondary font-weight-bold">
                        <i class="fa fa-money mr-2" aria-hiden="true" style="width: 20px"></i>
                        <div class="" style="width: 145px">Lương: </div>
                        <div class="text-success">
                            <c:if test="${recDetail.salaryFrom != null && recDetail.salaryTo != null}">
                                <fmt:formatNumber value="${recDetail.salaryFrom}" type="number" />đ - <fmt:formatNumber value="${recDetail.salaryTo}" type="number" />đ 
                            </c:if>
                            <c:if test="${recDetail.salaryFrom != null && recDetail.salaryTo == null}">
                                <fmt:formatNumber value="${recDetail.salaryFrom}" type="number" />đ 
                            </c:if>
                            <c:if test="${recDetail.salaryFrom == null && recDetail.salaryTo != null}">
                                <fmt:formatNumber value="${recDetail.salaryTo}" type="number" />đ 
                            </c:if>
                            <c:if test="${recDetail.salaryFrom == null && recDetail.salaryTo == null}">
                                thỏa thuận
                            </c:if>
                        </div>
                    </div>
                    
                    <!-- location -->
                    <div class="d-flex mb-3 text-secondary font-weight-bold">
                        <i class="fa fa-map-marker mr-2" aria-hiden="true" style="width: 20px"></i>
                        <div class="" style="width: 145px">Địa chỉ: </div>
                        <div class="text-dark font-weight-bold">${recDetail.recruiter.location.address}, ${recDetail.recruiter.location.province.name}</div>
                    </div>
                    
                    <!-- created date -->
                    <div class="d-flex mb-3 text-secondary font-weight-bold">
                        <i class="fa fa-calendar mr-2" aria-hiden="true" style="width: 20px"></i>
                        <div class="" style="width: 145px">Ngày đăng tin: </div>
                        <div class="text-info"><fmt:formatDate pattern="dd/MM/yyyy" value="${recDetail.createdDate}" /></div>
                    </div>
                
                    <!-- updated date -->
                    <div class="d-flex mb-3 text-secondary font-weight-bold">
                        <i class="fa fa-pencil-square-o mr-2" aria-hiden="true" style="width: 20px"></i>
                        <div class="" style="width: 145px">Cập nhật lần cuối: </div>
                        <div class="text-info"><fmt:formatDate pattern="dd/MM/yyyy" value="${recDetail.updatedDate}" /></div>
                    </div>
                    
              </div>
                    <div class="font-weight-bold text-secondary col-2">
                        <a href="#" class="btn btn-info font-weight-bold">ỨNG TUYỂN CÔNG VIỆC NÀY</a>                 
                    </div>
            </div>
          </div>
        </div>
    </div>
            
    <div class="row mt-3" >
        <!-- col 1 -->
        <div class="col-md-8 col-xl-8">
            <!-- Benefit -->
            <h5 class="text-dark font-weight-bold">PHÚC LỢI</h5>
            <div class="card-content m-1 bg-light row mb-2">
                <div class="col-md-4 col-xl-4 mb-2 pl-3">
                    BENEFIT
                </div>
                <div class="col-md-4 col-xl-4 mb-2 pl-3">
                    BENEFIT
                </div>
                <div class="col-md-4 col-xl-4 mb-2 pl-3">
                    BENEFIT
                </div>
                <div class="col-md-4 col-xl-4 mb-2 pl-3">
                    BENEFIT
                </div>
                <div class="col-md-4 col-xl-4 mb-2 pl-3">
                    BENEFIT
                </div>
                <div class="col-md-4 col-xl-4 mb-2 pl-3">
                    BENEFIT
                </div>
                <div class="col-md-4 col-xl-4 mb-2 pl-3">
                    BENEFIT
                </div>
            </div>
            
            <!-- description -->
            <div>${recDetail.description}</div> 
            
            <!-- Tag -->
            <h6 class="text-dark font-weight-bold mt-3">Tìm kiếm</h6>
            <div class="card-content">
                <span class="ml-3 p-2">Tag</span>
                <span class="ml-3 p-2">Tag</span>
            </div>
            
        </div>
        
        <!-- col 2 -->
        <div class="col-md-4 col-xl-4">
            <h4>Các tin nổi bật</h4>
            <div class="m-1 mb-2">
                <c:forEach var="trend" items="${trendRecruitment}" >
                    <div class="mb-3 card bg-light">
                        <div class="row">
                            <!-- image -->
                            <div class="col-3">
                              <image src="${trend[3]}" alt="Ảnh" class="img-fluid rounded"/>
                            </div>

                            <div class="col-9">

                                <!-- title -->
                                <h5><a href="/FindJobApp/recruitment/${trend[0]}" class="text-dark">${trend[1]}</a></h5> 

                                <!-- company_name -->
                                <div><a href="/FindJobApp/recruiter/${trend[10]}">${trend[2]}</a></div>

                                <!-- form -->
                                <div>Chức vụ: ${trend[5].toString()}</div>

                                <!-- salary -->
                                <div class="text-success font-weight-bold">
                                    <c:if test="${trend[6] != null && trend[7] != null}">
                                        $Lương: <fmt:formatNumber value="${trend[6]}" type="number" />đ - <fmt:formatNumber value="${trend[7]}" type="number" />đ 
                                    </c:if>
                                    <c:if test="${trend[6] != null && trend[7] == null}">
                                        $Lương: từ <fmt:formatNumber value="${trend[6]}" type="number" />đ 
                                    </c:if>
                                    <c:if test="${trend[6] == null && trend[7] != null}">
                                        $Lương: lên đến <fmt:formatNumber value="${trend[7]}" type="number" />đ 
                                    </c:if>
                                    <c:if test="${trend[6] == null && trend[7] == null}">
                                        $Lương: thỏa thuận
                                    </c:if>
                                </div>

                                <!-- Province -->
                                <div>Khu vực: ${trend[9]}</div>
                            </div>
                        </div>
                            
                    </div>
                          
                </c:forEach>
            </div>
        </div>
        
    </div>
</div>
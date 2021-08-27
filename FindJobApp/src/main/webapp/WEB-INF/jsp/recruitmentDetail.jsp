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
    <h4><a href="#" class="text-dark">${recDetail.recruiter.companyName}</a></h4>
    <!-- Card info -->
    <div class="card overflow-hidden bg-light my-3">
        <div class="card-content">
          <div class="card-body cleartfix">
            <div class="media align-items-stretch">
                <!-- Image -->
              <div class="align-self-center mr-5">
                  <image src="${recDetail.recruiter.avatar}" alt="Ảnh" style="width:280px; height: 280px"/>
              </div>
              <div class="media-body mt-3">
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
                    <div class="font-weight-bold text-secondary">
                        <a href="#" class="btn btn-info font-weight-bold">ỨNG TUYỂN CÔNG VIỆC NÀY</a>                 
                    </div>
            </div>
          </div>
        </div>
    </div>
            
    <div class="row mt-3" >
        <!-- col 1 -->
        <div class="col-md-10 col-xl-10">
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
        <div class="col-md-2 col-xl-2" style="border: 2px dotted blue; border-radius: 10px">
            <div>Text</div>
        </div>
    </div>
</div>
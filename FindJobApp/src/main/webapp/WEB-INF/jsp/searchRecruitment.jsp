<%-- 
    Document   : searchRecruitment
    Created on : Aug 19, 2021, 1:49:10 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<h1>Tin tuyển dụng</h1>
<c:forEach var="r" items="${recruitments}">

    <div class="container">
        <div class="card overflow-hidden bg-light">
          <div class="card-content">
            <div class="card-body cleartfix">
              <div class="media align-items-stretch">

                  <!-- image -->
                <div class="align-self-center f mr-3">
                    <image src="${r.recruiter.avatar}" alt="Ảnh" style="width:150px; height: 150px"/>
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
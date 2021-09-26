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
<h2 class="text-info font-weight-bold mb-3 text-center">KẾT QUẢ TÌM KIẾM</h2>

<div class="container">
    <form action="/FindJobApp/recruitments/">
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
        <button type="submit" class="btn btn-info btn-block btn-lg mb-3">Tìm kiếm</button>
    </form>
</div>

<c:forEach var="r" items="${recruitments}">

    <div class="container mb-3">
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
<%-- 
    Document   : recruitmentDetail
    Created on : Aug 19, 2021, 8:36:44 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<c:forEach var="r" items="recruitment" >
<div class="card overflow-hidden bg-light container my-3">
      <div class="card-content">
        <div class="card-body cleartfix">
          <div class="media align-items-stretch">
            <div class="align-self-center f">
                <div style="width:120px">Image</div>   <!-- image -->
            </div>
            <div class="media-body">
                <h5><a href="#" class="text-dark">${r.title}</a></h5>   <!-- title -->
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
</c:forEach>
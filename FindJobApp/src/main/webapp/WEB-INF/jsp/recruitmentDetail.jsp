<%-- 
    Document   : recruitmentDetail
    Created on : Aug 19, 2021, 8:36:44 PM
    Author     : nct68
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<div class="card overflow-hidden bg-light container my-3">
    <div class="card-content">
      <div class="card-body cleartfix">
        <div class="media align-items-stretch">
          <div class="align-self-center f">
              <div style="width:120px">Image</div>
          </div>
          <div class="media-body">
              <h5><a href="#" class="text-dark">${recDetail.title}</a></h5>
            <div>${recDetail.recruiter.companyName}</div>
            <div>Chức vụ: ${r.form.toString()}</div>
            <div class="text-success font-weight-bold">
                $Lương: đ${recDetail.salaryFrom} - đ${recDetail.salaryTo}
            </div>
                <div>${recDetail.recruiter.location.province.name}</div> 
          </div>
          <div class="font-weight-bold text-secondary">
            ${recDetail.updatedDate}
          </div>
        </div>
      </div>
    </div>
</div>
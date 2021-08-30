<%-- 
    Document   : recruiter
    Created on : Aug 27, 2021, 3:17:05 PM
    Author     : nct68
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<h2 class="text-center text-success mb-5">${ru.companyName}</h2>
<!-- Card -->

<div class="card overflow-hidden my-3 container-fluid" style="background-color: lemonchiffon">
    <div class="card-content">
      <div class="card-body cleartfix">
        <div class="media align-items-stretch">
            <!-- Image -->
          <div class="align-self-center mr-5">
              <image src="${ru.avatar}" alt="Ảnh" style="width:200px; height: 200px"/>
          </div>
          <div class="media-body mt-3">
                <!-- company name -->
                <h5 class="text-info font-weight-bold">${ru.companyName}</h5>

                <!-- location -->
                <div class="text-dark font-weight-bold">ĐỊA ĐIỂM</div>
                <div class="text-secondary font-weight-bold">${ru.location.address}, ${ru.location.province.name}</div>

               <!-- location -->
                <div class="text-dark font-weight-bold mt-2">LIÊN HỆ</div>
                <div class="text-secondary font-weight-bold">Email: ${ru.mail}</div>
                <div class="text-secondary font-weight-bold">Điện thoại: ${ru.phone}</div>

          </div>
                <div class="font-weight-bold text-secondary">
                    <a href="#" class="btn btn-info btn-lg font-weight-bold align-self-mid">ĐÁNH GIÁ</a>                 
                </div>
        </div>
      </div>
    </div>
</div>
<div class="container-fluid" style="width: 95%">
    <div class="row mt-3" >
        <!-- col 1 -->
        <div class="col-md-9 col-xl-9">
            <!-- COmment -->
            <h5 class="text-dark font-weight-bold">BÌNH LUẬN</h5>
            <c:forEach var="cmt" items="${comments}">
                <div>${cmt.content}</div>
            </c:forEach>
            <input type="text" placeholder="Nhập bình luận..." class="form-control p-2" />
            <div class="ml-2"><input type="submit" value="Bình luận" class="btn btn-info" /></div>
            
        </div>
        
        <!-- col 2 -->
        <div class="col-md-3 col-xl-3" style="border: 2px dotted blue; border-radius: 10px">
            <div>Text</div>
        </div>
    </div>
</div>

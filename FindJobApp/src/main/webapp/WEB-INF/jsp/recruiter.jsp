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
<head>
    <script src="../resources/js/main.js"></script>
</head>

<div class="container-fluid" style="width: 90%">
    <h2 class="text-center text-success mb-5">${ru.companyName}</h2>

<!-- Card -->
    <div class="card overflow-hidden my-3" style="background-color: windowframe">
        <div class="card-content">
          <div class="card-body cleartfix">
            <div class="media align-items-stretch row">
                <!-- Image -->
                    <div class="col-3 align-self-center">
                        <image src="${ru.avatar}" alt="Ảnh" class="img-fluid rounded"/>
                    </div>
                    
                    <div class="media-body mt-3 col-7">
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
                    <div class="font-weight-bold text-secondary text-center col-2">
                        <button class="btn btn-info btn-lg font-weight-bold align-self-mid mb-4" data-toggle="modal" data-target="#rateModal">ĐÁNH GIÁ</button> 
                        <h1 class="text-info">5<i class="fa fa-star text-warning" aria-hiden="true"></i></h1>
                        <div class="text-info">100 lượt đánh giá</div>
                        
                    </div>
                
            </div>
          </div>
        </div>
    </div>
                    
    <!-- block 2 - comment, recruitment -->
    <div class="row mt-3" >
        <!-- col 1 -->
        <div class="col-md-7 col-xl-7 col-7">
            <!-- COmment title -->
            <h5 class="text-dark font-weight-bold">BÌNH LUẬN</h5>
        </div>

        <!-- blank -->
        <div class="col-md-1 col-xl-1 col-1">

        </div>

        <!-- col 2 -->
        <div class="col-md-4 col-xl-4 col-4 px-4">
            <h5 class="font-weight-bold">CÁC TIN HIỆN ĐANG TUYỂN DỤNG</h5>
        </div>
    </div>

    <div class="row" >
        <!-- col 1 -->
        <div class="col-md-7 col-xl-7 col-7">
            <div class="row">
                <div class="col-2 ">
                    <img alt="Avatar" src="${currentUser.avatar}" class="img-fluid rounded"/>
                </div>
                <textarea id="commentId" type="text" placeholder="Nhập bình luận..." class="form-control p-2 mt-2 col" ></textarea>
            </div>
            
            <div class="text-right mr-3">
                <c:if test="${currentUser != null}">
                    <input type="button" value="Bình luận" class="btn btn-info "
                                     onclick="addComment(${currentUser.id}, ${ru.id})" />
                </c:if>
                <c:if test="${currentUser == null}">
                    <input type="button" value="Bình luận" class="btn btn-info "
                                     data-toggle="modal" data-target="#requireLoginModal" />
                </c:if>
            </div>
            
            <br>
            
            <div id="commentArea">
                <!-- COmment -->
                <c:forEach var="cmt" items="${comments}">
                    <div class="mt-2 row bg-light">
                        <div class="col-md-2 text-center">
                            <img alt="Avatar" src="${cmt.commenter.avatar}" class="img-fluid rounded"/>
                        </div>
                        <div class="col-md ml-2">
                            <div class="card">
                                <div class="font-weight-bold">
                                    <c:if test="${cmt.commenter.role == 'CANDIDATE'}">
                                        ${cmt.commenter.firstName} ${cmt.commenter.lastName}
                                    </c:if>
                                    <c:if test="${cmt.commenter.role == 'RECRUITER'}">
                                       ${cmt.commenter.companyName}
                                    </c:if>
                                </div>
                                <div class="ml-3">${cmt.content}</div>
                            </div>
                            <div>
                                <span><a href="#">Thích</a> . </span>
                                <span><a href="#">Trả lời</a> . </span>
                                <span class="text-secondary my-date">Lúc: ${cmt.createdDate}</span>
                                <c:if test="${currentUser.id == cmt.commenter.id}">
                                    <span class="btn btn-danger" onclick="deleteComment(${currentUser.id}, ${cmt.id})">Xóa</span>
                                </c:if>
                            </div>
                        </div>

                            <!-- replies -->
                        <c:if test="${!replies.isEmpty()}">
                            <div>${relies.content}</div>
                        </c:if>

                    </div>
                </c:forEach>
            </div>
            
        </div>

        <div class="col-md-1 col-xl-1 col-1">

        </div>

        <!-- col 2 -->
        <div class="col-md-4 col-xl-4 col-4 px-3">
             <c:forEach var="rec" items="${recRecruitments}">
                <div class="card bg-light mb-3">
                    <div class="text-info font-weight-bold">${rec.title}</div>
                    <div class="text-dark">Chức vụ: ${rec.form.toString()}</div>
                    <div class="text-success font-weight-bold">$Lương:
                        <c:if test="${rec.salaryFrom != null && rec.salaryTo != null}">
                            <fmt:formatNumber value="${rec.salaryFrom}" type="number" />đ - <fmt:formatNumber value="${rec.salaryTo}" type="number" />đ 
                        </c:if>
                        <c:if test="${rec.salaryFrom != null && rec.salaryTo == null}">
                            <fmt:formatNumber value="${rec.salaryFrom}" type="number" />đ 
                        </c:if>
                        <c:if test="${rec.salaryFrom == null && rec.salaryTo != null}">
                            <fmt:formatNumber value="${rec.salaryTo}" type="number" />đ 
                        </c:if>
                        <c:if test="${rec.salaryFrom == null && rec.salaryTo == null}">
                            thỏa thuận
                        </c:if>
                    </div>
                    
                    <div>
                        <a class="text-white btn btn-secondary btn-sm " href="/FindJobApp/recruitment/${rec.id}">Xem chi tiết</a>
                    </div>

                </div>
            </c:forEach>
        </div>
    </div>
    
</div>
            
            <!-- Modal -->
    
<!-- Rate modal -->
<div class="modal fade" id="rateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <form:form method="post" action="/FindJobApp/user/${pageContext.request.userPrincipal.name}" modelAttribute="recruitment" enctype="multipart/form-data">
                <div class="modal-header">
                    <h4 class="modal-title text-primary font-weight-bold" id="exampleModalLongTitle">Đánh giá về doanh nghiệp</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="p-2 text-center">
                        <input type="radio" class="btn-check invisible" name="options" id="option1" autocomplete="on" checked>
                        <label class="btn btn-secondary" for="option1">1<i class="fa fa-star text-warning" aria-hiden="true"></i></label>

                        <input type="radio" class="btn-check invisible" name="options" id="option2" autocomplete="off">
                        <label class="btn btn-secondary" for="option2">2<i class="fa fa-star text-warning" aria-hiden="true"></i></label>

                        <input type="radio" class="btn-check invisible" name="options" id="option3" autocomplete="off">
                        <label class="btn btn-secondary" for="option3">3<i class="fa fa-star text-warning" aria-hiden="true"></i></label>

                        <input type="radio" class="btn-check invisible" name="options" id="option4" autocomplete="off">
                        <label class="btn btn-secondary" for="option4">4<i class="fa fa-star text-warning" aria-hiden="true"></i></label>
                        
                        <input type="radio" class="btn-check invisible" name="options" id="option5" autocomplete="off">
                        <label class="btn btn-secondary" for="option5">5<i class="fa fa-star text-warning" aria-hiden="true"></i></label>
                    </div>
                            
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">Hủy</button>
                    <input type="submit" class="btn btn-primary btn-lg" value="Đánh giá">
                </div>
            </form:form>
        </div>
    </div>
</div>

<!-- Require Login modal -->
<div class="modal fade" id="requireLoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title text-danger font-weight-bold" id="exampleModalLongTitle">Đăng nhập để bình luận</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">Hủy</button>
        <a href="/FindJobApp/login" class="btn btn-primary btn-lg">Đi đến trang đăng nhập</a>
      </div>
    </div>
  </div>
</div>
                        

                <!-- Script -->
                
<script>
    window.onload = function (){
        let dates = document.querySelectorAll(".my-date")
        for(let i = 0; i < dates.length; i++){
            let d = dates[i]
            moment.locale('vi')
            d.innerText = moment(d.innerText).fromNow()
        }
    }
    
</script>
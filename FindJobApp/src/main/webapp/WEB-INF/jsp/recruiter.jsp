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

<!-- hidden -->
<c:if test="${currentUser.role == 'ROLE_CANDIDATE'}">
    <input type="hidden" id="cmtName" value="${currentUser.firstName} ${currentUser.lastName}">
</c:if>
<c:if test="${currentUser.role == 'ROLE_RECRUITER'}">
    <input type="hidden" id="cmtName" value="${currentUser.companyName}">
</c:if>
<input type="hidden" id="cmtAvatar" value="${currentUser.avatar}">

<div class="container-fluid" style="width: 90%">
    <h2 class="text-center text-success mb-5 font-weight-bold">${ru.companyName}</h2>

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
                        <c:if test="${currentUser != null}">
                            <button class="btn btn-info btn-lg font-weight-bold align-self-mid mb-4" data-toggle="modal" data-target="#rateModal">ĐÁNH GIÁ</button> 
                        </c:if>
                        <c:if test="${currentUser == null}">
                            <button class="btn btn-info btn-lg font-weight-bold align-self-mid mb-4" data-toggle="modal" data-target="#requireLoginModal">ĐÁNH GIÁ</button> 
                        </c:if>
                        <h1 class="text-info"><fmt:formatNumber maxFractionDigits="2" value="${ratePointRecruiter}" type="number" /><i class="fa fa-star text-warning" aria-hiden="true"></i></h1>
                        <div class="text-info font-weight-normal font-italic">${rateCountRecruiter} lượt đánh giá</div>

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
            <h5 class="text-dark font-weight-bold">GIỚI THIỆU</h5>
            <div class="ml-2 mb-3">${ru.introduce}</div>
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
            <h5 class="text-dark font-weight-bold">BÌNH LUẬN</h5>
            <div class="row">
                <div class="col-2 ">
                    <img alt="Avatar" src="${currentUser.avatar}" class="img-fluid rounded"/>
                </div>
                <textarea id="commentId" type="text" placeholder="Nhập bình luận..." class="form-control p-2 mt-2 col" ></textarea>
            </div>

            <div class="text-right mr-3 ">
                <c:if test="${currentUser != null}">
                    <input type="button" value="BÌNH LUẬN" class="btn btn-info font-weight-bold"
                           onclick="addComment(${currentUser.id}, ${ru.id})" />
                </c:if>
                <c:if test="${currentUser == null}">
                    <input type="button" value="BÌNH LUẬN" class="btn btn-info font-weight-bold"
                           data-toggle="modal" data-target="#requireLoginModal" />
                </c:if>
            </div>

            <br>

            <div id="commentArea" class="bg-light">
                <!-- COmment -->
                <c:forEach var="cmt" items="${comments}">
                    <div class="mt-2 row" id="comment-${cmt.id}">
                        <div class="col-2 text-center">
                            <img alt="Avatar" src="${cmt.commenter.avatar}" class="img-fluid rounded"/>
                        </div>
                        <div class="col-10">
                            <div class="card">
                                <div class="font-weight-bold">
                                    <c:if test="${cmt.commenter.role == 'ROLE_CANDIDATE'}">
                                        ${cmt.commenter.firstName} ${cmt.commenter.lastName}
                                    </c:if>
                                    <c:if test="${cmt.commenter.role == 'ROLE_RECRUITER'}">
                                        ${cmt.commenter.companyName}
                                    </c:if>
                                </div>
                                
                                <div class="pl-3">${cmt.content}</div>
                            </div>
                            <div>
                                <span class="dropdown">
                                    <button class="btn btn-sm dropdown-toggle text-primary font-weight-bold" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Thích
                                    </button>
                                    <div class="dropdown-menu font-weight-bold font-italic" aria-labelledby="dropdownMenuButton">
                                        <c:if test="${currentUser != null}">
                                            <div><a href="#" class="text-primary" onclick="addInteraction(0, ${currentUser.id}, ${cmt.id})"><i class="fa fa-thumbs-up"></i> Thích</a></div>
                                            <div><a href="#" class="text-danger" onclick="addInteraction(1, ${currentUser.id}, ${cmt.id})"><i class="fa fa-thumbs-down"></i> Không thích</a></div> 
                                        </c:if>
                                        <c:if test="${currentUser == null}">
                                            <div><a href="#" class="text-primary" data-toggle="modal" data-target="#requireLoginModal"><i class="fa fa-thumbs-up"></i> Thích</a></div>
                                            <div><a href="#" class="text-danger" data-toggle="modal" data-target="#requireLoginModal"><i class="fa fa-thumbs-down"></i> Không thích</a></div>
                                        </c:if>
                                    </div>
                                </span>   
                                
                                <c:if test="${currentUser != null}">
                                    <span class="dropdown">
                                        <button class="btn btn-sm dropdown-toggle text-primary font-weight-bold" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Trả lời
                                        </button>
                                        <div class="dropdown-menu font-weight-bold font-italic" aria-labelledby="dropdownMenuButton">
                                            <c:if test="${currentUser != null}">
                                                <textarea id="replyContent-${cmt.id}" type="text" placeholder="Nhập trả lời..." class="form-control p-2 mt-2 col" ></textarea>
                                                <div><a class="text-info" onclick="addReply(${currentUser.id}, ${cmt.id})"><button>Trả lời</button></a></div> 
                                            </c:if>
                                            <c:if test="${currentUser == null}">
                                                <textarea id="replyContent-${cmt.id}" type="text" placeholder="Nhập trả lời..." class="form-control p-2 mt-2 col" ></textarea>
                                                <div><a href="#" class="text-info" data-toggle="modal" data-target="#requireLoginModal"><button>Trả lời</button></a></div>
                                            </c:if>
                                        </div>
                                    </span>   
                                </c:if>
                                <c:if test="${currentUser == null}">
                                    <span><a href="#" data-toggle="modal" data-target="#requireLoginModal">Trả lời</a> . </span>
                                </c:if>
                                
                                <c:if test="${cmt.countInteractions(0) > 0}">
                                    <span><div class="badge badge-info font-weight-normal">${cmt.countInteractions(0)} <i class="fa fa-thumbs-up"></i></div> . </span>
                                </c:if>
                                <c:if test="${cmt.countInteractions(1) > 0}">
                                    <span><div class="badge badge-warning font-weight-normal">${cmt.countInteractions(1)} <i class="fa fa-thumbs-down"></i></div> . </span>
                                </c:if>
                                    
                                <span class="text-secondary my-date">Lúc: ${cmt.createdDate}</span>
                                <c:if test="${currentUser.id == cmt.commenter.id}">
                                    <span class="btn btn-danger" onclick="deleteComment(${currentUser.id}, ${cmt.id})">Xóa</span>
                                </c:if>
                            </div>
                        </div>

                        <!-- replies -->
                        <div id="replyArea-${cmt.id}">
                            <c:forEach var="r" items="${cmt.replies}">
                                <div class="ml-5 mt-2 row bg-light" id="reply-${r.id}">
                                    <div class="col-2 text-center">
                                        <img alt="Avatar" src="${r.replyer.avatar}" class="img-fluid rounded"/>
                                    </div>
                                    <div class="col-10">
                                        <div class="card">
                                            <div class="font-weight-bold">
                                                <c:if test="${r.replyer.role == 'ROLE_CANDIDATE'}">
                                                    ${r.replyer.firstName} ${r.replyer.lastName}
                                                </c:if>
                                                <c:if test="${r.replyer.role == 'ROLE_RECRUITER'}">
                                                    ${r.replyer.companyName}
                                                </c:if>
                                            </div>

                                            <div class="pl-3">${r.content}</div>
                                        </div>
                                        <div>
<!--                                            <span><a href="#">Thích</a> . </span>-->
                                            <span class="text-secondary my-date">Lúc: ${r.createdDate}</span>
                                            <c:if test="${currentUser.id == r.replyer.id}">
                                                <span class="btn btn-danger" onclick="deleteReply(${currentUser.id},${r.id})">Xóa</span>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

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
                        <c:if test="${rec.salaryFrom != null && rec.salaryTo != null && rec.salaryFrom != rec.salaryTo}">
                            <fmt:formatNumber value="${rec.salaryFrom}" type="number" />đ - <fmt:formatNumber value="${rec.salaryTo}" type="number" />đ 
                        </c:if>
                        <c:if test="${rec.salaryFrom != null && rec.salaryTo != null && rec.salaryFrom == rec.salaryTo}">
                            <fmt:formatNumber value="${rec.salaryFrom}" type="number" />đ
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
                        <a class="text-white btn btn-secondary btn-sm " href="<c:url value="/recruitment/${rec.id}" />">Xem chi tiết</a>
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
            <form:form method="post" action="<c:url value="/user/${pageContext.request.userPrincipal.name}" />" modelAttribute="recruitment" enctype="multipart/form-data">
                <div class="modal-header">
                    <h4 class="modal-title text-primary font-weight-bold" id="exampleModalLongTitle">ĐÁNH GIÁ VỀ DOANH NGHIỆP</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="p-2 text-center">
                        <input type="radio" class="btn-check invisible" name="options" id="option1" autocomplete="off">
                        <label class="btn btn-info" for="option1"
                               onclick="getRatePoint(1)">1<i class="fa fa-star text-warning" aria-hiden="true"></i></label>

                        <input type="radio" class="btn-check invisible" name="options" id="option2" autocomplete="off">
                        <label class="btn btn-info" for="option2"
                               onclick="getRatePoint(2)">2<i class="fa fa-star text-warning" aria-hiden="true"></i></label>

                        <input type="radio" class="btn-check invisible" name="options" id="option3" autocomplete="off">
                        <label class="btn btn-info" for="option3"
                               onclick="getRatePoint(3)">3<i class="fa fa-star text-warning" aria-hiden="true"></i></label>

                        <input type="radio" class="btn-check invisible" name="options" id="option4" autocomplete="off">
                        <label class="btn btn-info" for="option4"
                               onclick="getRatePoint(4)">4<i class="fa fa-star text-warning" aria-hiden="true"></i></label>

                        <input type="radio" class="btn-check invisible" name="options" id="option5" autocomplete="off">
                        <label class="btn btn-info" for="option5"
                               onclick="getRatePoint(5)">5<i class="fa fa-star text-warning" aria-hiden="true"></i></label>

                        <div>Bạn đang chọn: <span id="ratePoint" class="font-weight-bold text-info">0</span><i class="fa fa-star text-warning" aria-hiden="true"></i></div>

                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">HỦY</button>
                    <input type="submit" class="btn btn-primary btn-lg" value="ĐÁNH GIÁ" onclick="addRate(${currentUser.id}, ${ru.id})">

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
                <h4 class="modal-title text-danger font-weight-bold" id="exampleModalLongTitle">BẠN CHƯA ĐĂNG NHẬP!</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">HỦY</button>
                <a href="<c:url value="/login" />" class="btn btn-primary btn-lg">ĐI ĐẾN TRANG ĐĂNG NHẬP</a>
            </div>
        </div>
    </div>
</div>


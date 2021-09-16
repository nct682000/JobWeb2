<%-- 
    Document   : ad_edit_user
    Created on : Aug 30, 2021, 3:17:09 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<form class="container bg-info col-md-8" style="margin-bottom: 30px;margin-top: 30px;" method="POST">
    <div class="row" style="padding: 20px;">

        <div class="col-md-5  " style="padding: 20px 20px 0;" >
            <!--    tài khoản   -->
            <div class="" style="border: 2px solid #dee2e6;border-radius: 7%;">
                <h2 style="text-align: center;padding: 25px;">Tài khoản</h2>
                <div class="col-md-9 " style="margin: auto;">
                    <input type="text"      class="form-control"    id="validationDefault03"    placeholder="username" style=" margin-bottom: 20px;">
                    <input type="password"  class="form-control "   id="validationDefault03"    placeholder="password" style=" margin-bottom: 20px;">
                    <input type="password"  class="form-control"    id="validationDefault03"    placeholder="reconfirm password" style=" margin-bottom: 20px;">
                    <div class="form-check" style=" margin-bottom: 20px;">
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck2" required>
                        <label class="form-check-label" for="invalidCheck2">
                            Agree to terms and conditions
                        </label>
                    </div>
                </div>

            </div>
            <div style="text-align: center">
                <button class="btn btn-success" type="submit" style="width: 80%;padding: 10px;margin-top: 20px;">Add user</button>
            </div>
        </div>


        <div class="col-md-7">
            <div class="row" style=" margin-bottom: 30px;">
                <!--    họ tên  -->
                <div class="col-md-4">
                    <label for="validationDefault01" class="form-label">Họ</label>
                    <input type="text" class="form-control" id="validationDefault01" placeholder="họ" >
                </div>
                <div class="col-md-2">
                    <label for="validationDefault02" class="form-label">Tên</label>
                    <input type="text" class="form-control" id="validationDefault02" placeholder="tên" >
                </div>

                <!--    email   -->
                <div class="col-md-6">
                    <label for="validationDefaultUsername" class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text" id="inputGroupPrepend2">@</span>
                        <input type="text" class="form-control" id="validationDefaultUsername"  aria-describedby="inputGroupPrepend2" >
                    </div>
                </div>
            </div>

            <div class="row" style=" margin-bottom: 30px;">
                <!--    giới tính   -->
                <div class="col-md-4">
                    <label for="validationDefault05" class="form-label">Giới tính</label>
                    <div class="d-flex">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
                            <label class="form-check-label" for="flexRadioDefault1" style="margin-right: 20px;">
                                Nam
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
                            <label class="form-check-label" for="flexRadioDefault2">
                                Nữ
                            </label>
                        </div>
                    </div>
                </div>

                <!--    số điện thoại   -->
                <div class="col-md-5">
                    <label for="validationDefault03" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="validationDefault03" >
                </div>
            </div>

            <div class="row" style=" margin-bottom: 30px;">
                <!--    công ty     -->
                <div class="col-md-7">
                    <label for="validationDefault03" class="form-label">Công ty</label>
                    <input type="text" class="form-control" id="validationDefault03" >
                </div>
                <!--    nhóm người dùng     role ?    -->
                <div class="col-md-5">
                    <label for="validationDefault04" class="form-label">Nhóm người dùng </label>
                    <select class="form-select" id="validationDefault04" >
                        <option selected disabled value="">Nhóm người dùng</option>
                        <option>ngưởi tuyển dụng</option>
                        <option>ngưởi ứng tuyển</option>
                    </select>
                </div>
            </div>    

            <div class="row" >
                <!--    địa chỉ     -->
                <div class="col-md-5">
                    <label for="validationDefault04" class="form-label">Địa chỉ</label>
                    <select class="form-select" id="validationDefault04" >
                        <option selected disabled value="">thành phố</option>
                        <option>...</option>
                    </select>                    
                </div>
                <div class="col-md-7">
                    <label for="validationDefault03" class="form-label">địa chỉ cụ thể</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
            </div>

            <div class="col-5 ">
                <div class="row justify-content-end">
                    <div class="col-4 btn-group" role="group">                  

                        <button id="btnGroupDrop1" type="button" class="btn btn-secondary " data-bs-toggle="dropdown" aria-expanded="false">
                            Địa chỉ
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                            <c:forEach var="p" items="${provinces}">
                                <li><a class="dropdown-item" href="#">${p.name}</a></li>
                            </c:forEach>
                        </ul>

                    </div>
                    <form action="/FindJobApp/admin/customers/cadidates"  class="col-6">
                        <div class="input-group input-group-lg">
                            <input type="text" placeholder="email . . ." name="email" class="form-control"/>
                            <button class="btn btn-outline-success fa fa-search"></button>                                                         
                        </div>                                    
                    </form>
                </div>

            </div>


            <div class="row justify-content-end">
                <div class="col-4 btn-group" role="group">                  

                    <button id="btnGroupDrop1" type="button" class="btn btn-secondary " data-bs-toggle="dropdown" aria-expanded="false">
                        Địa chỉ
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                        <c:forEach var="p" items="${provinces}">
                            <li><a class="dropdown-item" href="#">${p.name}</a></li>
                        </c:forEach>
                    </ul>

                </div>
                <form action="/FindJobApp/admin/customers/cadidates"  class="col-6">
                    <div class="input-group input-group-lg">
                        <input type="text" placeholder="email . . ." name="email" class="form-control"/>
                        <button class="btn btn-outline-success fa fa-search"></button>                                                         
                    </div>                                    
                </form>
            </div>
        </div>
    </div>
</form>
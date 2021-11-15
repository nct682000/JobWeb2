<%-- 
    Document   : login
    Created on : Aug 19, 2021, 2:42:28 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title></title>
    </head>
    <body>
        
        <div col-md-6>
            <div class="card container w-50 p-3">
            <article class="card-body">
                
                <!-- Text -->
                <h2 class="card-title text-center mb-2 text-info font-weight-bold">Đăng nhập quản trị</h2>
                <hr>
                
                <!-- Notification -->
                <h5 class="text-success text-center my-4">Thông báo........</h5>
                
                <form>
                    
                <!-- input username -->
                <div class="form-group">
                    <div class="input-group input-group-lg">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                             </div>
                            <input name="" class="form-control" placeholder="Nhập tài khoản" type="username">
                    </div> 
                </div>
                
                <!-- input password -->
                <div class="form-group">
                    <div class="input-group input-group-lg mt-4">
                            <div class="input-group-prepend">
                                <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                             </div>
                        <input class="form-control" placeholder="********" type="password">
                    </div> 
                </div>
                
                <!-- save password checkbox -->
                <div class="checkbox checkbox-lg">
                    <label> <input type="checkbox"> Lưu mật khẩu </label>
                </div>
                
                <!-- login button -->
                <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block btn-lg"> ĐĂNG NHẬP  </button>
                </div>
                
                <!-- forgot password -->
                <p class="text-center"><a href="#" class="btn btn-lg text-secondary">Quên mật khẩu?</a></p>
                
                <!-- link register -->
                <p class="text-center"><a href="/FindJobApp/register/" class="btn btn-lg text-info font-weight-bold">Đăng ký mới</a></p>
                </form>
            </article>
            </div>
        </div>
        
    </body>
</html>


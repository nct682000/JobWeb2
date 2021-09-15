<%-- 
    Document   : header
    Created on : Aug 18, 2021, 9:56:04 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
    <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
    <div class="row justify-content-md-center">
        <img class="" 
             style="border-color: blue;border-radius: 50%;width: 120px;height: 100%;margin: 25px 0 10px 0;"
             src="<c:url value="/images/userDefaul.jpg" />" alt="avatar">
    </div>
    <div class="" style="margin-bottom: 30px;text-align: center;">
        <h4>quan tri vien</h4>
    </div>
    <a href="/FindJobApp/admin/customers/cadidates" class="w3-bar-item w3-button">Customers</a>
    <a href="/FindJobApp/admin/recruitment" class="w3-bar-item w3-button">Recruitments</a>
    <a href="/FindJobApp/admin/applies" class="w3-bar-item w3-button">Applies</a>
    <a href="/FindJobApp/admin/test" class="w3-bar-item w3-button">test</a>
</div>

<div class="sticky-top" id="header" style="transition: 0.4s">


    <nav class="navbar navbar-dark bg-primary">
        <div class="container-fluid">
            <!--    Home page   -->
            <button id="openNav" class="w3-button w3-teal w3-xlarge bi bi-list" onclick="w3_open()"></button>
            <button class="btn btn-success" type="button">FIND JOB</button>

            <!--    Chuyển view theo nhóm người dùng    -->
            <button class="btn btn-secondary" type="button">Việc làm</button>
            <button class="btn btn-secondary" type="button">Ứng viên</button>        

            <!--    Thanh tìm kiếm  -->
            <form class="d-flex">
                <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-success bi bi-search" type="submit"></button>
            </form>        

            <!--    Chuyển ngôn ngữ ?   -->


            <!--    Thông báo   -->
            <button type="button" class="btn btn-secondary position-relative bi bi-bell-fill"style="font-size: 22px;">            
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">99+</span>
            </button>
            <button type="button" class="btn btn-secondary position-relative bi bi-chat-dots-fill" style="font-size: 22px;">            
                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">99+</span>
            </button>


            <!--    Profile     -->
            <!--        <nav class="navbar navbar-light bg-light">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="#">
                                <img src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
                                Hi, tên người dùng
                            </a>
                        </div>
                    </nav>-->

            <!--        <div class="btn-group" role="group">
                        <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">
                        </button>
                        <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                            <li><a class="dropdown-item" href="#">Dropdown link</a></li>
                            <li><a class="dropdown-item" href="#">Dropdown link</a></li>
                        </ul>
                    </div>-->
            <div class="dropdown dropstart">
                <button class="btn btn-secondary" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">               
                    <img src="https://www.bing.com/images/search?view=detailV2&ccid=RiaKexta&id=2E601B035BF0CC84415676A42E68043F47B5307F&thid=OIF.hQ4%2f8ERbniz20%2bsrcZx4Sw&mediaurl=https%3a%2f%2ftiermaker.com%2fimages%2ftemplates%2fanime-protagonist-324444%2f3244441629835978.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.46268a7b1b5a5c6e70d3327712553f4f%3frik%3d%26pid%3dImgRaw%26r%3d0&exph=400&expw=400&q=images+anime&simid=566961792926&FORM=IRPRST&ck=850E3FF0445B9E2CF6D3EB2B719C784B&selectedIndex=117&ajaxhist=0&ajaxserp=0" 
                         class="img-thumbnail" alt="anh">
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
                    <li><a class="dropdown-item" href="#">Profile</a></li>
                    <li><a class="dropdown-item" href="#">LogOut</a></li>
                </ul>
            </div>      
        </div>
    </nav>

    <script>
        function w3_open() {
            document.getElementById("main").style.marginLeft = "15%";
            document.getElementById("footer").style.marginLeft = "15%";
            document.getElementById("header").style.marginLeft = "15%";
            document.getElementById("mySidebar").style.width = "15%";
            document.getElementById("mySidebar").style.display = "block";
        }
        function w3_close() {
            document.getElementById("main").style.marginLeft = "0%";
            document.getElementById("footer").style.marginLeft = "0%";
            document.getElementById("header").style.marginLeft = "0%";
            document.getElementById("mySidebar").style.display = "none";
            document.getElementById("openNav").style.display = "inline-block";
        }
    </script>
</div>

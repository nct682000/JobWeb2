<%-- 
    Document   : drawer
    Created on : Aug 18, 2021, 9:55:51 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div>
    <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
        <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
        <a href="#" class="w3-bar-item w3-button">Link 1</a>
        <a href="#" class="w3-bar-item w3-button">Link 2</a>
        <a href="#" class="w3-bar-item w3-button">Link 3</a>
    </div>

    <div id="main">

        <div class="w3-teal">
<!--            <button id="openNav" class="w3-button w3-teal w3-xlarge" onclick="w3_open()">&#9776;</button>-->
            <div class="w3-container">
                <h1>My Page</h1>
            </div>
        </div>

        <img src="img_car.jpg" alt="Car" style="width:100%">

        <div class="w3-container">
            <p>In this example, the sidebar is hidden (style="display:none")</p>
            <p>It is shown when you click on the menu icon in the top left corner.</p>
            <p>When it is opened, it shifts the page content to the right.</p>
            <p>We use JavaScript to add a 25% left margin to the div element with id="main" when this happens. The value "25%" matches the width of the sidebar.</p>
        </div>

    </div>

    
</div>
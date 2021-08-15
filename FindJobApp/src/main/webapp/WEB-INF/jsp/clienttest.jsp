<%-- 
    Document   : clienttest
    Created on : Aug 12, 2021, 3:34:24 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <h1 class="text-center text-danger">My Job Website</h1>
        <ul>
            <c:forEach var="c" items="${careers}">
            <li>${c.id} - ${c.name}</li>
            </c:forEach>
        </ul>
        
        <div class="row">
            <c:forEach var="r" items="${recruitments}">
                <div class="card col-md-6 row">
                    <div class="col-md-3">
                        Imageeeee
                    </div>
                    <div class="col-md-9">
                        <div>${r.id}</div>
                        <div>${r.title}</div>
                        <div>${r.salaryFrom}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
    </body>
</html>

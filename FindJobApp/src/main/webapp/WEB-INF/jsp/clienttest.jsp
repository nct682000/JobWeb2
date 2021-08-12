<%-- 
    Document   : clienttest
    Created on : Aug 12, 2021, 3:34:24 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>client controller</title>
    </head>
    <body>
        <h1>Hello controller</h1>
        <ul>
            <c:forEach var="cat" items="${apply}">
            <li>${cat.id} - ${cat.title}</li>
            </c:forEach>
        </ul>
    </body>
</html>

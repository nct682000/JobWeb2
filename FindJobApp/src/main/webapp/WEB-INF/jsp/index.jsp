<%-- 
    Document   : index
    Created on : Aug 12, 2021, 8:41:58 AM
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
        <title>home controller</title>
    </head>
    <body>
        <h1>Hello ${name}</h1>
        <ul>
            <c:forEach var="cat" items="${categories}">
            <li>${cat.id} - ${cat.name}</li>
            </c:forEach>
        </ul>
    </body>
</html>

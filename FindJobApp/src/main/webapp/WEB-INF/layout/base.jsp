<%-- 
    Document   : base
    Created on : Aug 14, 2021, 3:35:01 PM
    Author     : nct68
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        
        <title>
            <tiles:insertAttribute name="title" />
        </title>
        
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" rel="js" />
        
    </head>
    <body>
        <div>
           <!-- HEADER -->
           <tiles:insertAttribute name="header" />

           <!-- CONTENT -->
           <tiles:insertAttribute name="content" />

           <!-- FOOTER -->
           <tiles:insertAttribute name="footer" />
        </div>
    </body>
</html>

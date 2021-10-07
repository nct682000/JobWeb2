<%-- 
    Document   : base
    Created on : Aug 18, 2021, 9:56:39 AM
    Author     : DELL
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
        <link
            rel="stylesheet"  href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"  integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
            crossOrigin="anonymous"/>
    </head>
    <body class="bg-secondary bg-opacity-25">
        <div >
            <!-- HEADER -->
            <tiles:insertAttribute name="header" />

            <!-- DRAWER -->
            <%--<tiles:insertAttribute name="drawer" />--%>

            <!-- CONTENT -->
            <tiles:insertAttribute name="content" />

            <!-- FOOTER -->
            <tiles:insertAttribute name="footer" />
        </div>
    </body>
</html>

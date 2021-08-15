<%-- 
    Document   : header
    Created on : Aug 14, 2021, 3:38:34 PM
    Author     : nct68
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container pt-1">
    <nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
        <!-- Brand -->
        <a class="navbar-brand" href="/">HOME</a>

        <!-- Links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#">Link 1</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link 2</a>
          </li>

          <!-- Dropdown -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              Dropdown link
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">Link 1</a>
              <a class="dropdown-item" href="#">Link 2</a>
              <a class="dropdown-item" href="#">Link 3</a>
            </div>
          </li>
        </ul>
      </nav>
</div>
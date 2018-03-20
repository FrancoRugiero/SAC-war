<%-- 
    Document   : header
    Created on : Aug 30, 2012, 1:23:02 AM
    Author     : scarafia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<div id="logo-name">
  <%
    //<div id="logo"><img src="img/logo.jpg" alt="Logo"/></div>
    //<div id="logo"><img src="/img/logo.jpg" alt="Logo"/></div>
    //<div id="logo"><img src="<c:url value="/img/logo.jpg"/>" alt="Logo"/></div>
  %>
  <div id="logo"><img src="<c:url value="/img/logo.jpg"/>" alt="Logo"/></div>
  <div id="sitename"><h1>Sistema de Administración de Cursos</h1></div>
</div>

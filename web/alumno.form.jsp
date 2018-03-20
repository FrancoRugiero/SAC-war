<%--
    Document   : alumno.form
    Created on : Aug 29, 2012, 6:02:36 PM
    Author     : scarafia
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Datos del alumno</title>
    <link href="<c:url value="/css/layout.css"/>" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="page">
      <div id="header">
        <jsp:include page="header.jsp"/>
      </div>
      <div id="main">
        <div id="left-sidebar">
          <jsp:include page="menu.jsp"/>
        </div>
        <div id="content">
          <div class="form-msg">${formMsg}</div>
          <div class="alumno">
            <form accept-charset="ISO-8859-1" id="alumno-form" method="post" action="<c:url value="/alumno/save"/>">
              <input type="hidden" name="id" value="${alumno.id}">
              <div class="form-fields">
                <div class="form-field">
                  <label>Apellido:</label>
                  <input name="apellido" value="${alumno.apellido}">
                </div>
                <div class="form-field">
                  <label>Nombre:</label>
                  <input name="nombre" value="${alumno.nombre}">
                </div>
                <div class="form-field">
                  <label>DNI:</label>
                  <input name="dni" value="${alumno.dni}">
                </div>
                <div class="form-field">
                  <label>Legajo:</label>
                  <input name="legajo" value="${alumno.legajo}">
                </div>
              </div>
              <div class="form-buttons">
                <div class="form-button">
                  <input type="submit" value="Guardar">
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div id="footer">
        <jsp:include page="footer.jsp" />
      </div>
    </div>
  </body>
</html>

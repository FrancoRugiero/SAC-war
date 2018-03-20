<%--
    Document   : curso.form
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
    <title>Datos del curso</title>
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
          <div class="curso">
            <form accept-charset="ISO-8859-1" id="curso-form" method="post" action="<c:url value="/curso/save"/>">
              <input type="hidden" name="id" value="${curso.id}">
              <input type="hidden" name="inscriptos" value="${curso.inscriptos}">
              <div class="form-fields">
                <div class="form-field">
                  <label>Curso:</label>
                  <input type="text" name="nombre" value="${curso.nombre}">
                </div>
                <div class="form-field">
                  <label>Fecha de Alta:</label>
                  <input type="text" name="fechaalta" value="${curso.fechaAlta}">
                </div>
                <div class="form-field">
                  <label>Fecha de Baja:</label>
                  <input type="text" name="fechabaja" value="${curso.fechaBaja}">
                </div>
                <div class="form-field">
                  <label>Descripción:</label>
                  <textarea name="descripcion" rows="5" cols="20">${curso.descripcion}</textarea>
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

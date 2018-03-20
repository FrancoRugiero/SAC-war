<%-- 
    Document   : alumno
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
    <title>${alumno.nombre} ${alumno.apellido}</title>
    <link href="<c:url value="/css/layout.css"/>" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<c:url value="/js/sac.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/calificaciones.js"/>"></script>
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
          <div class="alumno">
            <div class="alumno-title">
              <h2>${alumno.nombre} ${alumno.apellido}</h2>
            </div>
            <div class="alumno-main">
              <div class="alumno-fields">
                <div class="alumno-field">
                  <dl>
                    <dt class="field-label">Apellido:</dt>
                    <dd class="field-data">${alumno.apellido}</dd>
                  </dl>
                </div>
                <div class="alumno-field">
                  <dl>
                    <dt class="field-label">Nombre:</dt>
                    <dd class="field-data">${alumno.nombre}</dd>
                  </dl>
                </div>
                <div class="alumno-field">
                  <dl>
                    <dt class="field-label">DNI:</dt>
                    <dd class="field-data">${alumno.dni}</dd>
                  </dl>
                </div>
                <div class="alumno-field">
                  <dl>
                    <dt class="field-label">Legajo:</dt>
                    <dd class="field-data">${alumno.legajo}</dd>
                  </dl>
                </div>
              </div>
            </div>
            <div class="alumno-tasks clearfix">
              <div class="task">
                <button id="alumno-edit">Editar</button>
              </div>
              <div class="task">
                <button id="alumno-delete">Eliminar</button>
              </div>
            </div>
            <div class="calificaciones">
              <h4>Calificaciones</h4>
              <div id="calificaciones-cursos" class="clearfix">

              </div>
              <div id="calificaciones-notas" class="clearfix">

              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="footer">
        <jsp:include page="footer.jsp" />
      </div>
    </div>
    <script type="text/javascript">
      function alumnoEdit() {
        window.location = "<c:url value="/alumno/edit?id=${alumno.id}"/>";
      }
      function alumnoDelete() {
        if (confirm("Seguro de eliminar el alumno ${alumno.nombre} ${alumno.apellido}?")) {
          window.location = "<c:url value="/alumno/delete?id=${alumno.id}"/>";
        }
      }
      document.getElementById("alumno-edit").onclick = alumnoEdit;
      document.getElementById("alumno-delete").onclick = alumnoDelete;
    </script>
    <script type="text/javascript">
      refreshCalificacionesCursos("<c:url value="/calificaciones.cursos.jsp?id=${alumno.id}"/>");
    </script>
  </body>
</html>

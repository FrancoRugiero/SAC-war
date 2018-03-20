<%-- 
    Document   : alumnos
    Created on : Aug 29, 2012, 6:43:48 PM
    Author     : scarafia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alumnos</title>
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
          <table border="1">
            <thead>
              <tr>
                <th>Legajo</th>
                <th>Nombre</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${alumnos}" var="alumno">
                <tr>
                  <td>${alumno.legajo}</td>
                  <td><a href="<c:url value="/alumno/view?id=${alumno.id}"/>">${alumno.apellido}, ${alumno.nombre}</a></td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <div class="alumnos-tasks">
            <div class="task">
              <button id="alumno-add">Nuevo Alumno</button>
            </div>
          </div>
        </div>
      </div>
      <div id="footer">
        <jsp:include page="footer.jsp" />
      </div>
    </div>
    <script type="text/javascript">
      function alumnoAdd() {
        window.location = "<c:url value="/alumno/add"/>";
      }
      document.getElementById("alumno-add").onclick = alumnoAdd;
    </script>
  </body>
</html>

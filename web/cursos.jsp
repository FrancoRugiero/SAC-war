<%--
    Document   : cursos
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
    <title>Cursos</title>
    <link href="<c:url value="/css/layout.css"/>" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <div id="page">
      <div id="header">
        <jsp:include page="header.jsp"/>
      </div>
      <div id="main" class="clearfix">
        <div id="left-sidebar">
          <jsp:include page="menu.jsp"/>
        </div>
        <div id="content" class="clearfix">
          <c:forEach items="${cursos}" var="curso">
            <div class="curso">
              <h2>
                <a href="<c:url value="/curso/view?id=${curso.id}"/>">${curso.nombre}</a>
                <span class="details-wrapper">
                  <span class="details">Alumnos inscriptos: ${curso.inscriptos}</span>
                  <span class="details">Fecha de alta: ${curso.fechaAlta}</span>
                  <c:if test="${curso.fechaBaja != null}">
                    <span class="details">Fecha de baja: ${curso.fechaBaja}</span>
                  </c:if>
                </span>
              </h2>
              <div class="descripcion">
                ${curso.descripcion}
              </div>
            </div>
          </c:forEach>
          <div class="cursos-tasks">
            <div class="task">
              <button id="curso-add">Nuevo Curso</button>
            </div>
          </div>
        </div>
      </div>
      <div id="footer">
        <jsp:include page="footer.jsp" />
      </div>
    </div>
    <script type="text/javascript">
      function cursoAdd() {
        window.location = "<c:url value="/curso/add"/>";
      }
      document.getElementById("curso-add").onclick = cursoAdd;
    </script>
  </body>
</html>

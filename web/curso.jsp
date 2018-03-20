<%--
    Document   : curso
    Created on : Aug 29, 2012, 6:02:36 PM
    Author     : scarafia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${curso.nombre}</title>
    <link href="<c:url value="/css/layout.css"/>" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <script type="text/javascript">
      function cursoDesinscribir(id, nombre) {
        if (confirm("Seguro de desinscribir a " + nombre + "?")) {
          window.location = "<c:url value="/curso/desinscribir?id=${curso.id}&alumno="/>" + id;
        }
      }
    </script>
    <div id="page">
      <div id="header">
        <jsp:include page="header.jsp"/>
      </div>
      <div id="main">
        <div id="left-sidebar">
          <jsp:include page="menu.jsp"/>
        </div>
        <div id="content">
          <div class="curso">
            <div class="curso-title">
              <h2>${curso.nombre}</h2>
            </div>
            <div class="curso-main">
              <div class="curso-fields">
                <div class="curso-field">
                  <dl>
                    <dt class="field-label">Curso:</dt>
                    <dd class="field-data">${curso.nombre}</dd>
                  </dl>
                </div>
                <div class="curso-field">
                  <dl>
                    <dt class="field-label">Descripción:</dt>
                    <dd class="field-data">
                      ${curso.descripcion}
                    </dd>
                  </dl>
                </div>
                <div class="curso-field">
                  <dl>
                    <dt class="field-label">Inscriptos:</dt>
                    <dd class="field-data">${curso.inscriptos}</dd>
                  </dl>
                </div>
                <div class="curso-field">
                  <dl>
                    <dt class="field-label">Fecha de alta:</dt>
                    <dd class="field-data">${curso.fechaAlta}</dd>
                  </dl>
                </div>
                <div class="curso-field">
                  <dl>
                    <dt class="field-label">Fecha de baja:</dt>
                    <dd class="field-data">${curso.fechaBaja}</dd>
                  </dl>
                </div>
              </div>
              <div class="curso-tasks clearfix">
                <div class="task">
                  <button id="curso-edit">Editar</button>
                </div>
                <div class="task">
                  <button id="curso-inscribir">Inscribir</button>
                </div>
                <div class="task">
                  <button id="curso-delete">Eliminar</button>
                </div>
              </div>
              <div class="inscriptos">
                <h4>Alumnos inscriptos</h4>
                <table border="1">
                  <thead>
                    <tr>
                      <th>Legajo</th>
                      <th>Alumno</th>
                      <td>Acción</td>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${curso.alumnos}" var="alumno">
                      <tr>
                        <td>${alumno.legajo}</td>
                        <td>${alumno.nombre} ${alumno.apellido}</td>
                        <td align="center">
                          <button onclick='cursoDesinscribir(${alumno.id}, "${alumno.nombre} ${alumno.apellido}");'>
                            X
                          </button>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
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
      function cursoEdit() {
        window.location = "<c:url value="/curso/edit?id=${curso.id}"/>";
      }
      function cursoInscribir() {
        window.location = "<c:url value="/curso/inscribir?id=${curso.id}"/>";
      }
      function cursoDelete() {
        if (confirm("Seguro de eliminar el curso ${curso.nombre}?")) {
          window.location = "<c:url value="/curso/delete?id=${curso.id}"/>";
        }
      }
      document.getElementById("curso-edit").onclick = cursoEdit;
      document.getElementById("curso-inscribir").onclick = cursoInscribir;
      document.getElementById("curso-delete").onclick = cursoDelete;
    </script>
  </body>
</html>

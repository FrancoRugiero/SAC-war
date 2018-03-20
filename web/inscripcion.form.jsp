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
    <title>Inscripción</title>
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
                    <dt class="field-label">Fecha de Baja:</dt>
                    <dd class="field-data">${curso.fechaBaja}</dd>
                  </dl>
                </div>
              </div>
              <div class="candidatos">
                <form accept-charset="ISO-8859-1" id="curso-form" method="post" action="<c:url value="/curso/saveinscripcion"/>">
                  <input type="hidden" name="id" value="${curso.id}">
                  <table>
                    <thead>
                      <tr>
                        <th>Legajo</th>
                        <th>Alumno</th>
                        <td>Seleccionar</td>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${candidatos}" var="candidato">
                        <tr>
                          <td>${candidato.legajo}</td>
                          <td>${candidato.nombre} ${candidato.apellido}</td>
                          <td align="center">
                            <input type="checkbox" name="alumno-${candidato.id}">
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  <div class="form-buttons">
                    <div class="form-button">
                      <input type="submit" value="Guardar">
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="footer">
        <jsp:include page="footer.jsp" />
      </div>
    </div>
  </body>
</html>

<%-- 
    Document   : menu
    Created on : Aug 30, 2012, 1:27:22 AM
    Author     : scarafia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="menu" />

<div id="mainmenu">
  <ul>
    <c:forEach items="${mainmenu}" var="item">
      <li><a href="${item.url}">${item.title}</a></li>
      </c:forEach>
  </ul>
</div>

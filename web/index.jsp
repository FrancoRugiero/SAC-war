<%-- 
    Document   : index
    Created on : Mar 20, 2013, 3:37:38 PM
    Author     : scarafia
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SAC</title>
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
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum vulputate elementum. Praesent metus nisi, pharetra interdum interdum ac, facilisis nec magna. Quisque vestibulum ante nec metus iaculis vitae venenatis sapien adipiscing. Donec sed varius tortor. Praesent consectetur est quis orci scelerisque eu fringilla augue porta. Nunc consequat, velit et tempor hendrerit, lacus erat rutrum nibh, varius feugiat erat quam vel mi. Donec pellentesque, magna ac tincidunt ultricies, est justo suscipit lectus, a mollis purus metus eget dui. In magna neque, ullamcorper eu dignissim sit amet, rhoncus ut urna. Fusce eros tellus, fermentum at luctus a, venenatis at ante. Duis est nulla, tempus quis iaculis eget, cursus sed purus. Aliquam eleifend fermentum sapien, ut sollicitudin massa dapibus ac. Vivamus a leo enim, vitae ullamcorper tellus. Phasellus ut pulvinar nibh. Morbi a ligula et dolor volutpat viverra. Sed viverra, metus interdum ultricies mollis, orci massa laoreet nisl, non sollicitudin eros dui id ipsum.
          </p>
          <p>
            Sed mi est, viverra vel convallis sed, iaculis ac erat. Pellentesque fringilla semper pharetra. Integer tincidunt sollicitudin ultricies. Etiam lobortis congue leo in placerat. Sed erat tellus, bibendum ut vestibulum et, viverra vel magna. Suspendisse potenti. Donec id metus tortor. Ut semper lobortis porttitor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean nec odio nunc. Morbi vehicula ullamcorper nisl.
          </p>
          <p>
            Vestibulum ut tellus et nulla faucibus tincidunt a ut lectus. Proin feugiat volutpat enim, a condimentum lectus aliquam quis. Mauris sed lectus magna, at blandit urna. Maecenas gravida ornare hendrerit. Etiam viverra dictum tellus, quis pulvinar sem convallis eget. Maecenas vel metus et nisl gravida tempor a eu odio. Morbi dui nulla, venenatis non adipiscing sit amet, imperdiet at urna. Integer feugiat fringilla leo.
          </p>
          <p>
            Sed sed mi eget ipsum aliquet dapibus a at justo. Nam vulputate interdum rutrum. Quisque in sapien vitae orci dignissim porttitor nec a purus. Nam suscipit viverra erat id adipiscing. Nulla vitae metus quam. Quisque at pharetra arcu. Duis sodales aliquam felis, quis tincidunt massa ultrices vitae. Pellentesque vel felis a diam ullamcorper vehicula a eu felis. Donec ligula mauris, hendrerit eget adipiscing ac, adipiscing ut urna. Morbi augue est, ullamcorper a faucibus id, tincidunt non orci. Pellentesque pellentesque aliquet urna blandit ornare.
          </p>
          <p>
            Maecenas rutrum egestas sem nec pretium. Integer odio augue, mollis at viverra et, pharetra et purus. Vestibulum sed velit consectetur eros dignissim posuere. Duis iaculis felis id neque suscipit quis commodo tortor lacinia. Vivamus egestas nulla neque. Quisque auctor lectus non nisi sodales eu scelerisque nunc viverra. Sed ligula mi, porttitor at cursus non, egestas et orci. Curabitur at turpis et urna elementum adipiscing. Mauris interdum lorem sed purus molestie eget ultrices urna tincidunt. Sed feugiat lacus nec mauris gravida vitae venenatis libero laoreet. Nulla facilisi. Vestibulum laoreet dui a ligula vehicula in porttitor quam tempor. Suspendisse ut fermentum dui.
          </p>
        </div>
      </div>
      <div id="footer">
        <jsp:include page="footer.jsp" />
      </div>
    </div>
  </body>
</html>

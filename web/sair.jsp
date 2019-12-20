<%-- 
    Document   : sair
    Created on : 31/05/2019, 20:35:17
    Author     : Joe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("usuario");
            session.removeAttribute("perfil");
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>

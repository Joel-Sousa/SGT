<%-- 
    Document   : cadastrado
    Created on : 01/06/2019, 20:32:02
    Author     : Joe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String user = (String) request.getAttribute("user");
        %>
        <script>
            alert("<%=user%> Cadastrado!");
            window.location.href="listaUsuarios.jsp"
        </script>
    </head>

    <body>

    </body>
</html>

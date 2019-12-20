<%-- 
    Document   : alterarUsuario
    Created on : 02/06/2019, 18:59:01
    Author     : Joe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String user = (String) session.getAttribute("usuario");
            if (user == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        %>
        <link rel="stylesheet" type="text/css" href="css/textArea.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="index.jsp"><img src="img/home.png" alt="set" style="width: 60px;"/></a><br>
            <%
                String codigo = "";
                String id = "";
                String usuario = "";
                String senha = "";
                String perfil = "";
                
                codigo = (String) request.getAttribute("codigo").toString();
                id = (String) request.getAttribute("id").toString();
                usuario = (String) request.getAttribute("usuario").toString();
                senha = (String) request.getAttribute("senha").toString();
                perfil = (String) request.getAttribute("perfil").toString();
            %>
    <center><h3>.:Alterar Usuario:.</h3></center>
    <form action="alt" method="post">
        <table align='center'>
            <tr>
                
                <td colspan="2"><input type="hidden" name="codigo" value="<%=codigo%>" class="txt"></td>
            </tr>
            <tr>
                <td>Chave: </td>
                <td><input type="text" name="id" value="<%=id%>" class="txt" readonly="true"></td>
            </tr>
            <tr>
                <td>Usuario: </td>
                <td><input type="text" name="usuario" value="<%=usuario%>" class="txt"></td>
            </tr>
            <tr>
                <td>Senha: </td>
                <td><input type="password" name="senha" value="<%=senha%>" class="txt"></td>
            </tr>
            <tr>
                <td>Perfil: </td>
                <td>
                    <select name="perfil" id="dat2">
                        <% if (perfil.equals("Tecnico")) {%>
                        <option selected value='Tecnico'>Tecnico</option>
                        <option value='Gestor'>Gestor</option>
                        <%} else {%>
                        <option  value='Tecnico'>Tecnico</option>
                        <option selected value='Gestor'>Gestor</option>
                        <%}%>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Alterar" id="btnCad"></td>
            </tr>
        </table>
    </form>
</body>
</html>

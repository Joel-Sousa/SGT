<%-- 
    Document   : listaUsuarios
    Created on : 02/06/2019, 11:49:15
    Author     : Joe
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="controller.UsuarioDTO"%>
<%@page import="dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String user = (String) session.getAttribute("usuario");
            if(user == null){
           request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        %>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script language="Javascript">
            function confirmacao(id) {
                var resposta = confirm("Deseja Excluir esse Usuario?");
                if (resposta === true) {

                    window.location.href = "excId?cod=" + id;
                 }
            }
        </script>

    </head>
    <body>
        <a href="index.jsp"><img src="img/home.png" alt="set" style="width: 60px;"/></a><br><br>
        <a href="listaResponsaveis.jsp"><input type="button" value="Responsaveis"></a><br>
        <a href="cadastrarUsuario.jsp"><input type="button" value="Adcionar"></a>

    <center><h2>.:Usuarios:.</h2></center><br>
    <div class="container">
        <table border=0 cellpadding=0 cellspacing=0 width='10px' align="center" style="text-align: center; width: 700px;" class="table table-striped">
            <tr style="font-weight: bold;">
                <td>Chave</td>
                <td>Usuario</td>
                <td>Perfil</td>
                <td>Alterar</td>
                <td>Excluir</td>
            </tr>

            <%
                String codigo = "";
                String id = "";
                String usuario = "";
                String perfil = "";

                Connection con;
                con = DAO.Conexao();

                UsuarioDAO uDAO = new UsuarioDAO(con);
                UsuarioDTO uDTO = new UsuarioDTO();

                ArrayList<UsuarioDTO> nomes = uDAO.pesquisarTudo();

                for (int i = 0; i < nomes.size(); i++) {
                    uDTO = nomes.get(i);
                    
                    codigo = String.valueOf(uDTO.getCodigo());
                    id = String.valueOf(uDTO.getId());
                    usuario = String.valueOf(uDTO.getUsuario());
                    perfil = String.valueOf(uDTO.getPerfil());
            %>

            <tr>
                <td><%=id%></td>
                <td><%=usuario%></td>
                <td><%=perfil%></td>
                <!--<td><a href="altId?id=<%//=id%>" ><input type="button" value="Alterar"></a></td>-->
                <td><a href="altId?cod=<%=codigo%>" ><b class='glyphicon glyphicon-pencil' title='Alterar'></b></a></td>

<!--<td><a href="javascript:func()" onclick="confirmacao(<%//=id%>)" ><input type="button" value="Excluir"></a></td>-->
                <td><a href="javascript:func()" onclick="confirmacao(<%=codigo%>)" ><b class='glyphicon glyphicon-trash' title='Excluir'></b></a></td>
            </tr>
            <%}%>
        </table>
    </div>
</body>
</html>

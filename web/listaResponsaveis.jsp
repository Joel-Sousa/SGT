<%-- 
    Document   : listaResponsaveis
    Created on : 11/06/2019, 14:21:13
    Author     : Joe
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="controller.ResponsavelDTO"%>
<%@page import="dao.ResponsavelDAO"%>
<%@page import="dao.DAO"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><%
            String usuario = (String) session.getAttribute("usuario");
            if(usuario == null){
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
                var resposta = confirm("Deseja Excluir esse Responsavel?");
                if (resposta === true) {

                    window.location.href = "excIdResp?id=" + id;
                 }
            }
        </script>
    </head>
    <body>
        <a href="index.jsp"><img src="img/home.png" alt="set" style="width: 60px;"/></a><br><br>
        <a href="listaUsuarios.jsp"><input type="button" value="Usuarios"></a>

    <center><h2>.:Responsaveis:.</h2></center><br>
    <div class="container">
    <table border=0 cellpadding=0 cellspacing=0 width='10px' align="center" style="text-align: center; width: 800px;" class="table table-striped">
        <tr style="font-weight: bold;">
            <td>Chave Responsavel</td>
            <td>Nome</td>
            <td>Funcao</td>
            <td>Alterar</td>
            <td>Excluir</td>
        </tr>

        <%
            String chv_fun_responsavel = "";
            String nm_resp = "";
            String funcao = "";
            String cod_resp = "";

            Connection con;
            con = DAO.Conexao();

            ResponsavelDAO rDAO = new ResponsavelDAO(con);
            ResponsavelDTO rDTO = new ResponsavelDTO();

            ArrayList<ResponsavelDTO> nomes = rDAO.pesquisarTudo();

            for (int i = 0; i < nomes.size(); i++) {
                rDTO = nomes.get(i);

                chv_fun_responsavel = String.valueOf(rDTO.getChv_fun_responsavel());
                nm_resp = String.valueOf(rDTO.getNm_resp());
                funcao = String.valueOf(rDTO.getFuncao());
                cod_resp = String.valueOf(rDTO.getCod_resp());
        %>

        <tr>
            <td><%=chv_fun_responsavel%></td>
            <td><%=nm_resp%></td>
            <td><%=funcao%></td>
            <!--<td><a href="altIdResp?id=<%//=cod_resp%>" ><input type="button" value="Alterar"></a></td>-->
            <td><a href="altIdResp?id=<%=cod_resp%>" ><b class='glyphicon glyphicon-pencil' title='Alterar'/></a></td>
            
            <!--<td><a href="javascript:func()" onclick="confirmacao(<%//=cod_resp%>)" ><input type="button" value="Excluir"></a></td>-->
            <td><a href="javascript:func()" onclick="confirmacao(<%=cod_resp%>)" ><b class='glyphicon glyphicon-trash' title='Excluir'/></a></td>
        </tr>
        <%}%>
    </table>
    </div>
</body>
</html>

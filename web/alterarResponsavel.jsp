<%-- 
    Document   : alterarResponsavel
    Created on : 11/06/2019, 16:05:37
    Author     : Joe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            String usuario = (String) session.getAttribute("usuario");
            if(usuario == null){
           request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        %>
        <link rel="stylesheet" type="text/css" href="css/textArea.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="faces/index.jsp"><img src="img/home.png" alt="set" style="width: 60px;"/></a><br>
        <%  
        String chv_fun_responsavel = "";
        String nm_resp = "";
        String funcao = "";
        String color = "";
        String cod_resp = "";
       

         chv_fun_responsavel = (String) request.getAttribute("chv_fun_responsavel").toString();
         nm_resp = (String) request.getAttribute("nm_resp").toString();
         funcao = (String) request.getAttribute("funcao").toString();
         color = (String) request.getAttribute("color").toString();
         cod_resp = (String) request.getAttribute("cod_resp").toString();
         
    %>
    
    <center><h3>.:Alterar Responsavel:.</h3></center>
    <form action="altResp" method="post">
        <table align="center">
            <tr>
                <td>Chave: </td>
                <td><input type="text" name="chv_fun_responsavel" value="<%=chv_fun_responsavel%>" class="txt" readonly="true"></td>
            </tr>
            <tr>
                <td>Nome: </td>
                <td><input type="text" name="nm_resp" value="<%=nm_resp%>" class="txt"></td>
            </tr>
            <tr>
                <td>Funcao: </td>
                <td><input type="text" name="funcao" value="<%=funcao%>" class="txt"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="hidden" name="color" value="<%=color%>"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="hidden" name="cod_resp" value="<%=cod_resp%>"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Alterar" id="dat2"></td>
            </tr>
        </table>
    </form>
    </body>
</html>

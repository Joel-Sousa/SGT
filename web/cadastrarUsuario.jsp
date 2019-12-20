<%-- 
    Document   : cadastrarUsuario
    Created on : 31/05/2019, 18:04:28
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/sLogin.css"/>
    </head>
    <body>
        <a href="index.jsp"><img src="img/home.png" alt="set" style="width: 70px;"/></a>
       <div class="centerLogin">
           <center><h2>Cadastrar Usuario</h2></center>
            <form method="post" name="frmLogin" action="cadUsr">
                <div class="emailLogin formularioLogin"> 
                    <img src="img/user.png" alt="E-mail" />
                    <input type="text" name="id" required="true" placeholder="Chave" autocomplete="off" />
                </div>
                
                <div class="emailLogin formularioLogin"> 
                    <img src="img/user.png" alt="E-mail" />
                    <input type="text" name="usuario" required="true" placeholder="Usuario" autocomplete="off" />
                </div>

                <div class="senhaLogin formularioLogin">
                    <img src="img/pass.png" alt="Senha" />
                    <input type="password" name="senha" required="senha"placeholder="Senha" autocomplete="off" />
                </div>
                <div class="senhaLogin formularioLogin">
                    <img src="img/user.png" alt="Senha" />
                    <select name="perfil" id="appearance-select">
                        <option value="Tecnico">Tecnico</option>
                        <option value="Gestor">Gestor</option>
                    </select>
                </div>

                <input type="submit" name="btnSubmit" value="Cadastrar" class="btnSubmitLogin" />&nbsp;&nbsp;&nbsp;
                <font color="red" size="4">
        </font>
            </form>
        </div>
    </body>
</html>

<%-- 
    Document   : login
    Created on : 19/04/2019, 18:15:09
    Author     : joe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/sLogin.css"/>
        <style> body{ background: #8ea1f3;}</style>
        <% String resp = (String) request.getAttribute("resp");%>
        <script>
            if(<%=resp%> == "5"){
                alert("Usuario Nao Cadastrado!");
            }
        </script>
        
        <title>JSP Page</title>
        
    </head>
    <body>
    
    <div class="centerLogin">
    <center><h2>SGT</h2></center>    
            <form method="post" name="frmLogin" action="pug">
                <div class="emailLogin formularioLogin">
                    <img src="img/user.png" alt="E-mail" />
                    <input type="text" name="usuario" required="true" placeholder="Usuario" autocomplete="off" />
                </div>

                <div class="senhaLogin formularioLogin">
                    <img src="img/pass.png" alt="Senha" />
                    <input type="password" name="senha" required="senha" placeholder="********" autocomplete="off" />
                </div>

                <input type="submit" name="btnSubmit" value="Login" class="btnSubmitLogin" />&nbsp;&nbsp;&nbsp;
                <font color="red" size="4">
        </font>
            </form>
            
        </div>
    </body>
</html>

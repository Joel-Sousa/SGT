<%-- 
    Document   : newjsp
    Created on : 01/06/2019, 19:14:49
    Author     : Joe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script>
function myFunction()
{
var u,s,p;
 
var usuario=prompt("Digite seu usuario:");
var senha=prompt("Digite sua senha:");
var perfil=prompt("Digite seu perfil:");
 
if (usuario!=null){
  u=usuario;
  s=senha;
  p=perfil;
  
  document.getElementById("user").innerHTML=u;
  document.getElementById("pass").innerHTML=s;
  document.getElementById("profile").innerHTML=p;
  
  window.location.href = "cadUsr?usuario="+u+"&senha="+s+"&perfil="+p;
  
  
  }
}
</script>
        
    </head>
    <body>
        
        
        <p id="user"></p>
        <p id="pass"></p>
        <p id="profile"></p>
        <button onclick="myFunction()">Clique aqui</button>
    </body>
</html>

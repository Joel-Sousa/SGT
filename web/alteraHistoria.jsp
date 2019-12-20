<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 
<html lang="pt-br">
<body>
<%      
   int cod_rotina = Integer.parseInt(request.getParameter("cod_rotina"));
   String nome =  (request.getParameter("nome"));
   String hora_inicio = (request.getParameter("hora_inicio"));
   String dataRotina = (request.getParameter("dataRotina"));
   String duracao_prevista = (request.getParameter("duracao_prevista"));
   int tipo_rotina = Integer.parseInt(request.getParameter("tipo_rotina"));
   
   System.out.println("cod_rotina" + cod_rotina);
   System.out.println("nome" + nome);
   System.out.println("hora_inicio" + hora_inicio);
   System.out.println(" duracao_prevista" + duracao_prevista);
   
  boolean rs;   
   rs=alteraRotina( nome,  hora_inicio,  duracao_prevista ,  tipo_rotina ,  dataRotina,cod_rotina );
   if(rs) {

%>    
<script>
   alert("Alterado com sucesso");
</script>
<%} else {%>
<script>
    alert("Falha na Alteracao ");
</script>
<%}%>

<script>
    
    
setTimeout(encherRotina,100);
function encherRotina(){
    $("#main").load("encheRotina.jsp",{});
    $('#Div_Detalhe_Rotina').dialog("close");    
}

</script>
</body>
</html>

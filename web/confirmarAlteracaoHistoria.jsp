<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 
<html lang="pt-br">
<%      
   String divIdHistoria = (request.getParameter("divIdHistoria"));
   String CD_SIS = (request.getParameter("CD_SIS"));
   String prioridade = (request.getParameter("prioridade"));
   String situacao = (request.getParameter("situacao"));
   String resumo = (request.getParameter("resumo"));
   String descricao = (request.getParameter("descricao"));
   
   System.out.println(" divIdHistoria" + divIdHistoria);
   System.out.println(" CD_SIS" + CD_SIS);
   System.out.println("prioridade" + prioridade);
   System.out.println("situacao" + situacao);
   System.out.println("descricao" + descricao);
   System.out.println("resumo" + resumo);
  
    
   boolean rs; 
   
   rs = alteraHistoria(resumo, descricao, situacao, prioridade, divIdHistoria );
   if(rs) {

 %>    
 
    
 <script>
           
                alert("Historia alterada com sucesso "); 
           
 </script>

 <%}
 else{
 %>
 <script>
                alert("Falha na execucao !");
           
 </script>
 
<%} %>

<script>

</script>
<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp"%>

<%@page contentType="text/html; charset=utf8"%> 
<html lang="pt-br">
    <%      
   String NM_QUADRO = (request.getParameter("NM_QUADRO"));
   String controle = (request.getParameter("controle"));
   String data_entrega = (request.getParameter("data_entrega"));
   String CHV_FUN_RESPONSAVEL = (request.getParameter("CHV_FUN_RESPONSAVEL"));
   String CHV_FUN_GRAVACAO = (request.getParameter("CHV_FUN_GRAVACAO"));
   
   System.out.println("NM_QUADRO " + NM_QUADRO);
   //System.out.println("data" + data);
   System.out.println("data_entrega: " + data_entrega);
   System.out.println("CHV_FUN_RESPONSAVEL: " + CHV_FUN_RESPONSAVEL);
  
    
   boolean rs; 
   
   rs = gravaQuadro(NM_QUADRO, chave_x, CHV_FUN_RESPONSAVEL );
   if(rs) {}
 else{
 %>
 <script>
         alert("Falha na execucao !");
           
 </script>
 
<%} %>

<script>
       $("#main").load("encheResponsavel.jsp", {});
       $('#divDlgAdcionarQuadro').dialog("close");
//       detalhaQuadroMax(<%=controle%>, '<%=CHV_FUN_GRAVACAO%>');
</script>
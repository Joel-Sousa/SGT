<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 



<%=chave_x%>
<%

    String CHV_FUN_RESPONSAVEL = (request.getParameter("CHV_FUN_RESPONSAVEL"));
    String NM_RESP = (request.getParameter("NM_RESP"));
    String FUNCAO = (request.getParameter("FUNCAO"));
    String COLOR = (request.getParameter("COLOR"));

    System.out.println(" CHV_FUN_RESPONSAVEL " + CHV_FUN_RESPONSAVEL);
    System.out.println(" NM_RESP" + NM_RESP);
    System.out.println(" FUNCAO" + FUNCAO);
    boolean rs;
    rs = gravaResponsavel(CHV_FUN_RESPONSAVEL, NM_RESP, FUNCAO,COLOR);
    if (rs) { %>

<script>
    alert("Responsavel Gravado com Sucesso");
</script>

<%} else {%> 

<script>
    alert("Falha");
</script>

<%}%>

<script>
    $("#divDlgAdcionarResponsavel").dialog("close");
    $("#main").load("encheResponsavel.jsp", {});

</script>




<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 



<%=chave_x%>
<%
    String CHV_FUN_RESPONSAVEL = (request.getParameter("CHV_FUN_RESPONSAVEL"));
    String DESCRICAO = (request.getParameter("DESCRICAO"));
    String CD_QUADRO = (request.getParameter("CD_QUADRO"));
    String SITUACAO_QUADRO = (request.getParameter("SITUACAO_QUADRO"));
    String descricao = (request.getParameter("descricao"));
    String dtRequisicao = (request.getParameter("dtRequisicao"));
    String NM_RESP = (request.getParameter("NM_RESP"));
    String NM_QUADRO = (request.getParameter("NM_QUADRO"));
    String ARQUIVO = (request.getParameter("ARQUIVO"));

    System.out.println(" ARQUIVO " + ARQUIVO);
    System.out.println(" DESCRICAO: " + DESCRICAO);
    System.out.println(" CHV_FUN_REQUISICAO:" + chave_x);
    System.out.println(" DESCRICAO:" + descricao);
    System.out.println(" CD_QUADRO:" + CD_QUADRO);
    System.out.println(" SITUACAO_QUADRO: " + SITUACAO_QUADRO);
    System.out.println(" dtRequisicao" + dtRequisicao);
    System.out.println(" NM_RESP" + NM_RESP);
    System.out.println(" NM_QUADRO" + NM_QUADRO);

    boolean rs;
    rs = gravaHistoria(descricao, chave_x, CD_QUADRO);
    if (rs) {
    } 
    else {%> 

<script>
    alert("Falha");
</script>

<%}%>

<script>
    // $("#divDlgAdcionarHistoria").dialog("close");
    detalhaQuadro(1, '<%=CD_QUADRO%>', '<%=CHV_FUN_RESPONSAVEL%>', '<%=NM_RESP%>');
</script>




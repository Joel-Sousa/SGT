<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 

<%
    //int idProtocolo = Integer.parseInt(request.getParameter("idProtocolo"));
    String nomeArquivo = request.getParameter("nomeArquivo");
    String novoNomeArquivo = request.getParameter("novoNomeArquivo");
    String ID_HST = (request.getParameter("ID_HST"));
    String CD_QUADRO = (request.getParameter("CD_QUADRO"));
    String CHV_FUN_RESPONSAVEL = request.getParameter("CHV_FUN_RESPONSAVEL");
    //System.out.println("novoNomeArquivo :"+novoNomeArquivo);

    boolean resultGravacao = GravaArquivo(ID_HST,nomeArquivo, novoNomeArquivo);

    if (resultGravacao) {
%>
<script>
    alert("Arquivo gravado com sucesso !");
</script>
<%
} else {
%>
<script>
    alert("Falha na Gravaçao !");
</script>
<%
    }
%>

<script>
    $("#divEncheResponsavel").load("encheResponsavel.jsp", {});
    detalhaQuadro(1, '<%=CD_QUADRO%>', '<%=CHV_FUN_RESPONSAVEL%>');
</script>
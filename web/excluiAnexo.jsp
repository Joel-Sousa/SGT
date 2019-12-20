<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 

<%
    int idAnexo = Integer.parseInt(request.getParameter("idAnexo"));
    String CD_QUADRO = (request.getParameter("CD_QUADRO"));
    String CHV_FUN_RESPONSAVEL = request.getParameter("CHV_FUN_RESPONSAVEL");
    boolean resultExclusao = excluiAnexo(idAnexo);

    if (resultExclusao) {
%>
<script>
    alert("Exclusão do Arquivo efetuada com sucesso !");
</script>
<%
} else {
%>
<script>
    alert("Erro na Excluisão do Arquivo !");
</script>
<%
    }
%>

<script>

    $("#divEncheResponsavel").load("encheResponsavel.jsp", {});
    detalhaQuadro(1, '<%=CD_QUADRO%>','<%=CHV_FUN_RESPONSAVEL%>');
</script>
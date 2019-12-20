<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp"%>

<%@page contentType="text/html; charset=utf8"%> 
<html lang="pt-br">
    <%=chave_x%>
    <%
        String comentario = (request.getParameter("comentario"));
        String ID_HST = (request.getParameter("ID_HST"));
        String CD_QUADRO = (request.getParameter("CD_QUADRO"));
        String NM_RESP = (request.getParameter("NM_RESP"));
        String NM_QUADRO = (request.getParameter("NM_QUADRO"));
        String CHV_FUN_RESPONSAVEL = (request.getParameter("CHV_FUN_RESPONSAVEL"));
        String usuario = (request.getParameter("usuario"));
        String chv_session = (request.getParameter("chv_session"));

        System.out.println("comentario " + comentario);
        System.out.println("ID_HST " + ID_HST);

        boolean rs;

        rs = confirmarComentario(comentario, chv_session, ID_HST);
        if (rs) {
        } else {
    %>
    <script>
        alert("Falha na execucao !");

    </script>

    <%}%>

    <script>
        $("#divEncheResponsavel").load("encheResponsavel.jsp", {});
        detalhaQuadro(1, '<%=CD_QUADRO%>', '<%=NM_QUADRO%>', '<%=NM_RESP%>', '<%=CHV_FUN_RESPONSAVEL%>');
    </script>
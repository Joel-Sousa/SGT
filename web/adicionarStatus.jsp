<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 
<html lang="pt-br">
    <%
        String SITUACAO_QUADRO = (request.getParameter("SITUACAO_QUADRO"));
        String NM_QUADRO = (request.getParameter("NM_QUADRO"));
        String CD_QUADRO = (request.getParameter("CD_QUADRO"));
        String CHV_FUN_RESPONSAVEL = request.getParameter("CHV_FUN_RESPONSAVEL");
        String CHV_FUN_GRAVACAO = request.getParameter("CHV_FUN_GRAVACAO");
        String controle = request.getParameter("controle");
        String NM_RESP = request.getParameter("NM_RESP");

        System.out.println("NM_QUADRO" + NM_QUADRO);
        System.out.println("CD_QUADRO" + CD_QUADRO);

        ResultSet rs;
        if (SITUACAO_QUADRO.equals("2")) {
            boolean adicionarStatus;
            adicionarStatus = adicionarStatus(SITUACAO_QUADRO, CD_QUADRO);
        } else {
            rs = verificaHistoria(CD_QUADRO);
            if (rs.next()) {%> 

    <script>
        alert("Falha ! Verifique se todos os quadros estao concluido.");
    </script>

    <%} else {
        boolean adicionarStatus;
        adicionarStatus = adicionarStatus(SITUACAO_QUADRO, CD_QUADRO);
        if (adicionarStatus) {%>

    <script>
        alert("Concluido com Sucesso !");
    </script>

    <%}
            }
        }%>

    <script>
        $("#main").load("encheResponsavel.jsp", {});
//      $('#divDlgDetalhaQuadroX').dialog("close");
        detalhaQuadro(1, '<%=CD_QUADRO%>');
    </script>

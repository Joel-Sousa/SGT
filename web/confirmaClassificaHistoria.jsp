<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp"%>

<%@page contentType="text/html; charset=utf8"%> 
<html lang="pt-br">
    <%        
        String situacao = (request.getParameter("situacao"));
        String dt_prevista = (request.getParameter("dt_prevista"));
        String dt_efetiva = (request.getParameter("dt_efetiva"));
        String CD_QUADRO = (request.getParameter("CD_QUADRO"));
        String NM_QUADRO = (request.getParameter("NM_QUADRO"));
        String NM_RESP = (request.getParameter("NM_RESP"));
        String CHV_FUN_RESPONSAVEL = (request.getParameter("CHV_FUN_RESPONSAVEL"));
        String ID_HST = (request.getParameter("ID_HST"));

        System.out.println("situacao" + situacao);
        System.out.println("dt_prevista" + dt_prevista);
        System.out.println("dt_efetiva" + dt_efetiva);
        System.out.println("ID_HST" + ID_HST);

        if (dt_efetiva.equals("--")) {

            boolean rs;
            rs = classificaHistoria1(dt_prevista, situacao, ID_HST);

        } else {

            boolean rs;
            rs = classificaHistoria(dt_efetiva, dt_prevista, situacao, ID_HST);

            if (rs) {
            } else { %>
    <script>
        alert("Falha na execucao !");

    </script>

    <%} }%>

    <script>

        detalhaQuadro(1, '<%=CD_QUADRO%>', '<%=NM_QUADRO%>', '<%=NM_RESP%>', '<%=CHV_FUN_RESPONSAVEL%>');
          //$("#divEncheResponsavel").load("encheResponsavel.jsp", {});
            $("#main").load("encheResponsavel.jsp", {});

    //  $('#divDlgAdcionarQuadro').dialog("close");
    </script>
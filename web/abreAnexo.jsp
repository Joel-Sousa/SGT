<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 



<table>

    <%     
        String novoNomeArquivo = request.getParameter("novoNomeArquivo");
        System.out.println("novoNomeArquivo:" + novoNomeArquivo);

            String upload = "upload/";
    %>

    <tr>
        <td style="color:#cccccc ; vertical-align:top ; font-size: 15;color: #000; border-color: #000000; border: 2%;">
            <iframe id='FrameArqX' style='overflow:none;  width: 100%; height: 681px; border: dotted 0px;' src="<%=upload+novoNomeArquivo%>"></iframe>
        </td>
    </tr>

</table>

<script>
    function alterarSugestaoLida(idSugestao, lida) {
        //console.log("idSugestao : "+idSugestao);
        //console.log("lida : "+lida);

    }
</script>
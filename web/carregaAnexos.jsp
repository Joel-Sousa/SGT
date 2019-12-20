<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 



<script>

    $(function () {

        $('#dlgVisualizarArquivo').dialog({
            autoOpen: false,
            width: 1000,
            modal: true,
            position: {
                my: "top",
                at: "top",
                of: window,
                collision: "none"
            },
            buttons: {
                "Fechar": function () {
                    $(this).dialog("close");
                }
            },
            hide: {effect: 'drop', direction: "down"}
        });

    });
</script>    


<style>
    .stAnexo{
        position: relative;
        padding-top: 2px; padding-right: 2px; padding-botton: 2px;
        width: 540px;
    }
    .stAnexo:hover{
        top: 1px;
        /*border: solid 2px silver;*/
        background-color: #ffffcc;
    }    
</style>

<%
    String CD_QUADRO = (request.getParameter("CD_QUADRO"));
    String CHV_FUN_RESPONSAVEL = request.getParameter("CHV_FUN_RESPONSAVEL");
    String ID_HST = request.getParameter("ID_HST");
    System.out.println("ID_HST anexos: " + ID_HST);
    String anexo = "Anexos";
    ResultSet rs;
    rs = encheArquivo(ID_HST);
    while (rs.next()) {
%>


<div>
    <table border="0" style="font-size: 14px; width: 800px; border: solid 1px #e3e3e3;">
        <tr>
            <td style="width: 20px; text-align: center;" title="Baixar Arquivo">
                <div class='fa-2x' style='cursor: pointer; color: #04bd20'>
                    <i  class="fas fa-arrow-circle-down" aria-hidden='true'  OnClick="AbrirAnexo('<%=rs.getString("novoNomeArquivo")%>')"></i>
                </div>
            </td>

            <td style="width: 480px; cursor: pointer;"><%=rs.getString("nomeArquivo")%></td>

            <td style="width: 20px; text-align: center;" title="Excluir Arquivo">
                <div class='fa-2x' style='cursor: pointer; color: tomato'>
                    <i class='fas fa-times-circle' aria-hidden='true'  OnClick="ExcluirAnexo(<%=rs.getString("idAnexo")%>, '<%=rs.getString("nomeArquivo")%>', '<%=CHV_FUN_RESPONSAVEL%>', '<%=CD_QUADRO%>')"></i>
                </div>
            </td>
        </tr>
    </table>
</div>

<%}%>





<div id="dlgVisualizarArquivo" title="Arquivo" style="display: none;"></div>    


<script>
    function ExcluirAnexo(idAnexo, nomeArquivo, CHV_FUN_RESPONSAVEL, CD_QUADRO) {
        console.log("idAnexo : " + idAnexo);
        console.log("nomeArquivo : " + nomeArquivo);
        console.log("CD_QUADRO : " + CD_QUADRO);
        console.log("CHV_FUN_RESPONSAVEL : " + CHV_FUN_RESPONSAVEL);

        var txt;
        var r = confirm("Deseja Excluir o Anexo: " + nomeArquivo + " ?");
        if (r == true) {
            txt = "You pressed OK!";
            $("#DIV_O").load("excluiAnexo.jsp", {idAnexo: idAnexo, CD_QUADRO: CD_QUADRO, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL});
        } else {
            txt = "You pressed Cancel!";
        }

        // setTimeout(encheAnexos, 2000);
    }

    function encheAnexos() {
        $("#dlgAnexo").dialog("close");

        ID_HST =<%=ID_HST%>;
        console.log("encheAnexos idProtocolo : " + ID_HST);
        $("#tdAnexos").load("carregaAnexos.jsp", {ID_HST: ID_HST});
    }

    function AbrirAnexo(novoNomeArquivo) {
        console.log("novoNomeArquivo: " + novoNomeArquivo);

        $("#DIV_O").load("abreAnexo.jsp", {novoNomeArquivo: novoNomeArquivo});
        $("#DIV_O").dialog("open");

        //$("#DIV_O").dialog("open");

        //  $('#tdAnexos<%=ID_HST%>').html("<iframe id='FrameArqX' style='width: 100%; height: 540px; border: dotted 1px;' src='upload/" + novoNomeArquivo + "'></iframe>");
    }

</script>


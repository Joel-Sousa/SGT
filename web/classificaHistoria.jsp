<%@include file="funcoes.jsp"%>
<%@include file="autentica.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 
<script>
    $(function () {
        $("#txtdataPrevistaEntrega  ").datepicker();
        $("#txtdataEfetivaEntrega").datepicker();
        $("#txtdataPrevistaEntrega").datepicker("option", "dateFormat", "dd/mm/yy");
        $("#txtdataEfetivaEntrega").datepicker("option", "dateFormat", "dd/mm/yy");

    });
</script>


<%       
    
    String CD_QUADRO = request.getParameter("CD_QUADRO");
    String NM_QUADRO = request.getParameter("NM_QUADRO");
    String NM_RESP = request.getParameter("NM_RESP");
    String CHV_FUN_RESPONSAVEL = request.getParameter("CHV_FUN_RESPONSAVEL");


%>


<div id="divCHV_FUN_RESPONSAVEL" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=CHV_FUN_RESPONSAVEL%></div>
<div id="divCD_QUADRO" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=CD_QUADRO%></div>
<div id="divNM_RESP" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=NM_RESP%></div>
<div id="divNM_QUADRO" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=NM_QUADRO%></div>

<div class="form-group col-md-4">

    <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px;">Situacao:</label>

    <select class="custom-select my-1 mr-sm-2" id="txtSituacao">
        <option selected>Escolher...</option>
        <option value="Nova">Nova</option>
        <option value="Andamento">Andamento</option>
    </select>
    
    <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px;">Data da prevista para entrega:</label>
    <input placeholder="Ex: 24/02/2018" type="date" class="form-control mb-2" id="txtdataPrevistaEntrega"  >

    <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px;">Data da prevista para entrega:</label>
    <input placeholder="Ex: 24/02/2018" type="date" class="form-control mb-2" id="txtdataEfetivaEntrega"  >
</div>


<%@include file="funcoes.jsp"%>
<%@include file="autentica.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 

<script>
    $(function () {
        $("#txtdataRequisicao").datepicker();
        $("#txtdataRequisicao").datepicker("option", "dateFormat", "dd/mm/yy");

    });
</script>

<%    
    String CD_QUADRO = (request.getParameter("CD_QUADRO"));
    String NM_RESP = (request.getParameter("NM_RESP"));
    String NM_QUADRO = (request.getParameter("NM_QUADRO"));

    System.out.println(" CD_QUADRO" + CD_QUADRO);
    System.out.println(" NM_RESP" + NM_RESP);
    System.out.println(" NM_QUADRO" + NM_QUADRO);
%>  

<div id="divCHV_FUN_REQUISICAO" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=chave_x%></div>
<div id="divCD_QUADRO" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=CD_QUADRO%></div>
<div id="divNM_RESP" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=NM_RESP%></div>
<div id="divNM_QUADRO" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=NM_QUADRO%></div>
   <div style="font-size:17px; ">
       
<div class="col">
    <label for="name"> Resumo:</label>
    <input placeholder=" Informe o resumo da história aqui !"  type="text" class="form-control"  id="txtResumo"  >
</div>

<!---->
<div class="form-group col-md-4">
    <!--
    <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px;">Situacao:</label>

    <select class="custom-select my-1 mr-sm-2" id="txtSituacao">
        <option selected>Escolher...</option>
        <option value="Nova">Nova</option>
        <option value="Andamento">Andamento</option>
    </select>

<label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px;">Data da Requisição:</label>
    <input placeholder="Digite a data de hoje :" class="form-control mb-2" id="txtdataRequisicao"  >
-->
    <label for="exampleFormControlTextarea1" style="font-size: 15px;">Descrição da Historia:</label>
 <textarea placeholder="Informe a descrição aqui:" class="form-control" id="txtDescricao" rows="3" style="height: 40%; width:350%;"></textarea>
</div>
   </div>
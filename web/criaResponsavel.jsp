<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 
<script>
    $(function () {
        $("#txtdataEntrega").datepicker();
        $("#txtdataEntrega").datepicker("option", "dateFormat", "dd/mm/yy");

    });
    var cores = document.querySelectorAll("label[for^='cor']");

    for (i = 0; i < cores.length; i++)
    {
        cores[i].addEventListener("click", function () {
            document.querySelector("input[name='seleciona-cor']").checked = false;
        });
    }
</script>

<div class="form-group col-md-4" style=" padding:20px; " >
    <!--<select id="Sel_SituacaoCores">
        <option style="background: #FAE5B0;" value="#FAE5B0;"><div style="background:#FAE5B0;">Amarelo</div></option>
        <option style="background: #f5c6cb;" value="#f5c6cb;" ><div style="background:#f5c6cb;">Rosa</div></option>
        <option style="background: #3FC3DB;" value="#3FC3DB;"><div style="background:#3FC3DB;">Azul</div></option>
    </select> --><br>
<input type="color" id="Sel_SituacaoCores" > 
    
    
    <span style="font-size: 15px;"> Chave Responsável: </span>
    <input   placeholder="Digite a chave.." class="form-control mb-2" id="CHV_FUN_RESP"  >

    <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px;">Nome Responsavel: </label>
    <input placeholder="Digite o nome do Responsavel" type="text" class="form-control"   style="width: 154.1%;" id="txtNomeResponsalvel"  >

    <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px;">Função:</label>
    <input placeholder="Digite o nome da função " type="text" class="form-control"   style="width: 154.1%;" id="txtFuncao"  >

</div>

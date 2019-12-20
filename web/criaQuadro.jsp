<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 
<script>
    $(function () {
        $("#txtdataEntrega").datepicker();
        $("#txtdataEntrega").datepicker("option", "dateFormat", "dd/mm/yy");

    });
</script>


    <%    
        String CHV_FUN_RESPONSAVEL=request.getParameter("CHV_FUN_RESPONSAVEL");
        String controle = request.getParameter("controle");
%>
<div id="divCHV_FUN_RESPONSAVEL" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=CHV_FUN_RESPONSAVEL%></div>
<div id="divControle" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=controle%></div>
<div class="form-group col-md-4" style=" padding: 20px;" >

   <%     
        if (controle.equals("1")) {
        } else {

    %>
    
        <span style="font-size: 15px;"> Responsável: </span>
        <select  class="form-control" id="sel_CHV_FUN_RESPONSAVEL"  style="width:150px; ">
            <option  value="">Selecionar...</option>
            <%     
                ResultSet rs;
                rs = encheQuadroFuncionario();
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("CHV_FUN_RESPONSAVEL")%>"> <%=rs.getString("NM_RESP")%></option>
            <%}%>
        </select>

    <%}%>

        <!--
        <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px;">Data da Requisição:</label>
        <input placeholder="Ex: 24/02/2018"  type="date" class="form-control mb-2" id="txtdataQuadro"  >
    
        -->

        <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px;">Nome Quadro: </label>

        <div style="width:  230%;">
            <input placeholder="Digite o nome do quadro" type="text" class="form-control"   style="width: 154.1%; " id="txtNomeQuadro"  >
        </div>
        
        <label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 15px; width: 130%;">Data da prevista para entrega:</label>
        <input placeholder="Ex: 24/02/2018" type="text" class="form-control mb-2" id="txtdataEntrega"  >
    </div>


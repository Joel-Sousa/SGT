<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 



<table  style="width:100%; "  >   
    <tr>
        <%        
            int controle = 1;
            ResultSet rs;
            rs = encheQuadroFuncionario();
            while (rs.next()) {

        %>  


        <td style=" vertical-align: top;  cellspacing:10; cellpadding:10    5;">
            <!--  <i class="fas fa-spinner"></i> &nbsp;
              <i class="fas fa-check"></i> &nbsp;
              <i class="fas fa-exclamation-triangle"></i>
            -->
            <table >

                <tr style='background:<%=rs.getString("COLOR")%>;' >
                    <td  style="border: solid 1px; border: solid 0px; padding:6 ;">
                        <span  style="font-size: 20;"><b style="cursor: pointer; color: #000;" ><%=rs.getString("NM_RESP")%></b> 
                            <i style="cursor:pointer; float:right" title=" Clique aqui para adicionar um novo quadro para <%=rs.getString("NM_RESP")%> " onClick="abreCampoQuadro('<%=rs.getString("CHV_FUN_RESPONSAVEL")%>')" class="fas fa-plus-circle"></i>
                            <i data-toggle="collapse" data-target="#Sel_SituacaoQuadro<%=rs.getString("CHV_FUN_RESPONSAVEL")%>" title="" style="position: relative; top:-7; left: 40; cursor: pointer; " class="fas fa-sort-down"></i>
                        </span> <br>

                        <div  id="Sel_SituacaoQuadro<%=rs.getString("CHV_FUN_RESPONSAVEL")%>"  class="collapse" style="background:<%=rs.getString("COLOR")%>; width:3%; cursor: pointer;position: absolute; border-color:#fff;  width: 147px; height: 30px"> 

                            <table style="width: 20%; margin-left:13 ;">
                                <tr style='margin-bottom: 7' onclick="filtrarQuadro('<%=rs.getString("CHV_FUN_RESPONSAVEL")%>', '<%=rs.getString("NM_RESP")%>', 1)">
                                    <td style='margin-left: 21'>
                                        <i class="fas fa-upload"></i>
                                    </td>
                                    <td style='margin-left: 21'>
                                        <b style='color: black'> [TODOS]</b>
                                    </td>
                                </tr> 

                                <tr onclick="filtrarQuadro('<%=rs.getString("CHV_FUN_RESPONSAVEL")%>', '<%=rs.getString("NM_RESP")%>', 0, 0)">
                                    <td > 
                                        <i title="Quadro pendente"    style='color:#999999;  float:right; margin-right:10; cursor:pointer; margin-bottom:7;' class="fas fa-bell" ></i>
                                    </td>
                                    <td>
                                        <b style='color: black'>Nova</b>
                                    </td>
                                </tr>

                                <tr onclick="filtrarQuadro('<%=rs.getString("CHV_FUN_RESPONSAVEL")%>', '<%=rs.getString("NM_RESP")%>', 0, 2)">
                                    <td>
                                        <i  title="Quadro em andamento..."  style='color:#ffa500; float:right; margin-right:10; cursor:pointer; margin-bottom:7;' class="fas fa-clock"></i>
                                    </td>
                                    <td>
                                        <b style='color: black'>Andamento</b>
                                    </td>
                                </tr>

                                <tr onclick="filtrarQuadro('<%=rs.getString("CHV_FUN_RESPONSAVEL")%>', '<%=rs.getString("NM_RESP")%>', 0, 3)">
                                    <td>
                                        <i title="Quadro concluido..."   style='color:#04BD20 ; float:right; margin-right:10; cursor:pointer; margin-bottom:7;' class="fas fa-check"></i>
                                    </td>
                                    <td>
                                        <b style='color: black'>Concluido</b>
                                    </td>
                                </tr>
                            </table>
                        </div>
                           
                    </td>
                </tr>

                <tr>
                    <td id="tdTarefa<%=rs.getString("CHV_FUN_RESPONSAVEL")%>" style="display:none; background-color:#F9F9F9; padding:10px;" >
                        <textarea placeholder="Informe o nome do quadro" class="form-control" id="txtDescricao<%=rs.getString("CHV_FUN_RESPONSAVEL")%>" rows="2" style="height: 3%; width:100%; margin-right:-78; margin-left:-0; margin-top:6"></textarea>
                        <button onclick="adicionarQuadroV2('<%=rs.getString("CHV_FUN_RESPONSAVEL")%>')" class="btn btn-info"  style="background: #6A7989; margin-top:5 ;">Salvar</button>
                    </td>
                </tr>

                <tr style="">
                    <td class="boxOver" style="background-color:#F9F9F9; padding:10px; " id="td_<%=rs.getString("CHV_FUN_RESPONSAVEL")%>" ></td>
                <script>
                    CHV_FUN_RESPONSAVEL = "<%=rs.getString("CHV_FUN_RESPONSAVEL")%>";
                    NM_RESP = "<%=rs.getString("NM_RESP")%>";
                    controle = "<%=controle%>";
                    $("#td_<%=rs.getString("CHV_FUN_RESPONSAVEL")%>").load("encheQuadro.jsp", {CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, NM_RESP: NM_RESP, controle: controle});
                </script>
    </tr> 

</table>

</td>
<td style="width: 6px;"></td>

<%}%>
</tr>

<tr>
    <td colspan="2" style="height: 20px;"></td>
</tr>    
</table>
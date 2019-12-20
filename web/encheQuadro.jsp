<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 



<table  style="">

    <%
        String CHV_FUN_RESPONSAVEL = request.getParameter("CHV_FUN_RESPONSAVEL");
        String NM_RESP = request.getParameter("NM_RESP");
        String SITUACAO_QUADRO = (request.getParameter("SITUACAO_QUADRO"));
        int controle = Integer.parseInt(request.getParameter("controle"));

        // System.out.println("controle " + controle);
        //System.out.println("SITUACAO_QUADRO " + SITUACAO_QUADRO);
        //System.out.println("CHV_FUN_RESPONSAVEL " + CHV_FUN_RESPONSAVEL);
        ResultSet rs;

        if (controle == 0) {
            rs = filtrarQuadro(CHV_FUN_RESPONSAVEL, SITUACAO_QUADRO);
        } else {
            rs = encheQuadro(CHV_FUN_RESPONSAVEL);
        }

        while (rs.next()) {

    %>   
    <script>
        $(function () {
            $("#sortable<%=rs.getString("CD_QUADRO")%>").sortable();
            $("#sortable<%=rs.getString("CD_QUADRO")%>").disableSelection();
        });
    </script>

    <tr style="">
        <td  style=" padding:10px; background: " >
            <!--<div class="ui-state-default"  >-->
            <div  >
                            <!--<ul id="sortable<%=rs.getString("CD_QUADRO")%>">-->
                <!--<li >-->
                <span title="Clique aqui para detalhar o quadro !"  style=" font-size: 17;cursor:pointer; " onclick="detalhaQuadro(1, '<%=rs.getString("CD_QUADRO")%>', '<%=CHV_FUN_RESPONSAVEL%>', '<%=NM_RESP%>')">
                    <b style="color: #4c0b5f;">
                        <%if (rs.getString("SITUACAO_QUADRO").equals("0")) {%>   
                        <i style=" color:#cccccc;;" title="Esse quadro está pendente !" class="fas fa-bell"></i>
                        <%} else if (rs.getString("SITUACAO_QUADRO").equals("2")) { %>
                        <i style="color:#ffa500 ;" title="Esse quadro está em andamento!" class="fas fa-clock"></i>
                        <%} else {%>
                        <i  style=" color:#04BD20 ;" title="Esse quadro ja foi concluído !" class="fas fa-check"></i>
                        <%}%>

                        <% out.println(rs.getString("CD_QUADRO"));%>-<%=rs.getString("NM_QUADRO")%>
                    </b>
                </span><br>

                <%if (rs.getString("QTD_HST").equals("")) {%>
                <i >Esse quadro não possui <b>tarefas</b></i>
                <%} else {%>  
                <i style="color:#666666;">tarefas (<%=rs.getString("QTD_HST")%>)</i>
                <%}%>

                <div style='float: right;'>
                    <i style="width:150%;cursor:pointer; " title=" Clique aqui para adicionar uma nova Historia ao quadro " onclick="detalhaQuadro(0, '<%=rs.getString("CD_QUADRO")%>', '<%=CHV_FUN_RESPONSAVEL%>', '<%=NM_RESP%>')" class="fas fa-plus-circle"></i>
                </div>
                <!--</li>-->

                <!--</ul>-->

            </div> 
        </td>
    </tr>

    <%}%>
</table>

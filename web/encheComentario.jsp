<%@include file="funcoes.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 
    

<label style="font-size: initial;">Comentario:</label>
<table  style=" position: relative; width: 100%;">
    <%
        String CHV_FUN_RESPONSAVEL = request.getParameter("CHV_FUN_RESPONSAVEL");
        String NM_RESP = request.getParameter("NM_RESP");
        String ID_HST = request.getParameter("ID_HST");
        String NM_QUADRO = request.getParameter("NM_QUADRO");
        String CD_QUADRO = request.getParameter("CD_QUADRO");
        ResultSet rs;
        rs = encheComentario(ID_HST);
        while (rs.next()) {

    %>   
      
    <tr style="">
        <td  style=" padding:10px; border: solid 2.5px;" >
            <div  style="">
                <span style=" font-size:15px; font-style:italic; width: 20%;"> <b><%=rs.getString("nome")%></b></span><br>
                
                <div>
                    <p><%=rs.getString("CMTR")%> </p>
                </div>
            </div> 
        </td>
    </tr>

    <%}%>
</table>

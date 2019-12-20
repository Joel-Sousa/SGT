<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp" %>
<%@page contentType="text/html; charset=utf8"%> 



<table style=" width: 80%; ">

    <%        
        String ID_HST = request.getParameter("ID_HST");
        System.out.println("ID_HST : " + ID_HST);

        ResultSet rs;
        rs = carregaRespostas(ID_HST);
        //System.out.println("carregaRespostas : "+chave_x);
        while (rs.next()) {
    %>

    <tr>
        <td style='vertical-align:top;'>
            <img src="https://www.google.com/search?client=firefox-b-d&biw=1366&bih=654&tbm=isch&sa=1&ei=Wu0AXdj8BOjZ5OUPrcOA6Ao&q=sol&oq=sol&gs_l=img.3..0i67l5j0j0i67j0l2j0i67.92725.92930..93084...0.0..0.130.353.0j3......0....1..gws-wiz-img.RhzHqDoU8Kk#imgrc=1H0w5x-brYJXgM:" style="border-radius: 50%; width: 40px; margin-left: 10; vertical-align: top; margin-top: -5; " title="<%=rs.getString("CHV_FUN_CMTR")%>, prefixo: ">
        </td>
        <!--<div style="width: 20%;"></div>-->
        <td style="color:#FFFF ; vertical-align:top">
            <table style="position: relative; top: -9; margin-right:40%">
                <tr>
                    <td>
                        <b style="color:#767986; font-size:12px; vertical-align: top;">
                            <%=rs.getString("usuario")%>
                        </b>
                    </td>
                    <td style="font-size:12px;color:#767986;"><%=rs.getString("DT_CMTR")%></td>
                </tr>

                <tr>
                    <td colspan="2" style="margin-bottom: 20; padding-top:7; ">
                        <%=rs.getString("CMTR")%>  
                    </td>
                </tr>
            </table>
            <div style="padding:15;"></div>

        </td>
    </tr>

    <%}%>

</table>

<script>
    function alterarSugestaoLida(idSugestao, lida) {
        //console.log("idSugestao : "+idSugestao);
        //console.log("lida : "+lida);

    }
</script>
<%@include file="funcoes.jsp"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <script type="text/javascript" src="action/action.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>   


        <br><br><br>
    
          <div class="table-responsive">      
    <table  class="table table-hover" class="table table-striped" border="4" >   
    <tr   class="text-uppercase"  align="center">

      <th scope="col" class="bg-primary" >Segunda</th>   
        <th scope="col" class="bg-primary" >Terca</th>  
        <th scope="col" class="bg-primary" >Quarta</th>     
        <th scope="col" class="bg-primary" >Quinta</th> 
        <th scope="col" class="bg-primary" >Sexta</th> 
        </tr>
        <div>
<%
   ResultSet rs;   
   rs=encheAgenda ();
   while(rs.next()){	
%>


    <tr  border="" id="botao"> 
    <td class="" bcolor="" width=250 height=50 >
        <div class="tdComp">
            <%if (rs.getString("DSEGUNDA") == null) {
                } else {%>
            <%if (rs.getInt("DSEGUNDA") > 0) {%>
            <div  style="width: 100px; height:40px; width:0px;"><img  src="images/proximo.png"  title=" Esse evento ainda irá acontecer!" style="width: 37px;" height="40" width="300" ></div>
                <%}%>  
                <%if (rs.getInt("DSEGUNDA") < 0) {%>
            <div  style="width: 100px; height:40px; width:0px;"><img  src="images/anterior.png"  title=" Esse evento ja foi executado!" style="width: 37px;" height="40" width="300" ></div>
                <%}%>  
                <%if (rs.getInt("DSEGUNDA") == 0) {%>
            <div  style="width: 100px; height:40px; width:0px;"><img  src="images/hoje.png" title=" Esse evento está Agendado para hoje !" style="width: 37px;" height="40" width="300" ></div>
                <%}%>  
            <center><h3 OncliCk="abreAgenda(<%=rs.getString("cod_agenda")%>)"> <%=rs.getString("COD_SEGUNDA")%></h3><br></center> 
            <%=rs.getString("SEGUNDA")%> <br>
            <%=rs.getString("FIM_SEGUNDA")%> 
            <%}%>  
        </div>
    </td> 

        
    <td class="" bcolor="" width=250 height=50 >
        <div class="tdComp">
            <%if (rs.getString("DTERCA") == null) {
                } else {%>
            <%if (rs.getInt("DTERCA") > 0) {%>
            <div  style="width: 100px; height:40px; width:0px;"><img  src="images/proximo.png"  title=" Esse evento ainda irá acontecer!" style="width: 37px;" height="40" width="300" ></div>
                <%}%>  
                <%if (rs.getInt("DTERCA") < 0) {%>
            <div  style="width: 100px; height:40px; width:0px;"><img  src="images/anterior.png"  title=" Esse evento ja foi executado!" style="width: 37px;" height="40" width="300" ></div>
                <%}%>  
                <%if (rs.getInt("DTERCA") == 0) {%>
            <div  style="width: 100px; height:40px; width:0px;"><img  src="images/hoje.png" title=" Esse evento está Agendado para hoje !" style="width: 37px;" height="40" width="300" ></div>
                <%}%>  
            <center><h3 OncliCk="abreAgenda(<%=rs.getString("cod_agenda")%>)"> <%=rs.getString("COD_TERCA")%></h3><br></center> 
            <%=rs.getString("TERCA")%> <br>
            <%=rs.getString("FIM_TERCA")%> 
            <%}%>  
        </div>
    </td> 

<td  class="" bcolor="" width=250 height=50 > 
    <div class="tdComp"> 
        <%if (rs.getString("DQUARTA") == null) {
            } else {%>
        <%if (rs.getInt("DQUARTA") > 0) {%>
        <div  class="DivAtual"  style="width: 100px;" height="40" width="300" class="" ><img  src="images/proximo.png" title="Esse evento esta agendado" style="width: 37px;" height="40" width="300" ></div>
            <%}%>  
            <%if (rs.getInt("DQUARTA") < 0) {%>
        <div   class="DivAntes"  style="width: 100px;" height="40" width="300" class="" ><img  src="images/anterior.png"   title=" Esse evento  ja foi executado!" style="width: 37px;" height="40" width="300" ></div>
            <%}%>  
            <%if (rs.getInt("DQUARTA") == 0) {%>
        <div  class="DivHOJE" ><img  src="images/hoje.png"  title=" Esse evento está Agendado para hoje !" style="width: 37px;" height="40" width="300" > </div>
            <%}%>  
        <center><h3 OncliCk="abreAgenda(<%=rs.getString("cod_agenda")%>)"> <%=rs.getString("COD_QUARTA")%></h3><br></center> 
        <%=rs.getString("QUARTA")%> <br>
        <%=rs.getString("FIM_QUARTA")%> 
        <%}%>  
    </div>
</td> 


<td class="" bcolor="" width=250 height=50 >
        <div class="tdComp">
            <%if (rs.getString("DQUINTA") == null) {
                } else {%>
            <%if (rs.getInt("DQUINTA") > 0) {%>
            <div  style="width: 100px; height:40px; width:0px;"><img  src="images/proximo.png"  title=" Esse evento ainda irá acontecer!" style="width: 37px;" height="40" width="300" ></div>
                <%}%>  
                <%if (rs.getInt("DQUINTA") < 0) {%>
            <div  style="width: 100px; height:40px; width:0px;"><img  src="images/anterior.png"  title=" Esse evento ja foi executado!" style="width: 37px;" height="40" width="300" ></div>
                <%}%>  
                <%if (rs.getInt("DQUINTA") == 0) {%>
            <div  style="width: 100px; height:40px; width:0px;"><img  src="images/hoje.png" title=" Esse evento está Agendado para hoje !" style="width: 37px;" height="40" width="300" ></div>
                <%}%>  
            <center><h3 OncliCk="abreAgenda(<%=rs.getString("cod_agenda")%>)"> <%=rs.getString("COD_QUINTA")%></h3><br></center> 
            <%=rs.getString("QUINTA")%> <br>
            <%=rs.getString("FIM_QUINTA")%> 
            <%}%>  
        </div>
    </td> 

<td  class="" bcolor="" width=250 height=50 > 
    <div class="tdComp"> 
        <%if (rs.getString("DSEXTA") == null) {
            } else {%>
        <%if (rs.getInt("DSEXTA") > 0) {%>
        <div  class="DivAtual"  style="width: 100px;" height="40" width="300" class="" ><img  src="images/proximo.png" title="Esse evento esta agendado" style="width: 37px;" height="40" width="300" ></div>
            <%}%>  
            <%if (rs.getInt("DSEXTA") < 0) {%>
        <div   class="DivAntes"  style="width: 100px;" height="40" width="300" class="" ><img  src="images/anterior.png"   title=" Esse evento  ja foi executado!" style="width: 37px;" height="40" width="300" ></div>
            <%}%>  
            <%if (rs.getInt("DSEXTA") == 0) {%>
        <div  class="DivHOJE" ><img  src="images/hoje.png"  title=" Esse evento está Agendado para hoje !" style="width: 37px;" height="40" width="300" > </div>
            <%}%>  
        <center><h3 OncliCk="abreAgenda(<%=rs.getString("cod_agenda")%>)"> <%=rs.getString("COD_SEXTA")%></h3><br></center> 
        <%=rs.getString("SEXTA")%> <br>
        <%=rs.getString("FIM_SEXTA")%> 
        <%}%>  
    </div>
</td> 

</tr>

<% }%>

    </table>  </div>
    </body>
    </html>

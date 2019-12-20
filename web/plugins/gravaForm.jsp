<%@include file="funcoes.jsp"%>

<%@page contentType="text/html; charset=utf8"%> 


<center>

    
<%  
   int cod_pergunta = Integer.parseInt(request.getParameter("cod_pergunta"));
   int vresp = Integer.parseInt(request.getParameter("vresp"));
   int cod_dificuldade = Integer.parseInt(request.getParameter("cont"));
   
   ResultSet rs; 
   
 %>    
 
    
 <script>
              // cont++ ;
                if (cont>=5) {

                alert("acaboooou !"); 
                alert ("voce acertou: " +cont+ " Questoes");
                alert ("PARABEEEEEEEENS !  Seu premio e O MAXIMO  " +(cont*1000)+ " reais"); 
                if (cont===0) {alert ("VOCE MARCOU 0 PONTOS E SEU PREMIO E 0 REAIS");}
                if (cont===1) {alert ("VOCE MARCOU 10 PONTOS E SEU PREMIO E 500 REAIS");}
                if (cont===2) {alert ("VOCE MARCOU 20 PONTOS E SEU PREMIO E 1000 REAIS");}
                if (cont===3) {alert ("VOCE MARCOU 30 PONTOS E SEU PREMIO E 1500 REAIS");}
                if (cont===4) {alert ("VOCE MARCOU 40 PONTOS E SEU PREMIO E 2000 REAIS");}
        
                }
                else {
                     abrePerg();
                 }
  
 </script>

 <%}
 else{
 %>
 <script>
                alert("Errrooooou !");
               if (cont===0) {alert ("VOCE MARCOU 0 PONTOS E SEU PREMIO E 0 REAIS");}
               if (cont===1) {alert ("VOCE MARCOU 10 PONTOS E SEU PREMIO E 500 REAIS");}
               if (cont===2) {alert ("VOCE MARCOU 20 PONTOS E SEU PREMIO E 1000 REAIS");}
               if (cont===3) {alert ("VOCE MARCOU 30 PONTOS E SEU PREMIO E 1500 REAIS");}
               if (cont===4) {alert ("VOCE MARCOU 40 PONTOS E SEU PREMIO E 2000 REAIS");}
        
 </script>
 
<%} %>
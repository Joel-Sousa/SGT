<%@include file="autenticaFake.jsp"%>
<%@include file="funcoes.jsp"%>
<%@page language="java" contentType="text/html; charset=utf8"%> 

<html xmlns="http://www.w3.org/1999/xhtml">

    <%    //ResultSet rs;    
%>
<head>
    <%
        
       String usuario = (String) session.getAttribute("usuario");
       System.out.println("usuario "+usuario);
       String perfil = (String) session.getAttribute("perfil");
       String id = (String) session.getAttribute("id");
       System.out.println("id "+id);
       
       if(usuario == null){
           request.getRequestDispatcher("login.jsp").forward(request, response);
       }
     %>
    <script language="Javascript">
            function confirmacao() {
                var resposta = confirm("Deseja Sair?");
                if (resposta == true) {
                    window.location.href = "sair.jsp";
                 }
            }
            
        </script>
        <title>SGT</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

            <!-----bootstrap------------inicio------->
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
                <!----bootstrap----'--------finali--------->

                <!--jqueryui---------------------início-->
                <link type="text/css" href="plugins/jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" />
                <script src="plugins/jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
                <!--<script type="text/javascript" src="plugins/js/jquery-3.2.1.js"></script>-->
                <script src="plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
                <!--jqueryui---------------------finali-->
                <link href='plugins/css/painel.css' rel='stylesheet'  type='text/css'/> 
                <script src="plugins/fontawesome-free-5.0.9/svg-with-js/js/fontawesome-all.js"></script>       
                <script type="text/javascript" src="action/action.js"></script>
                <link href='action/style.css' rel='stylesheet'  type='text/css'/>  
<script>
var diretoriaUser=0;
var prefixoUser=0; 
var UserChv="";
var usuario="";

$(document).ready(function() { 
diretoriaUser="<%=diretoria_x%>";
prefixoUser="<%=dependencia_x%>";
UserChv="<%=chave_x%>";
usuario="<%=usuario%>";
chv_session="<%=id%>";

$("#divLoad").hide();
$(document).ajaxStart(function(){
$("#divLoad").show();
});
$(document).ajaxStop(function(){
$("#divLoad").hide(); 
});	
$(document).ajaxError(function(){
alert("Desculpe o transtorno, o Sistema Encontrou um Erro !");
});	

//menu(1);
}); 
</script>
</head>

<body style="position: relative;">
    
                    <div id="divLoad" 
                         style="
                         display: block; 

                         position: absolute;
                         top: 0px;
                         left: 0px;

                         background-color: rgba(255,255,255,0.7); 
                         height: 100%; 
                         min-height: 100px; 

                         width: 100%; 
                         min-width: 100px; 
                         color: #2b587a; 
                         text-align: center;
                         z-index:99;

                         text-align: center;
                         vertical-align: middle;
                         ">

                        <div style="position: relative; top: 250px; display: inline-block; border: solid 0px #e3e3e3; background-color: rgba(255,255,255,1); padding: 15px; border-radius: 5px;">
                            <table style="width: 200px; display: inline-block">
                                <tr>
                                    <td>
                                        <i class="fa-2x fas fa-cog fa-spin"></i>
                                    </td>
                                    <td>
                                        <span style="font-size:14px;"> Aguarde...</span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <div id="divTesteira" >
                        <div id="divTitulo" >
                            <nav class="navbar navbar-light" style="background-color: #1976d2;">
                                <table style="width: 150px; border-collapse: collapse; margin-right:19%;" border="0" cellspaccing="0" cellspadding="0">
                                    <tr>
                                        <td style="min-width: 40px; max-width: 40px; width: 40px; border: solid 0px tomato; "><img src="images/logo_tarefa.jpg" style="width: 37px;"></td>

                                        <td style="border: solid 0px tomato; min-width: 600px; max-width: 800px; width: 800px; font-family: sans-serif; vertical-align:bottom; color: inherit; vertical-align: middle; font-size: 40px; color: #ffffff; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);">
                                            SGT
                                        </td>
                                       
                                        <td style="border: solid 0px tomato; min-width: 630px; max-width: 900px; width: 800px; font-family: sans-serif; vertical-align:bottom; color: inherit; vertical-align: middle; font-size: 40px; color: #ffffff; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);" >
                                            <a style="text-transform: capitalize; ">Bem Vindo: <%=usuario%></a>
                                        </td>
                                            
                                        
                                        <td style="border: solid 0px tomato; min-width: 100px; max-width: 900px; width: 800px; font-family: sans-serif; vertical-align:bottom; color: inherit; vertical-align: middle; font-size: 20px; color: #ffffff; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);">
                                            <% if(perfil.equals("Gestor")){ %>
                                            <a href="listaResponsaveis.jsp"><input class="btn btn-info" type="button" value="Responsaveis"></a>
                                                <%}%>
                                        </td>
                                        
                                        <td align="center" style="border: solid 0px tomato; min-width: 50px; max-width: 900px; width: 800px; font-family: sans-serif; vertical-align:bottom; color: inherit; vertical-align: middle; font-size: 20px; color: #ffffff; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.3);">
                                            <a href='javascript:func()'onclick='confirmacao()'><input  class="btn btn-info"class="btn btn-danger"type="button" value="Sair"></a>
                                        </td>

                                    </tr>
                                </table>
                            </nav>
                        </div>

                    </div>

                    <table>
                        <tr>
                            <td>
                                                                
                                <% if(perfil.equals("Gestor")){ %>
                                <a class="navbar-brand" ><button  title=" Clique aqui para adicionar um novo Responsavel" class="btn btn-info" style="background: #6A7989;margin-right:100%" onClick="abreDlgadicionarResponsavel(0, 0)" >Adicionar Responsavel<i style="height:40px;"> </i></button></a>
                                <%}%>
                            </td>
                        </tr>
                    </table>
    
<div id="main" style="border: solid 0px tomato; "></div>
<div id="divDetalhaHistoria"></div>
<div id="divDlgAClassificaHistoria"></div>
<div id="divDlgAdcionarHistoria"></div>
<div id="divDlgAdcionarResponsavel" ></div>
<div id="divDlgAdicionarRotina" ></div>
<div id="divDlgDetalhaQuadroX" style='padding: 35px; padding-top:10px; padding-bottom: 10px; padding-left: 3%; padding-left:4%; height: 100%;'></div>
<div id="DIV_O" style="display: none; border: solid 1px ; background-color: #ffcc00; width: 330px; height:550px;"></div>

<div id="navy_footer_box">
<div id="navy_footer" style=" position: relative; left: 0; bottom: 0; text-align: center; display: inline-block; width: 100%;">
<h2>PROJEÇÃO - Estagiários de de Tecnologia da Informacão</h2>

<div style="color: #fff; font-size:11px; text-align: center;">

<i>Desenvolvido por&nbsp;</i> <i class="fas fa-copyright"></i> Estudantes de Tecnologia da Informação

</div> 

</div> 
</div> 

<script>
  $(document).ready(function () {
  $("#main").load("encheResponsavel.jsp", {});
 });
$(function () {

$(document).tooltip();

/*---------------JqueryUI-------------------InÃ­cio------------*/
$('#dataAgenda').change(function () {
$('#dataAgendaZ').datepicker('setDate', $(this).val());
});
$("#tabs").tabs({
event: "mouseover"
});
$('#divDetalhaHistoria').dialog({
autoOpen: false,
width: 1400,
height: 900,
modal: true,
title: ' Historias',
/*position: ["bottom",20],*/
position: {
my: "center top",
at: "center top",
of: window,
collision: "none"
},
buttons: {
"Fechar": function () {
$(this).dialog("close");
}
},
hide: {effect: 'drop', direction: "down"}
});


$('#divDlgAdcionarHistoria').dialog({
autoOpen: false,
width: 800,
height: 540,
modal: true,
title: 'Adicionar Historia',
/*position: ["bottom",20],*/
position: {
my: "center top",
at: "center top",
of: window,
collision: "none"
},
buttons: {
"gravar": function () {
gravaHistoria();
},
"Cancelar": function () {
$(this).dialog("close");
}
},
close: function () {
$("#txtDATA_AGENDAMENTO").remove();
},
hide: {effect: 'drop', direction: "down"}
});

$('#divDlgDetalhaQuadro').dialog({
autoOpen: false,
width: 1000,
height: 950,
modal: true,
title: 'Detalhe do Quadro ',
/*position: ["bottom",20],*/
position: {
my: "center top",
at: "center top",
of: window,
collision: "none"
},
buttons: {
"Cancelar": function () {
$(this).dialog("close");
}
},
close: function () {
$("#accordionInside").remove();
},
hide: {effect: 'drop', direction: "down"}
});



$('#divDlgAdcionarQuadro').dialog({
autoOpen: false,
width: 600,
height: 390,
modal: false,
title: 'Adicionar Quadro ',
/*position: ["bottom",20],*/
position: {
my: "center top",
at: "center top",
of: window,
collision: "none"
},
buttons: {
"Adcionar": function () {
adicionarQuadro();
}
},
close: function () {
$("#accordionInside").remove();
},
hide: {effect: 'drop', direction: "down"}
});


$('#divDlgAdcionarResponsavel').dialog({
autoOpen: false,
width: 600,
height: 390,
modal: false,
title: 'Adicionar Responsavel ',
/*position: ["bottom",20],*/
position: {
my: "center top",
at: "center top",
of: window,
collision: "none"
},
buttons: {
"Adcionar": function () {
gravaResponsavel();
}
},
close: function () {
$("#accordionInside").remove();
},
hide: {effect: 'drop', direction: "down"}
});



$('#divDlgDetalhaQuadroX').dialog({
autoOpen: false,
width: 1000,
height: 890,
modal: false,
title: 'Detalhe do Quadro ',
/*position: ["bottom",20],*/
position: {
my: "center top",
at: "center top",
of: window,
collision: "none"
},
buttons: {
"Cancelar": function () {
$(this).dialog("close");
}
},
close: function () {
$("#accordionInside").remove();
},
hide: {effect: 'drop', direction: "down"}
});




$('#divDlgAClassificaHistoria').dialog({
autoOpen: false,
width: 500,
height: 380,
modal: false,
title: 'Classifica Historia',
/*position: ["bottom",20],*/
position: {
my: "center top",
at: "center top",
of: window,
collision: "none"
},
buttons: {

"Cancelar": function () {
$(this).dialog("close");
}
},
close: function () {
$("#").remove();
},
hide: {effect: 'drop', direction: "down"}
});

$('#DIV_O').dialog({
autoOpen: false,
width: 800,
height: 780,
modal: false,
title: 'Arquivos',
/*position: ["bottom",20],*/
position: {
my: "center top",
at: "center top",
of: window,
collision: "none"
},
buttons: {
"Fechar": function () {
$(this).dialog("close");
}
}
});

$('#divDlgAdicionarRotina').dialog({
autoOpen: false,
width: 600,
height: 390,
modal: false,
title: 'Adicionar Rotinas ',
/*position: ["bottom",20],*/
position: {
my: "center top",
at: "center top",
of: window,
collision: "none"
},
buttons: {
"Adcionar": function () {
gravaResponsavel();
}
},
close: function () {
$("#accordionInside").remove();
},
hide: {effect: 'drop', direction: "down"}
});



});

</script>

</center> 
</body>
</html>
                                        
<%@include file="funcoes.jsp"%>
<%@include file="autenticaFake.jsp"%>
<%@page contentType="text/html; charset=utf8"%> 

<script>

    $(function () {

        $("#txtDataPrevista").datepicker();
        $("#txtDataEfetiva").datepicker();

        $("#txtDataPrevista").datepicker("option", "dateFormat", "dd/mm/yy");
        $("#txtDataEfetiva").datepicker("option", "dateFormat", "dd/mm/yy");

    });

    $("#accordionInside").accordion({
        collapsible: true
    });

</script>


<%   
    ResultSet rs;
    String CHV_FUN_RESPONSAVEL = request.getParameter("CHV_FUN_RESPONSAVEL");
    String CHV_FUN_GRAVACAO = request.getParameter("CHV_FUN_GRAVACAO");
    String CD_QUADRO = request.getParameter("CD_QUADRO");
    String controle = request.getParameter("controle");
    String NM_QUADRO = request.getParameter("NM_QUADRO");
    String NM_RESP = request.getParameter("NM_RESP");
    String SITUACAO_QUADRO = request.getParameter("SITUACAO_QUADRO");
    String teste = request.getParameter("SITUACAO_QUADRO");
    String usuario = request.getParameter("usuario");

    System.out.println("CD_QUADRO " + CD_QUADRO  );
    //System.out.println("SITUACAO_QUADRO " + SITUACAO_QUADRO  );
    rs = detalhaQuadroN(CD_QUADRO);
    if (rs.next()) {%>

<table   id="tb_nome_quadro" style="width: 103.1%; margin-left: -2%; ">

    <tr  style="background:#1976d2; color:#fff;  " >
        <td    style="padding-left:10%; padding: 20px; ">
            <h3   id="txtNomeQuadro"  style="cursor:pointer;"> 
                <%if (rs.getString("SITUACAO_QUADRO").equals("0")) {%>   
                <i  title="Esse quadro está pendente !" class="fas fa-bell" ></i>
                <%} else if (rs.getString("SITUACAO_QUADRO").equals("2")) { %>
                <i title="Esse quadro está em andamento!" class="fas fa-clock"></i>
                <%} else {%>
                <i   title="Esse quadro ja foi concluído !" class="fas fa-check"></i>
                <%}%>

                <nome> 
                    <h3 style="cursor:pointer;" class="ui-icon ui-icon-triangle-1-s"  data-toggle="collapse" data-target="#demo" title="Clique aqui para adicionar status ao quadro"></h3>
                    <b onclick="alterarNomeQuadro()"><%=rs.getString("CD_QUADRO")%>-<%=rs.getString("NM_QUADRO")%></b>
                </nome>
                    <!--<i onClick="cancelaQuadro(<%=CD_QUADRO%>)" title="Deletar Quadro" style='float:right; margin-right:10; cursor:pointer; height:21;' class="fas fa-trash-alt"></i> -->
            </h3>

            <div id="divNmQuadro" style="display: none;">
                <input  value="<%=rs.getString("NM_QUADRO")%>" id="txtNmQuadro" style=" width:50%"  placeholder="<%=rs.getString("NM_QUADRO")%> type="text">
                        <button class="btn " style="background: #6A7989;" title="Clique aqui para alterar o nome do quadro! " onClick="alteraQuadro(<%=rs.getString("CD_QUADRO")%>, '<%=rs.getString("NM_QUADRO")%>', '<%=rs.getString("NM_RESP")%>', '<%=rs.getString("CHV_FUN_RESPONSAVEL")%>', '<%=rs.getString("CHV_FUN_GRAVACAO")%>')" >alterar</button>
            </div>

            <div   id="demo" class="collapse" style="cursor: pointer;position: absolute; border-color:#fff; background:#1976d2; width: 147px; height: 30px"> 
                <% if (chave_x.equals("T1078434") || chave_x.equals("t1078434") || chave_x.equals(CHV_FUN_GRAVACAO) || chave_x.equals("F7034899") || chave_x.equals("f7034899")) {%>                     
                <table>
                    <tr onClick="adicionarStatus(<%=CD_QUADRO%>, 3)">
                        <td>
                            <i title="Concluir Quadro..."   onClick="adicionarStatus(<%=CD_QUADRO%>, 3)" style='color:#04BD20 ; float:right; margin-right:10; cursor:pointer; margin-bottom:7;' class="fas fa-check"></i>
                        </td>

                        <td>
                            <b style='color: #ffffff'>Concluir</b>
                        </td>
                    </tr>

                    <tr onClick="adicionarStatus(<%=CD_QUADRO%>, 2)">
                        <td>
                            <i  title="Quadro em andamento..."   onClick="adicionarStatus(<%=CD_QUADRO%>, 2)" style='color:#ffa500; float:right; margin-right:10; cursor:pointer; margin-bottom:7;' class="fas fa-clock"></i>
                        </td>
                        <td>
                            <b style='color: #ffffff'>Andamento</b>
                        </td>
                    </tr>

                    <tr onClick="cancelaQuadro(<%=CD_QUADRO%>)">
                        <td>
                            <i onClick="cancelaQuadro(<%=CD_QUADRO%>)" title="Deletar Quadro" style=' color:#fff; float:right; margin-right:10; cursor:pointer; height:21; margin-bottom:7;' class="fas fa-trash-alt"></i>
                        </td>
                        <td>
                            <b style='color: #ffffff'>Cancelar </b>
                        </td>
                    </tr>

                    <% }%>
                </table>
            </div> 
            <br>

            <i style='float: right; ' class="btn" >
                <button style="height: 200%; font-size:160%" title="Clique aqui para adicionar uma nova tarefa ao quadro! " class="fas fa-plus-circle"   onClick="myFunction()" ></button>
            </i>
            <h6  onclick="displayNome()" style="margin-left: 40; padding-top:13;"> 
                Responsável: &nbsp;<%=rs.getString("NM_RESP")%> <br>
                <%/*=CD_QUADRO*/%>
            </h6>
        </td>

    </tr>

</table>

<div id="divCHV_FUN_REQUISICAO" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=chave_x%></div>
<div id="divCD_QUADRO" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=rs.getString("CD_QUADRO")%></div>
<div id="divNM_RESP" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=rs.getString("NM_RESP")%></div>
<div id="divNM_QUADRO" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=rs.getString("NM_QUADRO")%></div> <br>
<div id="divSITUACAO_QUADRO" style=" display:none ; border: solid 1px tomato; width: 100px; height: 30px"><%=rs.getString("SITUACAO_QUADRO")%></div> <br>


<%if (controle.equals("1")) {%>
<div id="divAdcHistoria" style="font-size:17px; margin-left: -1%; display: none; ">
    <%} else {%>
    <div id="divAdcHistoria" style="font-size:17px; margin-left: -1%;display: block; ">

        <%}%>        
        <!-- 
           <div class="form-group col-md-4"  style="margin-left: -1%;">
          <label for="name" style="font-size: 15px;">  Resumo:</label>
               <input style=" width:334.31%; margin-left:-6 " placeholder="Informe o resumo da história "  type="text" class="form-control"  id="txtResumo"  >
           </div>
        -->
        <div class="form-group col-md-4" style="margin-left: -1%;">
            <!--  <label for="exampleFormControlTextarea1" style="font-size: 15px;">Descrição da Historia:</label> -->
            <textarea placeholder="Informe a descrição da tarefa  " class="form-control" id="txtDescricao" rows="3" style="height: 12%; width:334.31%;margin-left:-6"></textarea><br>
            <button class="btn btn-info" onclick="gravaHistoria('<%=rs.getString("CHV_FUN_RESPONSAVEL")%>', '<%=rs.getString("SITUACAO_QUADRO")%>')" style="background: #6A7989;">Salvar</button>
        </div>

    </div>

    <%if (controle.equals("1")) { %>

    <div style="margin-left: -12; position: relative;"  class=""> 

        <%} else {%>    

        <div style="margin-left: -12;  position: relative; margin-top:-16;" class="">

            <%}%>

            <b style="font-size:20px; "> Tarefas:  </b> 
            <%}%>
            <div   id="accordionInside" style='width: 100%;' >

                <%

                    rs = detalhaQuadro(CD_QUADRO);
                    while (rs.next()) {
                        String ID_HST = rs.getString("ID_HST");
                %>

                <%if (rs.getString("DESCRICAO").equals("")) {
                    } else {%>
                <h3   style="font-size:17px" >
                    <%if (rs.getString("SITUACAO").equals("0")) {%>   
                    <i  style=" color:#cccccc;;"  title="Esse quadro está pendente !" class="fas fa-bell"></i>
                    <%=rs.getString("ID_HST")%>-
                    <%} else if (rs.getString("SITUACAO").equals("1")) {%>
                    <i  style="color:#ffa500 ;" title="Esse quadro está em andamento!" class="fas fa-clock"></i>
                    <%=rs.getString("ID_HST")%>-
                    <%} else {%>
                    <i  style=" color:#04BD20 ;"  title="Esse quadro ja foi concluído !" class="fas fa-check"></i>
                    <%=rs.getString("ID_HST")%>-
                    <%}%>
                    <%=rs.getString("DESCRICAO")%>
                    <i style="float:right; font-size: 13px;">Requisição:&nbsp;<%=rs.getString("DT_REQUISICAO")%></i>
                </h3>

                <div  class="ex3" style="margin-left:-21px; padding:30px; padding-bottom:50%; padding-top:1%; height:3px;; margin-top:3px; " >
                    <h3  id="txtNomeTarefa<%=rs.getString("ID_HST")%>" style='font-size: 17px;' onclick="alterarNomeTarefa('<%=rs.getString("ID_HST")%>')">  <%=rs.getString("DESCRICAO")%>  </h3>
                  
                    <h6>
                        <div  id="divTarefa<%=rs.getString("ID_HST")%>" style="display:none;">
                            <input  class="form-control"   value="<%=rs.getString("DESCRICAO")%>" id="txtNmTarefa" style="width:50%;" >
                            <button class="btn " onclick="alteraNomeTarefa('<%=rs.getString("CD_QUADRO")%>', '<%=rs.getString("ID_HST")%>', '<%=CHV_FUN_RESPONSAVEL%>')" style="background: #6A7989; margin-top:-40; margin-left:51%;" title="Clique aqui para alterar o nome do quadro! "  >alterar</button>
                        </div>
                    </h6>
                    <br>
                    <!--    <h6 ><b style="">Descricão:&nbsp;</b></*%=rs.getString("DESCRICAO")%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h6> -->

                    <%if (controle.equals("")) {%>
                    <h6><b style="" >Situacão:&nbsp;&nbsp;&nbsp;&nbsp;</b><%=rs.getString("SITUACAO")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="" >Data Prevista:&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;<b style="" >Data Efetiva:&nbsp;</b></h6>

                    <% } else {%>

                    <%if (chave_x.equals(CHV_FUN_RESPONSAVEL) || chave_x.equals("t1078434") || chave_x.equals("T1078434") || chave_x.equals(CHV_FUN_GRAVACAO) || chave_x.equals("F7034899") || chave_x.equals("f7034899")) {%>
                    <h6 onclick="displayNomeTarefa('<%=rs.getString("ID_HST")%>')">
                        <b style="" onclick="" >
                            <script>

                                $(function () {

                                    $("#txtDataPrevista<%=rs.getString("ID_HST")%>").datepicker();
                                    $("#txtDataEfetiva<%=rs.getString("ID_HST")%>").datepicker();

                                    $("#txtDataPrevista<%=rs.getString("ID_HST")%>").datepicker("option", "dateFormat", "dd/mm/yy");
                                    $("#txtDataEfetiva<%=rs.getString("ID_HST")%>").datepicker("option", "dateFormat", "dd/mm/yy");

                                });

                            </script>

                            Situacão:&nbsp;

                            <select style="height:22%<%=rs.getString("ID_HST")%>; "  id="Sel_Situacao<%=rs.getString("ID_HST")%>">
                                <!--<option value="<%=rs.getString("SITUACAO")%>">-->
                                <%if (rs.getString("SITUACAO").equals("0")) {%>   
                                Nova
                                <%} else if (rs.getString("SITUACAO").equals("1")) { %>
                                Andamento
                                <%} else {%>
                                Concluida
                                <%}%>
                                <!--</option>-->
                                <option value="">[Selecionar]</option>
                                <option value="0">Nova</option>
                                <option value="1">Andamento</option>
                                <option value="2">Concluido</option>
                            </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                            Prevista:&nbsp;
                            <input style="width:12%;"   id="txtDataPrevista<%=ID_HST%>">

                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Efetiva:&nbsp;
                            <input style="width:12%;" id="txtDataEfetiva<%=ID_HST%>"> <br>

                            <div id="dlgAnexo" title="Anexar Arquivo" >
                                <div style="border: solid 0px #e3e3e3; padding: 10px;">
                                    <table>
                                        <tr>
                                            <td>

                                                <form action="upload.jsp" method="post" ENCTYPE="multipart/form-data"  target="myframe" id="frmUpload">
                                                    <input type="file" name="arquivo" id="filePathY" >

                                                    <input type="hidden" name="nome" id="idNovoNomeArquivo"/>

                                                 <button type="submit" class="btnFiltroTC ui-button ui-widget ui-corner-all"  style=" left:15;position: relative; top: -3px; background-color: #6A7989;" onClick="enviarArquivoFase1('<%=rs.getString("CD_QUADRO")%>', '<%=rs.getString("ID_HST")%>', '<%=CHV_FUN_RESPONSAVEL%>')">
                                                        <table style="position: relative; top:-7px; display: inline-block; color: #ffffff;"><tr>
                                                                <td ><div id="btnFiltroTC" class="fa-1x"><i class="fas fa-upload"></i> </div></td>
                                                                <td style="width: 5px"></td>
                                                                <td>Enviar Arquivo</td>
                                                            </tr></table>
                                                    </button>               
                                                </form>                    
                                            </td>
                                        </tr>
                                        <tr >
                                            <td>
                                                <table style="display:none;">
                                                    <tr>
                                                        <td><div class="fa-2x" style="color: #377cbd"><i class="fas fa-paperclip"></i></div></td>
                                                        <td><iframe name="myframe" id="frame1"  style="        padding: 10px; border: solid 1px #e3e3e3; width: 675px; height: 36px; "></iframe></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="display: none"><div class="fa-2x" style="color: #377cbd"><i class="fas fa-database"></i></div></td>
                                                        <td style="display: none"><div id="divGravouArquivo" style="padding: 10px; border: solid 1px #e3e3e3;  width: 675px; height: 36px;"></div></td>
                                                    </tr>                        
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>  

<!--<input id="txtAquivo<%=rs.getString("ID_HST")%>" type="file" style="margin-top:10; " >-->
                        </b>

                        <script>
                            $("#txtDataPrevista" + <%=ID_HST%>).val('<%=rs.getString("DT_PREVISTA")%>');
                            $("#txtDataEfetiva" + <%=ID_HST%>).val('<%=rs.getString("DT_EFETIVA")%>');

                        </script>
                        <button  class="btn btn-info" onclick="salvaClassificaHistoria(<%=rs.getString("ID_HST")%>, <%=rs.getString("CD_QUADRO")%>, '<%=rs.getString("NM_QUADRO")%>', '<%=NM_RESP%>', '<%=CHV_FUN_RESPONSAVEL%>')" style="background: #6A7989; float: right;margin-right: -20px;">
                            Salvar
                        </button>


                    </h6>

                    <% } else {

                    %>

                    <h6><b  >Situacão:&nbsp;</b ><%=rs.getString("SITUACAO")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style=""  >Data Prevista:&nbsp;&nbsp;</b>&nbsp;&nbsp;&nbsp;<b style="" >Data Efetiva:&nbsp;</b></h6>
                    <%}
                        }%>

                   <!-- <h6 style="margin-bottom:24 ;"><b style="">Responsável: &nbsp</b><%=NM_RESP%></h6>-->

                    <div  style=" width: 102.4%; height: 25%; margin-left:1;">
                        <center >

                            <style>
                                meter { display: none; }
                                .ratemate.control { cursor: pointer; }
                            </style>

                            <table style="border: solid 0px; border-color: #cccccc; background-color: #ffffff; padding:5px;">


                                <%if (rs.getString("SITUACAO").equals("")) { %>
                                <div id style='height: 45%; position: relative;'> </div>

                                <%} else {%>
                                <tr >
                                    <td colspan="4" style="height: 18px;">
                                        <div style="padding: 10px; margin-left:27">
                                            <h6 style="margin-left:-3px;"></h6>
                                        </div>
                                        <div id="tbResposta<%=ID_HST%>" style="overflow-y:auto; height: auto; position: relative; "></div>
                                    </td>
                                </tr>

                                <tr>
                                    <!--<td style="width: 7%;"><img src="https://humanograma.intranet.bb.com.br/avatar/<%=chave_x%>" style=" margin-left:10;border-radius: 50%; width: 40px; "></td>-->
                                    <td style="color: #000000;"><b><%=usuario%></b></td>
                                    <td style=""></td>
                                </tr>

                                <tr><td colspan="4" style="padding: 10px;" id="tdTextoMCRating"></td></tr>
                                    <%}%>
                                <div id style='height: 3%; position: relative;'> </div>

                                <tr style='position: relative; '>
                                    <td colspan="4" style="text-align: center;">
                                        <textarea onkeyup="ContCaracteresResposta(<%=ID_HST%>)" id="txtResposta<%=ID_HST%>" placeholder='Informe aqui seu comentario' rows="25" cols="500" maxlength="5000" style="font-family: courier;  overflow: scroll; padding: 10px; width: 840px; height: 123px; border: solid 1px silver; position: relative;"></textarea>
                                        <br>
                                        <label style="width: 80px; vertical-align: top; font-size: 12px; text-align: left; float: left; margin-left:36"  id="tdQtdCaracteresResposta<%=ID_HST%>">5.000/5.000</label>
                                        <br>
                                        <button title="Salvar Comentario " style="float:right; margin-right:36; margin-bottom:22; background: #6A7989;"  class="btn btn-info" onclick="adicionarComentario(<%=ID_HST%>,<%=CD_QUADRO%>, '<%=NM_QUADRO%>', '<%=NM_RESP%>', '<%=CHV_FUN_RESPONSAVEL%>')" style="background: #6A7989;">Salvar</button>

                                    </td>
                                </tr>  
                            </table>
                            <table>
                                <tr>
                                    <td id="tdAnexos<%=ID_HST%>" style="border: solid 0px tomato;"></td>
                                </tr>
                            </table>
                        </center>

                        <h6>  <div id="divArquivo<%=rs.getString("ID_HST")%>" style="border: 2"></div> </h6>

                    </div> 

                    <script>
                        ID_HST = "<%=ID_HST%>";
                        CHV_FUN_RESPONSAVEL = "<%=CHV_FUN_RESPONSAVEL%>";
                        CD_QUADRO = "<%=CD_QUADRO%>";
                        NM_QUADRO = "<%=NM_QUADRO%>";
                        NM_RESP = "<%=NM_RESP%>";
                        nomeAleatorioArquivo = Math.floor(Math.random() * 65536);
                          $("#idNovoNomeArquivo").val(nomeAleatorioArquivo);
                         $("#tbResposta<%=ID_HST%>").load("encheResposta.jsp", {ID_HST: ID_HST});
                        //  $("#divArquivo<%=ID_HST%>").load("encheArquivo.jsp", {ID_HST: ID_HST});
                        $("#divArquivo<%=ID_HST%>").load("carregaAnexos.jsp", {ID_HST: ID_HST, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, CD_QUADRO: CD_QUADRO});
                    </script>

                </div>

                <%}
                    }%>

            </div>
        </div>
        <!--
                <h6>
        <% if (chave_x.equals("T1078434") || chave_x.equals("t1078434") || chave_x.equals(CHV_FUN_GRAVACAO) || chave_x.equals("F7034899") || chave_x.equals("f7034899")) {%>                     
        <i onClick="cancelaQuadro(<%=CD_QUADRO%>)" title="Deletar Quadro" style='float:right; margin-right:10; cursor:pointer;' class="fas fa-trash-alt"></i>
        <i title="Concluir Quadro"   onClick="adicionarStatus(<%=CD_QUADRO%>, 3)" style='float:right; margin-right:10; cursor:pointer;' class="fas fa-check"></i>
        <i  title="Adicionar situaFKILcão de Quadro em andamento"   onClick="adicionarStatus(<%=CD_QUADRO%>, 2)" style='float:right; margin-right:10; cursor:pointer;' class="fas fa-clock"></i>
        <%}%>
    </h6>    
        -->
        <script>

            $(document).ready(function () {
                //  $("#tbResposta").load("encheResposta.jsp",{ID_HST:ID_HST});
            });

            function ContCaracteresResposta(ID_HST) {
                var limite = 5000;
                var caracteresDigitados = $("#txtResposta" + ID_HST).val().length;
                var caracteresRestantes = limite - caracteresDigitados;

                caracteresRestantesXXX = "" + caracteresRestantes + "";
                tam = caracteresRestantesXXX.length;

                caracteresRestantesFormated = caracteresRestantesXXX;
                if (tam == 4) {
                    mil = caracteresRestantesXXX.substr(0, 1);
                    cem = caracteresRestantesXXX.substr(1, 3);
                    caracteresRestantesFormated = "" + mil + "." + cem + "";
                }
                if (limite == tam) {
                    alert("Você atingiu o máximo de caractéres permitido !");
                }

                $("#tdQtdCaracteresResposta" + ID_HST).text("" + caracteresRestantesFormated + "/5.000");
            }



        </script>

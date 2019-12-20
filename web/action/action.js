
function detalhaQuadro(controle, CD_QUADRO, CHV_FUN_RESPONSAVEL, NM_RESP) {

//    console.log("CD_QUADRO: " + "" + CD_QUADRO + "NM_QUADRO: " + "" + NM_QUADRO, "NM_RESP: " + NM_RESP + "controle: " + " " + controle+"SITUACAO_QUADRO: "+ SITUACAO_QUADRO);
    if (controle == 1) {
    //    nomeAleatorioArquivo = Math.floor(Math.random() * 65536);
      ///  $("#idNovoNomeArquivo").val(nomeAleatorioArquivo);
        $("#divDlgDetalhaQuadroX").load("detalhaQuadro.jsp", {CD_QUADRO: CD_QUADRO, controle: controle, CHV_FUN_RESPONSAVEL, NM_RESP: NM_RESP,usuario:usuario});
        $("#divDlgDetalhaQuadroX").dialog("open");
    } else {
        //nomeAleatorioArquivo = Math.floor(Math.random() * 65536);
        //$("#idNovoNomeArquivo").val(nomeAleatorioArquivo);

        $("#divDlgDetalhaQuadroX").load("detalhaQuadro.jsp", {CD_QUADRO: CD_QUADRO, controle: controle, CHV_FUN_RESPONSAVEL, NM_RESP: NM_RESP,usuario:usuario});
        $("#divDlgDetalhaQuadroX").dialog("open");
    }


}


function detalhaQuadroMax(controle, CHV_FUN_GRAVACAO) {

    $("#divDlgDetalhaQuadroX").load("detalhaQuadroMax.jsp", {controle: controle, CHV_FUN_GRAVACAO: CHV_FUN_GRAVACAO});
    $("#divDlgDetalhaQuadroX").dialog("open");

}


function gravaHistoria(CHV_FUN_RESPONSAVEL, SITUACAO_QUADRO) {
    NM_RESP = $("#divNM_RESP").html();
    NM_QUADRO = $("#divNM_QUADRO").html();
    CD_QUADRO = $("#divCD_QUADRO").html();
    descricao = $("#txtDescricao").val();
   // alert(descricao);
    console.log("CD_QUADRO: " + " " + CD_QUADRO + " " + "descricao: " + " " + descricao + " " + "SITUACAO_QUADRO: " + SITUACAO_QUADRO);
    $("#divDetalhaHistoria").load("gravaHistoria.jsp", {CD_QUADRO: CD_QUADRO,
        descricao: descricao, NM_QUADRO: NM_QUADRO, NM_RESP: NM_RESP, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, SITUACAO_QUADRO: SITUACAO_QUADRO,usuario:usuario});
}

function abreDlgAdicionarHistoria(CD_QUADRO, NM_RESP, NM_QUADRO) {
    $("#divDlgAdcionarHistoria").load("criaHistoria.jsp", {CD_QUADRO: CD_QUADRO, NM_RESP: NM_RESP, NM_QUADRO: NM_QUADRO});
    $("#divDlgAdcionarHistoria").dialog("open");
}


function loadEncheHistoria() {
    $("#divEncheHistoria").load("encheHistoria.jsp", {});
}


function adicionarHistoriaQuadro(CHV_FUN_RESPONSAVEL, CD_QUADRO) {
    DESCRICAO = $("#txtDESCRICAO").val();
    console.log("DESCRICAO: " + " " + DESCRICAO + "" + "CHV_FUN_RESPONSAVEL: " + "" + CHV_FUN_RESPONSAVEL + "CD_QUADRO: " + "" + CD_QUADRO);
    $("#divEncheHistoria").load("gravaHistoriaQuadro.jsp", {DESCRICAO: DESCRICAO, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, CD_QUADRO: CD_QUADRO});
}


function abreDlgadicionarQuadro() {

    $("#divDlgAdcionarQuadro").load("criaQuadro.jsp", {});
    $("#divDlgAdcionarQuadro").dialog("open");
}

function abreDlgadicionarResponsavel() {

    $("#divDlgAdcionarResponsavel").load("criaResponsavel.jsp", {});
    $("#divDlgAdcionarResponsavel").dialog("open");
}



function gravaResponsavel() {
    CHV_FUN_RESPONSAVEL = $("#CHV_FUN_RESP").val();
    NM_RESP = $("#txtNomeResponsalvel").val();
    FUNCAO = $("#txtFuncao").val();
    COLOR = $("#Sel_SituacaoCores").val();

    console.log("CHV_FUN_RESPONSAVEL: " + " " + CHV_FUN_RESPONSAVEL + " " + "NM_RESP: " + " " + NM_RESP + " " + "FUNCAO: " + FUNCAO);
    $("#divDlgAdcionarResponsavel").load("gravarResponsavel.jsp", {CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, NM_RESP: NM_RESP, FUNCAO: FUNCAO, COLOR: COLOR});
}



function abreDlgadicionarQuadroFuncionario(controle, CHV_FUN_RESPONSAVEL) {
    console.log("" + "CHV_FUN_RESPONSAVEL: " + "" + CHV_FUN_RESPONSAVEL + " " + "controle: " + " " + controle);
    $("#divDlgAdcionarQuadro").load("criaQuadro.jsp", {CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, controle: controle});
    $("#divDlgAdcionarQuadro").dialog("open");
}



// ORIGINAl;
function adicionarQuadro() {
    nome = $("#txtNomeQuadro").val();
    if ($.trim(nome) === "") {
        alert("Informe o nome do quadro!");
        return false;
    }

    controle = $("#divControle").html();
    data_entrega = $("#txtdataEntrega").val();

    data_entrega = data_entrega.substring(6, 10) + "-" + data_entrega.substring(3, 5) + "-" + data_entrega.substring(0, 2);

    console.log("data_entrega: " + " " + data_entrega);

    if ($.trim(data_entrega) === "") {
        alert("Informe data de entraga do quadro!");
        return false;
    }

    if (controle == 1) {
        CHV_FUN_RESPONSAVEL = $("#divCHV_FUN_RESPONSAVEL").html();
        $("#divDlgAdcionarQuadro").load("confirmarQuadro.jsp", {nome: nome, data_entrega: data_entrega, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL});
    } else {
        CHV_FUN_RESPONSAVEL = $("#sel_CHV_FUN_RESPONSAVEL").val();
        if ($.trim(CHV_FUN_RESPONSAVEL) === "") {
            alert("Informe o responsavel do quadro!");
            return false;
        }
        $("#DIV_O").load("confirmarQuadro.jsp", {nome: nome, data_entrega: data_entrega, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL});
    }

    console.log("nome: " + " " + nome + " " + "CHV_FUN_RESPONSAVEL: " + " " + CHV_FUN_RESPONSAVEL + " " + "data_entrega: " + " " + data_entrega);
    console.log("data_entrega: " + " " + data_entrega);
}
function adicionarQuadroV2(CHV_FUN_RESPONSAVEL) {
    NM_QUADRO = $("#txtDescricao" + CHV_FUN_RESPONSAVEL).val();
    if ($.trim(NM_QUADRO) === "") {
        alert("Informe o nome do quadro!");
        return false;
    }
    $("#main").load("confirmarQuadro.jsp", {NM_QUADRO: NM_QUADRO, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL});

    console.log("NM_QUADRO: " + " " + NM_QUADRO);
}


function adicionarQuadroFuncionario() {
    nome = $("#txtNomeQuadro").val();
    data = $("#txtDataQuadro").val();
    data = data.substring(6, 10) + "-" + data.substring(3, 5) + "-" + data.substring(0, 2);
    CHV_FUN_RESPONSAVEL = $("#divCHV_FUN_RESPONSAVEL").html();
    data_entrega = $("#txtDataEntrega").val();
    data_entrega = data_entrega.substring(6, 10) + "-" + data_entrega.substring(3, 5) + "-" + data_entrega.substring(0, 2);
    //  console.log("resumo:" + " " + resumo + "" + "CHV_FUN_RESPONSAVEL:" + "" + CHV_FUN_RESPONSAVEL);
    $("#divDlgAdcionarQuadro").load("confirmarQuadroFuncionario.jsp", {nome: nome, data: data, data_entrega: data_entrega, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL});
}

function encheQuadro() {
    $("#divEncheHistoria").load("encheQuadro.jsp", {});
}


function classificaHistoria(CD_QUADRO, NM_QUADRO, NM_RESP, CHV_FUN_RESPONSAVEL) {
    console.log("CD_QUADRO: " + " " + CD_QUADRO + " NM_QUADRO: " + " " + NM_QUADRO, " NM_RESP: " + " " + NM_RESP + " " + " CHV_FUN_RESPONSAVEL: " + "  " + CHV_FUN_RESPONSAVEL);
    $("#divDlgAClassificaHistoria").load("classificaHistoria.jsp", {CD_QUADRO: CD_QUADRO, NM_RESP: NM_RESP, NM_QUADRO: NM_QUADRO, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL});
    $("#divDlgAClassificaHistoria").dialog("open");
}


function salvaClassificaHistoria(ID_HST, CD_QUADRO, NM_QUADRO, NM_RESP, CHV_FUN_RESPONSAVEL) {

    ARQUIVO = $("#txtAquivo" + ID_HST).val();
    BARRA = "/";
    NM_ARQUIVO = $("#txtAquivo" + ID_HST).val();
    CAMINHO = ("Bibliotecas" + BARRA + "Imagens" + BARRA + NM_ARQUIVO);
    situacao = $("#Sel_Situacao" + ID_HST).val();
    if (situacao === "" & ARQUIVO !== "") {
        console.log("ARQUIVO: " + ARQUIVO);
        $("#divDlgAClassificaHistoria").load("confirmaArquivo.jsp", {CD_QUADRO: CD_QUADRO, ID_HST: ID_HST, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, NM_RESP: NM_RESP, CAMINHO: CAMINHO, NM_ARQUIVO: NM_ARQUIVO});
    } else {
        if ($.trim(situacao) === "") {
            alert("Informe a situacao do quadro!");
            return false;
        }

        dt_prevista = $("#txtDataPrevista" + ID_HST).val();

        if ($.trim(dt_prevista) === "") {
            alert("Informe a data prevista da historia!");
            return false;
        }
        dt_prevista = dt_prevista.substring(6, 10) + "-" + dt_prevista.substring(3, 5) + "-" + dt_prevista.substring(0, 2);

        dt_efetiva = $("#txtDataEfetiva" + ID_HST).val();
        dt_efetiva = dt_efetiva.substring(6, 10) + "-" + dt_efetiva.substring(3, 5) + "-" + dt_efetiva.substring(0, 2);

        console.log("dt_prevista:" + " " + dt_prevista + "" + "dt_efetiva:" + "" + dt_efetiva + "" + "situacao: " + situacao + " " + "ID_HST: " + ID_HST + " " + "ARQUIVO: " + ARQUIVO);
            $("#divDlgAClassificaHistoria").load("confirmaClassificaHistoria.jsp", {dt_prevista: dt_prevista, dt_efetiva: dt_efetiva, situacao: situacao, ID_HST: ID_HST,
            CD_QUADRO: CD_QUADRO, NM_QUADRO: NM_QUADRO, NM_RESP: NM_RESP, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, ARQUIVO: ARQUIVO});

    }


}


function myFunction() {
    var x = document.getElementById("divAdcHistoria");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}


function adicionarComentario(ID_HST, CD_QUADRO, NM_QUADRO, NM_RESP, CHV_FUN_RESPONSAVEL) {

    comentario = $("#txtResposta" + ID_HST).val();
    if ($.trim(comentario) === "") {
        alert("Informe o comentario !");
        return false;
    }
    console.log("comentario:" + " " + comentario + "" + "ID_HST:" + "" + ID_HST + "");
    $("#divDlgAClassificaHistoria").load("confirmarComentario.jsp", {comentario: comentario, ID_HST: ID_HST, CD_QUADRO: CD_QUADRO, NM_QUADRO: NM_QUADRO,
        NM_RESP: NM_RESP, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL,usuario:usuario,chv_session:chv_session});
}


function cancelaQuadro(CD_QUADRO) {
    i = confirm("Deseja cancelar o quadro ?");
    if (i) {
        $("#divEncheResponsavel").load("cancelarQuadro.jsp", {CD_QUADRO: CD_QUADRO});
    } else {

        return false;
    }
    console.log("CD_QUADRO: " + CD_QUADRO);
}

function filtrarQuadro(CHV_FUN_RESPONSAVEL, NM_RESP, controle, SITUACAO_QUADRO) {

    //  SITUACAO_QUADRO = $("#Sel_SituacaoQuadro" + CHV_FUN_RESPONSAVEL).val();

    console.log("SITUACAO_QUADRO: " + "" + SITUACAO_QUADRO + " " + "CHV_FUN_RESPONSAVEL: " + CHV_FUN_RESPONSAVEL + " " + "NM_RESP: " + NM_RESP);
    $("#td_" + CHV_FUN_RESPONSAVEL).load("encheQuadro.jsp", {CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, SITUACAO_QUADRO: SITUACAO_QUADRO, controle: controle});

}


function myFunction() {
    var x = document.getElementById("divAdcHistoria");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

function alterarNomeQuadro() {
    //  var x = document.getElementById("txtNomeQuadro");
    var y = document.getElementById("divNmQuadro");
    var x = document.getElementById("txtNomeTarefa");
    //y=$("#txtNmQuadro").val();
    if (y.style.display === "none") {
        y.style.display = "block";
        x.style.display = "none";
    } else if (y.style.display === "block") {
        y.style.display = "none";
        x.style.display = "block";
    }
}

function alteraQuadro(CD_QUADRO, NM_QUADRO, NM_RESP, CHV_FUN_RESPONSAVEL, CHV_FUN_GRAVACAO) {

    NM_QUADRO = $("#txtNmQuadro").val();
    if ($.trim(NM_QUADRO) === "") {
        alert("Informe o nome do quadro!");
        return false;
    }
    console.log("NM_QUADRO:" + " " + NM_QUADRO + "" + "CD_QUADRO:" + CD_QUADRO, "NM_RESP:" + NM_RESP + "" + "CHV_FUN_RESPONSAVEL:" + CHV_FUN_RESPONSAVEL + " " + "CHV_FUN_GRAVACAO:" + CHV_FUN_GRAVACAO);
    $("#divDlgDetalhaQuadroX").load("alteraQuadro.jsp", {CD_QUADRO: CD_QUADRO, NM_QUADRO: NM_QUADRO, NM_RESP: NM_RESP, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL, CHV_FUN_GRAVACAO: CHV_FUN_GRAVACAO});

}

function adicionarStatus(CD_QUADRO, SITUACAO_QUADRO) {

    NM_QUADRO = $("#txtNmQuadro").val();
    console.log("SITUACAO_QUADRO:" + " " + SITUACAO_QUADRO + "" + "CD_QUADRO:" + CD_QUADRO);
    $("#divDlgDetalhaQuadroX").load("adicionarStatus.jsp", {CD_QUADRO: CD_QUADRO, SITUACAO_QUADRO: SITUACAO_QUADRO});

}

function displayNome() {
    //  alert("teste");
    var x = document.getElementById("txtNomeQuadro");//padrao
    var y = document.getElementById("divNmQuadro");// input

    if (y.style.display === "block") {
        y.style.display = "none";
        x.style.display = "block";
    } else {
        y.style.display = "none";

    }

}


function abreCampoQuadro(CHV_FUN_RESPONSAVEL) {
    //  x = $("#tdTarefa"+CHV_FUN_RESPONSAVEL).html();
    var x = document.getElementById("tdTarefa" + CHV_FUN_RESPONSAVEL);
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}


function alterarNomeTarefa(ID_HST) {
    var x = document.getElementById("txtNomeTarefa" + ID_HST);
    var y = document.getElementById("divTarefa" + ID_HST);
    // var x = document.getElementById("nomeTarefa");
    //var x = document.getElementById("txtNmTarefa");
    //y=$("#txtNmQuadro").val();
    if (y.style.display === "none") {
        y.style.display = "block";
        x.style.display = "none";
    } else if (y.style.display === "block") {
        y.style.display = "none";
        x.style.display = "block";
    }
}


function displayNomeTarefa(ID_HST) {
    //  alert("teste");
    var x = document.getElementById("txtNomeTarefa" + ID_HST);//padrao
    var y = document.getElementById("divTarefa" + ID_HST);// input

    if (y.style.display === "block") {
        y.style.display = "none";
        x.style.display = "block";
    } else {
        y.style.display = "none";

    }

}


function alteraNomeTarefa(CD_QUADRO, ID_HST, CHV_FUN_RESPONSAVEL) {

    DESCRICAO = $("#txtNmTarefa").val();

    console.log("DESCRICAO:" + " " + DESCRICAO + "" + "ID_HST:" + "" + ID_HST + "");
    $("#divDlgAClassificaHistoria").load("alteraTarefaNome.jsp", {DESCRICAO: DESCRICAO, ID_HST: ID_HST, CD_QUADRO: CD_QUADRO, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL});
}


function enviarArquivoFase1(CD_QUADRO, ID_HST, CHV_FUN_RESPONSAVEL) {
    idProtocolo = Math.floor(Math.random() * 65536);
    //console.log("idProtocolo : "+idProtocolo);

    nomeArquivo = $("#filePathY").val();
    //console.log("nomeArquivo :"+nomeArquivo);  

    if ($.trim(nomeArquivo) === "") {
        alert("Anexe o arquivo !");
        return false;
    }

    var tam = nomeArquivo.length;
    ext = nomeArquivo.substr(tam - 4, tam);
    //console.log("ext :"+ext); 
    contemPonto = ext.indexOf(".");
    if (contemPonto < 0) {
        ext = "." + ext + "";
        //console.log("Corrigindo Extensão");
    }
    novoNomeArquivo = "" +  $("#idNovoNomeArquivo").val() + ext + "";
    //console.log("novoNomeArquivo :"+novoNomeArquivo); 

    //Enviar parametros para gravação
    $("#DIV_O").load("gravaArquivo.jsp", {idProtocolo: idProtocolo, nomeArquivo: nomeArquivo, novoNomeArquivo: novoNomeArquivo, CD_QUADRO: CD_QUADRO, ID_HST: ID_HST, CHV_FUN_RESPONSAVEL: CHV_FUN_RESPONSAVEL
    });

    //   setTimeout(fecharDialog,1500,idProtocolo);   
}


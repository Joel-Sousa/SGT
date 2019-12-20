/**
 * Funcao somenteNumeros
 * Funcao que bloqueia a entrada de caracteres não numéricos no campo recebido por parâmetro.
 */
function permitirSomenteNumeros(campo){

	var digitos = "0123456789";
	var campoTemp;
	
    for (var i = 0; i < campo.value.length ; i++)
    {   
    	campoTemp = campo.value.substring(i,i+1);   
        if (digitos.indexOf(campoTemp) == -1)
        {   
            campo.value = campo.value.substring(0,i);   
        }
    }
}

/**
 * Funcao limitarCaracteres
 * Funcao que recebe o campo a ser limitado e uma variavel de limite de caracteres,
 * nao permitindo ultrapassar o limite de caracteres.
 */
function limitarCaracteres(campo, tamanhoMax)
{
    if (campo.value.length > tamanhoMax)
    {
        campo.value = campo.value.substring(0, tamanhoMax);
    }
}

/*formatar em número*/
function mascaraQuantidade(num) {	
	x = 0;   
	if(num < 0){
		num = Math.abs(num);
		x = 1;
	}
	if(isNaN(num)) num = "0";
	num = Math.floor((num * 100 + 0.5) / 100).toString();
	for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
	num = num.substring(0,num.length - (4 * i + 3)) + '.' + num.substring(num.length - (4 * i + 3));
	ret = num;
	if (x == 1) ret = ' - ' + ret;
	return ret;	
}

/*formatar em moeda*/
function float2moeda(num) {
	x = 0;
	if(num < 0) {
		num = Math.abs(num);
		x = 1;
	}
	if(isNaN(num)) num = "0";
	cents = Math.floor((num * 100 + 0.5) % 100);
	num = Math.floor((num * 100 + 0.5) / 100).toString();
	if(cents < 10) cents = "0" + cents;
	for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
	num = num.substring(0,num.length - (4 * i + 3)) + '.' + num.substring(num.length - (4 * i + 3));
	ret = num + ',' + cents;
	if (x == 1) ret = ' - ' + ret;
	return ret;
}

/*transformar data para comparação*/
function process(date){
	var parts = date.split("/");
	return new Date(parts[2], parts[1] - 1, parts[0]);
}

/*datepicker em portugues*/
$(function () {
	$( ".calendario" ).datepicker({
		dateFormat: 'dd/mm/yy',
		dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo'],
		dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
		monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		setDate: "d m y",
		maxDate: "d m y",
		showOn: "both",
		buttonImage: "../../../img/calendar.gif",
		buttonImageOnly: true
	});
});

/*Piscar icone*/
$(function () {
	setInterval(function(){
		$(".icon").fadeOut();
		$(".icon").fadeIn();
	},10);
});

/*Função somente números*/
$(function () {
	$('.sonums').keypress(function(event) {
		var tecla = (window.event) ? event.keyCode : event.which;
		//alert (tecla);
		if ((tecla > 47 && tecla < 58)) return true;
		else {
			if (tecla != 8 && tecla != 0 && tecla != 118) return false;
			else return true;
		}
	});					
});

/*Função substituir tudo*/
String.prototype.replaceAll = function(de, para){
	var str = this;
	var pos = str.indexOf(de);
	while (pos > -1){
		str = str.replace(de, para);
		pos = str.indexOf(de);
	}
	return (str);
}
/*
Expressão regular para transforma de valor em reais para valor em dolar
.replace(/[.]/g, '').replace(/[,]/g, '.')
*/
/* máscara data */
function mascaraData(campo, e) {
	var kC = (document.all) ? event.keyCode : e.keyCode;
	var data = campo.value;
	if (kC != 8 && kC != 46) {
		if (data.length == 2) {
			campo.value = data += '/';
		} else if (data.length == 5) {
			campo.value = data += '/';
		} else
			campo.value = data;
	}
}
/* máscara cpf, cep, cartão */
function fMasc(objeto, mascara) {
	obj = objeto;
	masc = mascara;
	setTimeout("fMascEx()", 1);
}
function fMascEx() {
	obj.value = masc(obj.value);
}
function mCPF(cpf) {
	cpf = cpf.replace(/\D/g, "");
	cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
	cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
	cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
	return cpf;
}
function mCEP(cep){
	cep = cpf.replace(/\D/g, "");
	return cep;
}
function mCARTAO(cartao){
	  cartao = cartao.replace(/\D/g,""); 
	  cartao = cartao.replace(/(\d{4})/g, "$1 "); 
	  cartao = cartao.replace(/\.$/, ""); 
	  cartao = cartao.substring(0, 19);
	  return cartao;
}

/* formatar preço R$ */
function k(i) {
	var v = i.value.replace(/\D/g, '');
	v = (v / 100).toFixed(2) + '';
	v = v.replace(".", ".");
	v = v.replace(/(\d)(\d{3})(\d{3}),/g, "$1.$2.$3,");
	v = v.replace(/(\d)(\d{3}),/g, "$1.$2.");
	i.value = v;
}

/* botão topo página */
$(document).ready(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 40) {
			$('#topBtn').fadeIn();
		} else {
			$('#topBtn').fadeOut();
		}
	});
	$("#topBtn").click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 800);
	});
});


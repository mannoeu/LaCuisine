<!DOCTYPE html5>
<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"
import="java.text.SimpleDateFormat"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Cadastrar</title>
	
	<!-- CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/style-add.css">
	<link href="https://fonts.googleapis.com/css?family=Abel&display=swap" rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<%
	Date data = new Date(System.currentTimeMillis());
	SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
	%>
	<div class="corpo">
		<a href="index.jsp"><i class="fas fa-angle-left"></i></a>
  	 <div class="container">
		<form class="box" action="adicionaCliente" method="post">
			<label for="nome">Nome:</label>
        	<fieldset>
        	<input type="text" name="nome" id="nome" required="true" placeholder="Nome"/>
        	</fieldset>
			<label for="cpf">CPF:</label>
        	<fieldset>
        	<input type="text" name="cpf" id="cpf" maxlength="14" onkeypress="fMasc(this,mCPF)" required="true" placeholder="CPF"/>
        	</fieldset>
			<label for="email">Email:</label>
        	<fieldset>
        	<input type="email" name="email" required="true" placeholder="E-mail"/>
        	</fieldset>
			<label for="nomeMae">Nome da mãe:</label>
        	<fieldset>
        	<input type="text" name="nomeMae" id="nomeMae" required="true" placeholder="Nome da Mãe"/>
        	</fieldset>
			<label for="dataNascimento">Data de Nascimento:</label>
        	<fieldset>
        	<input type="text" name="dataNascimento" id="dataNascimento" required="true" onkeypress="mascaraData(this, event)" maxlength="10" placeholder="Data de Nascimento"/>
       	 	</fieldset>
        	<input type="text" hidden="true" name="dataCadastro" readonly="true" id="dataCadastro" value="<%=sdt.format(data.getTime())%>"/> 
			<label for="cep">CEP:</label>
        	<fieldset>
        	<input type="text" name="cep" id="cep" maxlength="8" onkeypress="fMasc(this,mCEP)" required="true" placeholder="CEP"/>
        	</fieldset>
			<label for="estado">Estado:</label>
       	 	<fieldset>
       	 	<select name="estado" id="estado" required="true"/>
				<option value="" disabled selected>Estado</option>
				<option value="AC">Acre</option>
				<option value="AL">Alagoas</option>
				<option value="AP">Amapá</option>
				<option value="AM">Amazonas</option>
				<option value="BA">Bahia</option>
				<option value="CE">Ceará</option>
				<option value="DF">Distrito Federal</option>
				<option value="ES">Espírito Santo</option>
				<option value="GO">Goiás</option>
				<option value="MA">Maranhão</option>
				<option value="MT">Mato Grosso</option>
				<option value="MS">Mato Grosso do Sul</option>
				<option value="MG">Minas Gerais</option>
				<option value="PA">Pará</option>
				<option value="PB">Paraíba</option>
				<option value="PR">Paraná</option>
				<option value="PE">Pernambuco</option>
				<option value="PI">Piauí</option>
				<option value="RJ">Rio de Janeiro</option>
				<option value="RN">Rio Grande do Norte</option>
				<option value="RS">Rio Grande do Sul</option>
				<option value="RO">Rondônia</option>
				<option value="RR">Roraima</option>
				<option value="SC">Santa Catarina</option>
				<option value="SP">São Paulo</option>
				<option value="SE">Sergipe</option>
				<option value="TO">Tocantins</option>
			</select>
        	</fieldset>
			<label for="cidade">Cidade:</label>
        	<fieldset>
        	<input type="text" name="cidade" id="cidade" required="true" placeholder="Cidade"/>
        	</fieldset>
			<label for="bairro">Bairro:</label>
        	<fieldset>
            <input type="text" name="bairro" id="bairro" required="true" placeholder="Bairro"/>
        	</fieldset>
			<label for="logradouro">Logradouro:</label>
        	<fieldset>
            <input type="text" name="logradouro" id="logradouro" required="true" placeholder="Logradouro"/>
       		 </fieldset>
            <label for="numero">Numero:</label>
        	<fieldset>
        	<input type="number" name="numero" id="numero" min="1" required="true" placeholder="Numero"/>
        	</fieldset>
    		<input id="enviar" type="submit" value="Salvar"/>
	</form>
   </div>
  </div>
  <!-- Preencher endereço a partir do CEP -->
  <script type="text/javascript">
	$("#cep").focusout(function(){
		$.ajax({
			url: 'https://viacep.com.br/ws/'+$(this).val()+'/json/unicode/',
			dataType: 'json',
			success: function(resposta){
				$("#logradouro").val(resposta.logradouro);
				$("#bairro").val(resposta.bairro);
				$("#cidade").val(resposta.localidade);
				$("#estado").val(resposta.uf);
				$("#numero").focus();
			}
		});
	});
	</script>
		<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
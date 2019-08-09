<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"
import="java.text.SimpleDateFormat"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Atualizar</title>
	
	<!-- CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/style-add.css">
	<link href="https://fonts.googleapis.com/css?family=Abel&display=swap" rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
		<%
		ClienteDao dao = new ClienteDao();
		Cliente c = dao.getClienteById(request.getParameter("id"));
		SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
		%>
<div class="corpo">
		<a href="index.jsp"><i class="fas fa-angle-left"></i></a>
  	 <div class="container">
		<form class="box" action="alteraCliente">
        	<input type="text" hidden="true" name="idCliente" id="idCliente" readonly="true" required="true" value="<%=c.getIdCliente()%>"/>
			<label for="nome">Nome:</label>
        	<fieldset>
        	<input type="text" name="nome" id="nome" required="true" value="<%=c.getNome()%>"/>
        	</fieldset>
			<label for="cpf">CPF:</label>
        	<fieldset>
        	<input type="text" name="cpf" id="cpf" maxlength="14" onkeypress="fMasc(this,mCPF)" required="true" value="<%=c.getCpf()%>"/>
        	</fieldset>
			<label for="email">Email:</label>
        	<fieldset>
        	<input type="email" name="email" required="true" value="<%=c.getEmail()%>"/>
        	</fieldset>
			<label for="nomeMae">Nome da mãe:</label>
        	<fieldset>
        	<input type="text" name="nomeMae" id="nomeMae" required="true" value="<%=c.getNomeMae()%>"/>
        	</fieldset>
			<label for="dataNascimento">Data de Nascimento:</label>
        	<fieldset>
        	<input type="text" name="dataNascimento" id="dataNascimento" required="true" onkeypress="mascaraData(this, event)" maxlength="10" value="<%=sdt.format(c.getDataNascimento().getTime())%>"/>
       	 	</fieldset>
			<label for="cep">CEP:</label>
        	<fieldset>
        	<input type="text" name="cep" id="cep" maxlength="8" onkeypress="fMasc(this,mCEP)" required="true" value="<%=c.getCep()%>"/>
        	</fieldset>
			<label for="estado">Estado:</label>
       	 	<fieldset>
       	 	<select name="estado" id="estado" required="true"/>
				<option value="<%=c.getEstado()%>">Estado</option>
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
        	<input type="text" name="cidade" id="cidade" required="true" value="<%=c.getCidade()%>"/>
        	</fieldset>
			<label for="bairro">Bairro:</label>
        	<fieldset>
            <input type="text" name="bairro" id="bairro" required="true" value="<%=c.getBairro()%>"/>
        	</fieldset>
			<label for="logradouro">Logradouro:</label>
        	<fieldset>
            <input type="text" name="logradouro" id="logradouro" required="true" value="<%=c.getLogradouro()%>"/>
       		 </fieldset>
            <label for="numero">Numero:</label>
        	<fieldset>
        	<input type="number" name="numero" id="numero" min="1" required="true" value="<%=c.getNumero()%>"/>
        	</fieldset>
    		<input id="enviar" type="submit" value="Salvar"/>
	</form>
   </div>
  </div>
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
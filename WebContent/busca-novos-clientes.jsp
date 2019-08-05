<!DOCTYPE html5>
<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"
import="java.text.SimpleDateFormat"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Buscar Clientes</title>
	
	<!-- CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/style-add.css">
	<link href="https://fonts.googleapis.com/css?family=Abel&display=swap" rel="stylesheet">
</head>
<body>
	<div class="corpo">
		<a href="index.jsp"><i class="fas fa-angle-left"></i></a>
  	 		<div class="container">	
	<form class="box" action="novos-clientes.jsp" method="post">
	<h1>novos clientes cadastrados</h1>
		<label for="nome">Dia:</label>
    		<fieldset>
			<input type="number" min="1" name="dia" id="dia" required="true">
			</fieldset>
		<label for="nome">Mês:</label>
       	 	<fieldset>
       	 	<select name="mes" id="mes" required="true"/>
				<option value="" disabled selected>Selecione uma opção</option>
				<option value="01">Janeiro</option>
				<option value="02">Fevereiro</option>
				<option value="03">Março</option>
				<option value="04">Abril</option>
				<option value="05">Maio</option>
				<option value="06">Junho</option>
				<option value="07">Julho</option>
				<option value="08">Agosto</option>
				<option value="09">Setembro</option>
				<option value="10">Outubro</option>
				<option value="11">Novembro</option>
				<option value="12">Dezembro</option>
			</select>
        	</fieldset>
		<label for="nome">Ano:</label>
    		<fieldset>
			<input type="number" min="1800" required="true" name="ano" id="ano">
			</fieldset>
			<input type="submit" value="Buscar"/>
	</form>
	</div>
</div>
		<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
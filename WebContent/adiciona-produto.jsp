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
</head>
<body>
	<%
	Date data = new Date(System.currentTimeMillis());
	SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
	%>
	<div class="corpo">
		<a href="index.jsp"><i class="fas fa-angle-left"></i></a>
  	 <div class="container">
		<form class="box" action="adicionaProduto" method="post">
			<label for="nome">Nome:</label>
        	<fieldset>
        	<input type="text" name="nome" id="nome" required="true" placeholder="Nome"/>
        	</fieldset>
			<label for="tipo">Tipo:</label>
       	 	<fieldset>
       	 	<select name="tipo" id="tipo" required="true"/>
				<option value="" disabled selected>Categoria</option>			
				<option value="Aparelho de Jantar">Aparelho de Jantar</option>
				<option value="Chaleiras e Leiteiras">Chaleiras e Leiteiras</option>
				<option value="Conjunto de Copos">Conjunto de Copos</option>
				<option value="Conjunto de Sobremesa">Conjunto de Sobremesa</option>
				<option value="Faqueiros e Talheres">Faqueiros e Talheres</option>
				<option value="Produtos de Limpeza">Produtos de Limpeza</option>
				<option value="Formas e Assadeiras">Formas e Assadeiras</option>
				<option value="Panelas e Frigideiras">Panelas e Frigideiras</option>
				<option value="Utensílios e Diversos">Utensílios Diversos</option>
				<option value="Xícaras e Canecas">Xícaras e Canecas</option>
			</select>
        	</fieldset>
        	<label for="preco">Preço Unitário:</label>
        	<fieldset>
        	<input type="text" name="preco" id="preco" required="true" placeholder="R$" onkeyup="k(this);"/>
        	</fieldset>
        	<label for="peso">Peso:</label>
        	<fieldset>
        	<input type="text" name="peso" id="peso" required="true" placeholder="Kg"/>
        	</fieldset>
        	<label for="altura">Altura:</label>
        	<fieldset>
        	<input type="text" name="altura" id="altura" required="true" placeholder="Altura do produto em cm"/>
        	</fieldset>
        	<label for="largura">Largura:</label>
        	<fieldset>
        	<input type="text" name="largura" id="largura" required="true" placeholder="Largura do produto em cm"/>
        	</fieldset>
        	<label for="comprimento">Comprimento:</label>
        	<fieldset>
        	<input type="text" name="comprimento" id="comprimento" required="true" placeholder="Comprimento do produto em cm"/>
        	</fieldset>
        	<label for="alturaEmbalagem">Altura da Embalagem:</label>
        	<fieldset>
        	<input type="text" name="alturaEmbalagem" id="alturaEmbalagem" required="true" placeholder="Altura da embalagem em cm"/>
        	</fieldset>
        	<label for="larguraEmbalagem">Largura da Embalagem:</label>
        	<fieldset>
        	<input type="text" name="larguraEmbalagem" id="larguraEmbalagem" required="true" placeholder="Largura da embalagem em cm"/>
        	</fieldset>
        	<label for="comprimentoEmbalagem">Comprimento da Embalagem:</label>
        	<fieldset>
        	<input type="text" name="comprimentoEmbalagem" id="comprimentoEmbalagem" required="true" placeholder="Comprimento da embalagem em cm"/>
        	</fieldset>
        	<input type="text" hidden="true" name="dataCadastro" readonly="true" id="dataCadastro" value="<%=sdt.format(data.getTime())%>"/> 
    		<input id="enviar" type="submit" value="Salvar"/>
	</form>
   </div>
  </div>
		<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
<!DOCTYPE html5>
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
	<div class="corpo">
		<a href="index.jsp"><i class="fas fa-angle-left"></i></a>
  	 <div class="container">
		<form class="box" action="adicionaVendedor" method="post">
			<label for="nome">Nome:</label>
        	<fieldset>
        	<input type="text" name="nome" id="nome" required="true" placeholder="Nome"/>
    		<input id="enviar" type="submit" value="Salvar"/>
	</form>
   </div>
  </div>
</body>
</html>
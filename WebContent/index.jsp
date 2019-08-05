<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Loja</title>
	
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Abel&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<header>
		<input type="checkbox" id="btn-menu"><label for="btn-menu">&#9776;</label>
		<nav class="menu">
			<ul>
				<li><a class="link" href="#">Clientes</a>
					<ul>
						<li><a class="link" href="adiciona-cliente.jsp">Novo
								Cliente</a></li>
						<li><a class="link" href="lista-cliente.jsp">Listar
								Clientes</a></li>
					</ul></li>
				<li><a class="link" href="#">Produtos</a>
					<ul>
						<li><a class="link" href="adiciona-produto.jsp">Novo
								Produto</a></li>
						<li><a class="link" href="lista-produto.jsp">Listar
								Produtos</a></li>
					</ul></li>
				<li><a class="link" href="#">Vendedores</a>
					<ul>
						<li><a class="link" href="adiciona-vendedor.jsp">Novo
								Vendedor</a></li>
						<li><a class="link" href="lista-vendedor.jsp">Listar
								Vendedores</a></li>
					</ul></li>
				<li><a class="link" href="#">Vendas</a>
					<ul>
						<li><a class="link" href="adiciona-venda.jsp">Nova Venda</a></li>
						<li><a class="link" href="lista-venda.jsp">Listar Vendas</a></li>
					</ul></li>
				<li><a class="link" href="#">Relatórios</a>
					<ul>
						<li><a class="link" href="faturamento.jsp">Faturamento</a></li>
						<li><a class="link" href="clientes.jsp">Clientes</a></li>
						<li><a class="link" href="frete.jsp">Frete</a></li>
						<li><a class="link" href="desconto.jsp">Desconto</a></li>
						<li><a class="link" href="busca-novos-clientes.jsp">Novos Clientes</a></li>
					</ul></li>
			</ul>
		</nav>
	</header>
	<div class="papel">
		<div class="logo">
			<img src="img/logo.png" alt="Logo">
		</div>
	</div>
	<div class="container">
		<h1>La Cuisine</h1>
		<p>Aqui você encontra os mais diversos utensílios para sua
			cozinha.</p>
		<div class="row">
			<div class="col-md-12">
				<img src="img/faca.png" class="img-fluid" alt="imagem">
			</div>
		</div>
		<h3>Mais do que números, o que define a La Cuisine é o esforço
			permanente para tornar a vida das pessoas cada vez melhor.</h3>
		<p>A La Cuisine é reconhecida como referência de qualidade em mais
			de 120 países. Sua marca se apoia na inovação, no design, na
			tecnologia e no valor do capital humano para cumprir uma missão
			indelegável: gerar valor ao consumidor nas mais diversas fronteiras,
			culturas, épocas e ocasiões.</p>
		<div class="row">
			<div class="col-md-4">
				<img src="img/pessoas.png" class="img-fluid" alt="imagem">
			</div>
		</div>
		<h3>Produtos de qualidade</h3>
		<p>Né brincadeira não, viu?! Nossos produtos são só o mí da pipoca</p>
		<div class="row">
			<div class="col-md-4">
				<p>
					<i>Você pode conferir a lista de todos os produtos clicando em
						<strong>listar produtos</strong> no menu principal!
					</i>
				</p>
				<img src="img/comida.png" class="img-fluid" alt="imagem">
			</div>
		</div>
		<h3>Atendimento de Ponta</h3>
		<p>Nossos vendedores são treinados para oferecer a melhor
			experiência para você!</p>
		<div class="row">
			<div class="col-md-4">
				<img src="img/vender.png" class="img-fluid" alt="imagem">
			</div>
		</div>
	</div>
	<footer class="pt-4 my-md-5 pt-md-5 border-top">
        <div class="row">
          <div class="col-12 col-md">
            <small class="d-block mb-3 text-muted">Fim por fim feito por mim<br>Todos os direitos reservados &copy; 2019</small>
          </div>
        </div>
      </footer>
</body>
</html>
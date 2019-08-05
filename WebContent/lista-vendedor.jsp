<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"%>
<!DOCTYPE html5>
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Vendedores</title>
		
		<!-- CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
		<link rel="stylesheet" type="text/css" href="css/style-lista.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
		crossorigin="anonymous">
		<link href="https://fonts.googleapis.com/css?family=Abel&display=swap" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	</head>
	<body>
	<a id="botao" href="index.jsp"><i class="fas fa-angle-left"></i></a>
		<div class="container">
			<table class="bordered striped responsive-table">
				<thead class="topico">
					<tr>
						<th>Id</th>
						<th>Nome</th>
						<th colspan ="2">Gerenciar</th>
					</tr>
				</thead>
					<%
					VendedorDao dao = new VendedorDao();
					List<Vendedor> vendedores = dao.getLista();
					for (Vendedor vendedor : vendedores ) {
					%>
			<tbody class="item">
				<tr>
					<td><%=vendedor.getIdVendedor()%></td>
					<td><%=vendedor.getNome()%></td>
					<td><a href="altera-vendedor.jsp?id=<%=vendedor.getIdVendedor()%>"><i class="fas fa-edit"></i>Alterar</a></td>
					<td><a href="remove-vendedor.jsp?id=<%=vendedor.getIdVendedor()%>"><i class="fas fa-trash-alt"></i>Remover</a></td>
				</tr>
			</tbody>
				<%
					}
				%>
			</table>
		</div>	
			<button id="topBtn"><i class="fas fa-arrow-up"></i></button>
			
			<!-- JS -->
			<script type="text/javascript" src="js/script.js"></script>
	</body>
</html>
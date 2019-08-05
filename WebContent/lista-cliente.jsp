<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"
import="java.text.SimpleDateFormat"%>
<!DOCTYPE html5>
<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Clientes</title>
		
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
						<th>CPF</th>
						<th>E-mail</th>
						<th>Nome da Mãe</th>
						<th>Data de Nascimento</th>
						<th>Data de Cadastro</th>
						<th>CEP</th>
						<th>Estado</th>
						<th>Cidade</th>
						<th>Bairro</th>
						<th>Logradouro</th>
						<th>Número</th>
						<th colspan ="2">Gerenciar</th>
					</tr>
				</thead>
					<%
					SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
					ClienteDao dao = new ClienteDao();
					List<Cliente> clientes = dao.getLista();
					for (Cliente cliente : clientes ) {
					%>
			<tbody class="item">
				<tr>
					<td><%=cliente.getIdCliente()%></td>
					<td><%=cliente.getNome()%></td>
					<td><%=cliente.getCpf()%></td>
					<td><%=cliente.getEmail()%></td>
					<td><%=cliente.getNomeMae()%></td>
					<td><%=sdt.format(cliente.getDataNascimento().getTime())%></td>
					<td><%=sdt.format(cliente.getDataCadastro().getTime())%></td>
					<td><%=cliente.getCep()%></td>
					<td><%=cliente.getEstado()%></td>
					<td><%=cliente.getCidade()%></td>
					<td><%=cliente.getBairro()%></td>
					<td><%=cliente.getLogradouro()%></td>
					<td><%=cliente.getNumero()%></td>
					<td><a href="altera-cliente.jsp?id=<%=cliente.getIdCliente()%>"><i class="fas fa-edit"></i>Alterar</a></td>
					<td><a href="remove-cliente.jsp?id=<%=cliente.getIdCliente()%>"><i class="fas fa-trash-alt"></i>Remover</a></td>
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
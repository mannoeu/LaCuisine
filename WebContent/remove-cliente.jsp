<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"%>

<html>
<head>
	<title>Remover</title>
</head>
	<body>
		<% 
		String idString = request.getParameter("id");
		long id = Long.parseLong(idString);
		Cliente cliente = new Cliente();
		cliente.setIdCliente(id);
		ClienteDao dao = new ClienteDao();
		dao.remove(cliente); 
		
		RequestDispatcher rd = request.getRequestDispatcher("/lista-cliente.jsp");
		rd.forward(request,response);
		%>
	</body>
</html>
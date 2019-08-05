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
		Vendedor vendedor = new Vendedor();
		vendedor.setIdVendedor(id);
		VendedorDao dao = new VendedorDao();
		dao.remove(vendedor); 
		
		RequestDispatcher rd = request.getRequestDispatcher("/lista-vendedor.jsp");
		rd.forward(request,response);
		%>
	</body>
</html>
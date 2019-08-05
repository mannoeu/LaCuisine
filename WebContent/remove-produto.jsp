<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"%>

<html>
<head>
	<title>Remover Produto</title>
</head>
	<body>
		<% 
		String idString = request.getParameter("id");
		long id = Long.parseLong(idString);
		Produto produto = new Produto();
		produto.setIdProduto(id);
		ProdutoDao dao = new ProdutoDao();
		dao.remove(produto); 
		
		RequestDispatcher rd = request.getRequestDispatcher("/lista-produto.jsp");
		rd.forward(request,response);
		%>
	</body>
</html>
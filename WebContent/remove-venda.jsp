<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remover</title>
</head>
<body>
		<% 
		String idString = request.getParameter("id");
		long id = Long.parseLong(idString);
		Venda venda = new Venda();
		venda.setIdVenda(id);
		VendaDao dao = new VendaDao();
		dao.remove(venda); 
		
		RequestDispatcher rd = request.getRequestDispatcher("/lista-venda.jsp");
		rd.forward(request,response);
		%>
</body>
</html>
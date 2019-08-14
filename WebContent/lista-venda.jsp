<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"
import="java.text.SimpleDateFormat"%>
<!doctype html>
<html lang="pt-br">
  <head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Venda</title>
    
    <link href="https://fonts.googleapis.com/css?family=Abel&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
	crossorigin="anonymous"> 
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.css" >
    
    <!-- Reescrita CSS -->
    <link rel="stylesheet" type="text/css" href="css/produtos.css">
  </head>
<body>
   <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
      <nav class="my-0 mr-md-auto font-weight-normal">
		<a class="btn btn-outline-primary" href="index.jsp">Início</a>
      </nav>
    </div> 	
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <h1 class="display-4">Venda</h1>
      <p class="lead">Histórico de vendas realizadas</p>
      <p class="lead"><i>Deslize e confira!</i>
      <p class="set"><i class="fas fa-angle-down"></i>
    </div>
    <div class="container">
    <div class="card-deck mb-3 text-center">
    	<%
			SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
			VendaDao dao = new VendaDao();
			List<Venda> vendas = dao.getLista();
			for (Venda venda : vendas ) {
		%>
      <div class="card-deck mb-3 text-center">
        <div class="card mb-4 shadow-sm">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal">Venda Id : <%=venda.getIdVenda()%></h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">Cliente: <%=venda.getIdCliente()%></h1>
            <h1 class="card-title pricing-card-title">Vendedor: <%=venda.getIdVendedor()%></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li id="li-destaque"><strong>Informações dos Produtos</strong></li>
              <%
              	if(venda.getFormaPagamento().equals("cartao")){
              %>	
               <li>Pagamento: <%=venda.getFormaPagamento()%></li>
               <li>Nome do titular: <%=venda.getNomeClienteCartao()%></li>
	           <li>Número do cartão: <%=venda.getCartao()%></li>
	           <li>Data de validade: <%=sdt.format(venda.getDataValidade().getTime())%></li>
	           <li>Número de segurança: <%=venda.getCvvCartao()%></li>
              <% 
              }else	{
              %>
             	<li>Valor pago à vista: <%=venda.getDinheiro()%> R$</li>
              <%
              	}
              %>
	          <li id="li-destaque"><strong>Vendido em</strong></li>
	          	  <li><%=sdt.format(venda.getDataVenda().getTime())%></li>
            </ul>
           <a class="btn btn-lg btn-block btn-outline-primary" href="remove-venda.jsp?id=<%=venda.getIdVenda()%>">Remover</a>
          </div>
        </div>
      </div>
        <%
			}
		%>	
		</div>
      <footer class="pt-4 my-md-5 pt-md-5 border-top">
        <div class="row">
          <div class="col-12 col-md">
            <small class="d-block mb-3 text-muted">Todos os direitos reservados &copy; 2019</small>
          </div>
        </div>
      </footer>
    </div>
  </body>
</html>

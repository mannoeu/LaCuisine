<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"
import="java.text.SimpleDateFormat,
java.text.DecimalFormat"%>
<!doctype html>
<html lang="pt-br">
  <head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Frete</title>
    
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
      <h1 class="display-4">Frete</h1>
      <p class="set"><i class="fas fa-angle-down"></i>
    </div>
    <div class="container">
    <div class="card-deck mb-3 text-center">
    	<%
			ProdutoDao dao = new ProdutoDao();
			DecimalFormat df =  new DecimalFormat("0.00");
			List<Produto> produtos = dao.getListaByVol();
			for (Produto produto : produtos ) {
		%>
      <div class="card-deck mb-3 text-center">
        <div class="card mb-4 shadow-sm">
          <div class="card-header">
            <h4 class="my-0 font-weight-normal"><%=produto.getNome()%></h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title"><%=produto.getPreco()%> R$<small class="text-muted">/und</small></h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li id="li-destaque"><strong>Informações do Produto</strong></li>
              	<li>Id: <%=produto.getIdProduto()%></li>
	            <li>Peso: <%=produto.getPeso()%> Kg</li>
	            <li>Volume do produto: <%=df.format(produto.getVolumeProduto())%> cm³</li>
	            <li>Frete Estimado: <%=df.format(produto.getFrete())%> R$</li>
	            <li>Total: <%=df.format(produto.getValorTotal())%> R$</li>
            </ul>
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

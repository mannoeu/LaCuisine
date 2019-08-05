<!DOCTYPE html5>
<%@ page
	import="java.util.*,
br.com.emmanuel.loja.bd.*,
br.com.emmanuel.loja.modelo.*"
import="java.text.SimpleDateFormat"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cadastrar</title>
	
	<!-- CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="css/venda.css">
	<link href="https://fonts.googleapis.com/css?family=Abel&display=swap" rel="stylesheet">
</head>
<body>
		<%
			Date data = new Date(System.currentTimeMillis());
			SimpleDateFormat sdt = new SimpleDateFormat("dd/MM/yyyy");
		%>
	
	<div class="corpo">
		<a href="index.jsp"><i class="fas fa-angle-left"></i></a>
  	 <div class="container">
  	 <form class="box" action="adicionaVenda" method="post">
			<h1>Clientes</h1>
			<label for="cliente">Selecione um cliente:</label>
       	 	<fieldset>
				<select name="idCliente" id="idCliente" required="true">
				<%
					ClienteDao daoC = new ClienteDao();
					List<Cliente> clientes = daoC.getLista();
					for (Cliente cliente : clientes ) {
				%>
					<option value="<%=cliente.getIdCliente()%>"><%=cliente.getNome()%></option>
			<%
				}
			%>
				</select>
			</fieldset>
			
			<h1>Vendedor</h1>
			<label for="vendedor">Selecione um vendedor:</label>
       	 	<fieldset>
				<select name="idVendedor" id="idVendedor" required="true">
				<%
					VendedorDao daoV = new VendedorDao();
					List<Vendedor> vendedores = daoV.getLista();
					for (Vendedor vendedor : vendedores ) {
				%>
					<option value="<%=vendedor.getIdVendedor()%>"><%=vendedor.getNome()%></option>
			<%
				}
			%>
				</select>
			</fieldset>
			<h1>Produtos</h1>
  	 	<table id="tabelaVenda">
				<tr>
					<th>Produto</th>
					<th>Preço Unitário R$</th>
					<th>Quantidade</th>
					<th>Total R$</th>
				</tr>
  			<%
  				ProdutoDao daoP = new ProdutoDao();
  				Itens itens = new Itens();
				List<Produto> produtos = daoP.getListaOrdenada();
				for (Produto produto : produtos) { 
			%>
			<tbody>
				<tr class="jqry">
					<td><input type="checkbox" id="idProduto" name="idProduto" value="<%=produto.getIdProduto()%>"><%=produto.getNome()%></td>
					<td><input type="text" id="preco" name="preco" value="<%=produto.getPreco()%>" readonly="true"></td>
					<td><input type="number" id="quantidade" name="quantidade" value="0" min="0" onblur="calcular();"></td>
					<td><input type="text" id="valorTotal" name="valorTotal" value="0" readonly="true"></td>
				</tr>
			</tbody>
        	<%
				}
			%>
		</table>
		<label for="totalVenda"><strong>Total da Venda:</strong></label>
		<input type="text" name="totalVenda" value="<%=itens.getValorTotal()%>" placeholder="R$">
			<fieldset>
			<h1>Pagamento</h1>
			<!-- Arrumar -->
					<p><input type="radio" name="formaPagamento" id="formaPagamento" value="dinheiro" checked onclick="document.getElementById('valorDinheiro').disabled = !this.checked; document.getElementById('valorCartao').disabled = this.checked;">Dinheiro</p>
					<input type="text" name="valorDinheiro" id="valorDinheiro" placeholder="R$" value="0" onkeyup="k(this);">
					
					<p><input type="radio" name="formaPagamento" id="formaPagamento" value="cartao" 
					onclick="document.getElementById('valorCartao').disabled = !this.checked;document.getElementById('bandeiraCartao').disabled = !this.checked; document.getElementById('cvvCartao').disabled = !this.checked; document.getElementById('dataValidade').disabled = !this.checked; document.getElementById('nomeClienteCartao').disabled = !this.checked;">Cartão</p>
					<input type="text" name="valorCartao" id="valorCartao" onkeypress="fMasc(this,mCARTAO)" maxlength="19" required disabled="disabled" placeholder="Número do cartão">
					
					<label for="nomeClienteCartao">Nome do Titular</label>
       				<input type="text" name="nomeClienteCartao" id="nomeClienteCartao" placeholder="Nome do titular do cartão" required disabled="disabled">
					
					<label for="bandeiraCartao">Bandeira</label>
         				<select name="bandeiraCartao" id="bandeiraCartao" required disabled="disabled">
				             <option disabled selected>Selecione uma opção...</option>
				             <option value="MasterCard">MasterCard</option>
				             <option value="Visa">VISA</option>
				             <option value="Nubank">Nubank</option>
				             <option value="AmericanExpress">American Express</option>
				             <option value="Elo">Elo</option>
       					</select>
       					
       				<label for="cvvCartao">CVV</label>
       				<input type="text" maxlength="3" name="cvvCartao" id="cvvCartao" placeholder="Código de segurança" required disabled="disabled">
       				
       				<label for="dataValidade">Data de Validade</label>
       				<input type="text" name="dataValidade" id="dataValidade" onkeypress="mascaraData(this, event)" maxlength="10" placeholder="Data de validade" required disabled="disabled">

			</fieldset>
       	 	<fieldset>
       	 	
       	 	<!-- Data atual  -->
				<input style="display:none;" name="dataVenda" type="text" value="<%=sdt.format(data.getTime())%>">
			</fieldset>
			
			<input id="enviar" type="submit" value="Salvar"/>
	</form>
   </div>
  </div>
  
  	<!-- JS -->
	<script>
	function calcular(){
		var precoUnt = parseFloat(document.getElementById('preco').value, 10);
		var qtd = parseInt(document.getElementById('quantidade').value, 10);
		document.getElementById('valorTotal').value = precoUnt * qtd;
	} 
	</script>
</body>
</html>
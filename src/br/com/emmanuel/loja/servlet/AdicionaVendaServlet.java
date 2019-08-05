package br.com.emmanuel.loja.servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.emmanuel.loja.bd.VendaDao;
import br.com.emmanuel.loja.modelo.Itens;
import br.com.emmanuel.loja.modelo.Venda;
/**
 * Data Acess Object AdicionaVendaServlet
 * @author Emmanuel Messias da Silva Costa
 */
@WebServlet("/adicionaVenda")
public class AdicionaVendaServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		
		String idCliente = request.getParameter("idCliente");
		String idVendedor = request.getParameter("idVendedor");
		String idProduto = request.getParameter("idProduto");
		String quantidade = request.getParameter("quantidade");
		String formaPagamento = request.getParameter("formaPagamento");	
		String valorTotal = request.getParameter("valorTotal");
		String preco = request.getParameter("preco");
		String cartaoString = request.getParameter("valorCartao");
		String cvvCartaoString = request.getParameter("cvvCartao");
		String bandeiraCartaoString = request.getParameter("bandeiraCartao");
		String dinheiroString = request.getParameter("valorDinheiro");
		String nomeClienteCartaoString = request.getParameter("nomeClienteCartao");
		
		Calendar dataValidade = null;
		Calendar dataVenda = null;
		
		Date date = new Date(System.currentTimeMillis());
		dataVenda = Calendar.getInstance();
		dataVenda.setTime(date);
		
		Date date2 = new Date(System.currentTimeMillis());
		dataValidade = Calendar.getInstance();
		dataValidade.setTime(date2);
		
		// parâmetros p/ verificação
		
		String valorCartao = "";
		String bandeiraCartao = "";
		String nomeClienteCartao = "";
		
		int cvvCartao = 0;
		float valorDinheiro = 0;
		
		// verificando
		if(dinheiroString!=null){
			valorDinheiro = Float.parseFloat(dinheiroString);
		}else{
			valorDinheiro = 0;
		}
		
		if(cartaoString!=null){
			valorCartao = cartaoString;
		}else{
			valorCartao = "-";
		}
		
		if(cvvCartaoString!=null){
			cvvCartao = Integer.parseInt(cvvCartaoString);
		}else{
			cvvCartao = 0;
		}
		
		if(bandeiraCartaoString!=null){
			bandeiraCartao = bandeiraCartaoString;
		}else{
			bandeiraCartao = "-";
		}
		
		if(nomeClienteCartao!=null){
			nomeClienteCartao = nomeClienteCartaoString;
		}else{
			nomeClienteCartao = "-";
		}
		
		Venda vendaProduto = new Venda();
		
		vendaProduto.setIdCliente(Long.parseLong(idCliente));
		vendaProduto.setIdVendedor(Long.parseLong(idVendedor));
		vendaProduto.setFormaPagamento(formaPagamento);
		vendaProduto.setCvvCartao(cvvCartao);
		vendaProduto.setCartao(valorCartao);
		vendaProduto.setDinheiro(valorDinheiro);
		vendaProduto.setDataVenda(dataVenda);
		vendaProduto.setBandeiraCartao(bandeiraCartao);
		vendaProduto.setDataValidade(dataValidade);
		vendaProduto.setNomeClienteCartao(nomeClienteCartao);

		VendaDao dao = new VendaDao();
		dao.adicionaProduto(vendaProduto);

		Itens vendaItens = new Itens();
		vendaItens.setIdVenda((vendaProduto.getIdVenda()));
		vendaItens.setIdProduto(Long.parseLong(idProduto));
		vendaItens.setQuantidade(Integer.parseInt(quantidade));
		vendaItens.setValorTotal(Double.parseDouble(valorTotal));
		vendaItens.setPreco(Double.parseDouble(preco));
		
		dao.adicionaItens(vendaItens);

		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request,response);
	}
}
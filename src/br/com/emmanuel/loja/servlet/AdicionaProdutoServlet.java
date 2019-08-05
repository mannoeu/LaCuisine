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

import br.com.emmanuel.loja.bd.ProdutoDao;
import br.com.emmanuel.loja.modelo.Produto;
/**
 * Data Acess Object AdicionaProdutoServlet
 * @author Emmanuel Messias da Silva Costa
 */
@WebServlet("/adicionaProduto")
public class AdicionaProdutoServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		String nome = request.getParameter("nome");
		String tipo = request.getParameter("tipo");
		String preco = request.getParameter("preco");
		String peso = request.getParameter("peso");
		String altura = request.getParameter("altura");
		String largura = request.getParameter("largura");
		String comprimento = request.getParameter("comprimento");
		String alturaEmbalagem = request.getParameter("alturaEmbalagem");
		String larguraEmbalagem = request.getParameter("larguraEmbalagem");
		String comprimentoEmbalagem = request.getParameter("comprimentoEmbalagem");
		Calendar dataCadastro = null;			
		Date date = new Date(System.currentTimeMillis());
		dataCadastro = Calendar.getInstance();
		dataCadastro.setTime(date);

		Produto produto = new Produto();
		
		produto.setNome(nome);
		produto.setTipo(tipo);
		produto.setPreco(Double.parseDouble(preco));
		produto.setPeso(Float.parseFloat(peso));
		produto.setAltura(Float.parseFloat(altura));
		produto.setLargura(Float.parseFloat(largura));
		produto.setComprimento(Float.parseFloat(comprimento));
		produto.setAlturaEmbalagem(Float.parseFloat(alturaEmbalagem));
		produto.setLarguraEmbalagem(Float.parseFloat(larguraEmbalagem));
		produto.setComprimentoEmbalagem(Float.parseFloat(comprimentoEmbalagem));
		produto.setDataCadastro(dataCadastro);

		ProdutoDao dao = new ProdutoDao();
		dao.adiciona(produto);

		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request,response);
	}
}
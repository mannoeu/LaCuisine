package br.com.emmanuel.loja.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.emmanuel.loja.bd.VendedorDao;
import br.com.emmanuel.loja.modelo.Vendedor;
/**
 * Data Acess Object AdicionaVendedorServlet
 * @author Emmanuel Messias da Silva Costa
 */
@WebServlet("/adicionaVendedor")
public class AdicionaVendedorServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		String nome = request.getParameter("nome");

		Vendedor vendedor = new Vendedor();
		
		vendedor.setNome(nome);

		VendedorDao dao = new VendedorDao();
		dao.adiciona(vendedor);

		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request,response);
	}
}
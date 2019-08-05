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
 * Data Acess Object AlteraVendedorServlet
 * @author Emmanuel Messias da Silva Costa
 */
@WebServlet("/alteraVendedor")
public class AlteraVendedorServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		String idVendedor = request.getParameter("idVendedor");
		String nome = request.getParameter("nome");

		Vendedor vendedor = new Vendedor();
		vendedor.setIdVendedor(Long.parseLong(idVendedor));
		vendedor.setNome(nome);

		VendedorDao dao = new VendedorDao();
		dao.altera(vendedor);

		RequestDispatcher rd = request.getRequestDispatcher("/lista-vendedor.jsp");
		rd.forward(request, response);
	}
}
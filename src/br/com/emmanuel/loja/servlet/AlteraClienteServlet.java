package br.com.emmanuel.loja.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.emmanuel.loja.bd.ClienteDao;
import br.com.emmanuel.loja.modelo.Cliente;
/**
 * Data Acess Object AlteraClienteServlet
 * @author Emmanuel Messias da Silva Costa
 */
@WebServlet("/alteraCliente")
public class AlteraClienteServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();

		String idCliente = request.getParameter("idCliente");
		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String email = request.getParameter("email");
		String nomeMae = request.getParameter("nomeMae");
		Calendar dataNascimento = null;
		String dataEmTexto = request.getParameter("dataNascimento");
		Calendar dataCadastro = null;
		String dataEmTexto2 = request.getParameter("dataCadastro");
		String cep = request.getParameter("cep");
		String estado = request.getParameter("estado");
		String cidade = request.getParameter("cidade");
		String bairro = request.getParameter("bairro");
		String logradouro = request.getParameter("logradouro");
		String numero = request.getParameter("numero");

		try {
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
			dataNascimento = Calendar.getInstance();
			dataNascimento.setTime(date);
			
			Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto2);
			dataCadastro = Calendar.getInstance();
			dataCadastro.setTime(date2);
		} catch (ParseException e) {
			out.println("Erro de conversão da data");
			return;
		}
		Cliente cliente = new Cliente();
		cliente.setIdCliente(Long.parseLong(idCliente));
		cliente.setNome(nome);
		cliente.setCpf(cpf);
		cliente.setEmail(email);
		cliente.setNomeMae(nomeMae);
		cliente.setDataNascimento(dataNascimento);
		cliente.setDataCadastro(dataCadastro);
		cliente.setCep(cep);
		cliente.setEstado(estado);
		cliente.setCidade(cidade);
		cliente.setBairro(bairro);
		cliente.setLogradouro(logradouro);
		cliente.setNumero(numero);

		ClienteDao dao = new ClienteDao();
		dao.altera(cliente);

		RequestDispatcher rd = request.getRequestDispatcher("/lista-cliente.jsp");
		rd.forward(request, response);
	}
}
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
 * Data Acess Object AdicionaClienteServlet
 * @author Emmanuel Messias da Silva Costa
 */
@WebServlet("/adicionaCliente")
public class AdicionaClienteServlet extends HttpServlet {
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		PrintWriter out = response.getWriter();

		String nome = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String email = request.getParameter("email");
		String nomeMae = request.getParameter("nomeMae");
		Calendar dataNascimento = null;
		Calendar dataCadastro = null;
		String cep = request.getParameter("cep");
		String estado = request.getParameter("estado");
		String cidade = request.getParameter("cidade");
		String bairro = request.getParameter("bairro");
		String logradouro = request.getParameter("logradouro");
		String numero = request.getParameter("numero");
		
		String dataEmTexto = request.getParameter("dataNascimento");
		
		try {
			Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
			dataNascimento = Calendar.getInstance();
			dataNascimento.setTime(date);
			
			Date date2 = new Date(System.currentTimeMillis());
			dataCadastro = Calendar.getInstance();
			dataCadastro.setTime(date2);
		} catch (ParseException e) {
			out.println("Erro de conversão da data");
			return;
		}
		Cliente cliente = new Cliente();
		
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
		dao.adiciona(cliente);
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		rd.forward(request,response);
	}
}
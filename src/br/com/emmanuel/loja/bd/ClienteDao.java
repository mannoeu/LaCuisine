package br.com.emmanuel.loja.bd;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.emmanuel.loja.modelo.Cliente;

/**
 * Data Acess Object Cliente
 * 
 * @author Emmanuel Messias da Silva Costa
 */
public class ClienteDao {
	private Connection con;

	/**
	 * Construtor da classe Cliente que cria uma nova conexão com o banco de
	 * dados
	 */

	public ClienteDao() {
		this.con = new ConnectionFactory().getConnection();
	}

	/**
	 * Método do Data Acess Object da classe Cliente Não há retorno.
	 * 
	 * @param cliente
	 *            com os campos preenchidos
	 * @see Cliente
	 */
	public void adiciona(Cliente cliente) {
		String sql = "insert into clientes "
				+ "(nome,cpf,email,nomeMae,dataNascimento,dataCadastro,cep,estado,"
				+ "cidade,bairro,logradouro,numero)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);

			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getCpf());
			stmt.setString(3, cliente.getEmail());
			stmt.setString(4, cliente.getNomeMae());
			stmt.setDate(5, new Date(cliente.getDataNascimento()
					.getTimeInMillis()));
			stmt.setDate(6, new Date(cliente.getDataCadastro()
					.getTimeInMillis()));
			stmt.setString(7, cliente.getCep());
			stmt.setString(8, cliente.getEstado());
			stmt.setString(9, cliente.getCidade());
			stmt.setString(10, cliente.getBairro());
			stmt.setString(11, cliente.getLogradouro());
			stmt.setString(12, cliente.getNumero());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Método do Data Acess Object da classe Cliente Não há parâmetros.
	 * 
	 * @return Lista de clientes
	 * @see Cliente
	 */
	public List<Cliente> getLista() {
		try {
			List<Cliente> clientes = new ArrayList<Cliente>();
			PreparedStatement stmt = this.con
					.prepareStatement("select * from clientes");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Cliente cliente = new Cliente();

				cliente.setNome(rs.getString("nome"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setEmail(rs.getString("email"));
				cliente.setNomeMae(rs.getString("nomeMae"));

				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("dataNascimento"));
				cliente.setDataNascimento(data);

				Calendar data2 = Calendar.getInstance();
				data2.setTime(rs.getDate("dataCadastro"));
				cliente.setDataCadastro(data2);

				cliente.setCep(rs.getString("cep"));
				cliente.setEstado(rs.getString("estado"));
				cliente.setCidade(rs.getString("cidade"));
				cliente.setBairro(rs.getString("bairro"));
				cliente.setLogradouro(rs.getString("logradouro"));
				cliente.setNumero(rs.getString("numero"));
				cliente.setIdCliente(rs.getLong("idCliente"));

				clientes.add(cliente);
			}
			rs.close();
			stmt.close();
			return clientes;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Método do Data Acess Object da classe Cliente Não há parâmetros.
	 * 
	 * @return Lista os novos clientes
	 * @param dia, mes e ano preenchidos.
	 * @see Cliente
	 */
	public List<Cliente> getListaNovosClientes(int dia, int mes, int ano) {
		try {
			List<Cliente> clientes = new ArrayList<Cliente>();
			// prepared statement para busca.
			PreparedStatement stmt = this.con.prepareStatement("SELECT idCliente, nome, dataNascimento, dataCadastro " +
					"FROM clientes " +
					"WHERE DAY(dataCadastro)=? AND MONTH(dataCadastro)=? AND YEAR(dataCadastro)=?");
			stmt.setInt(1, dia);
			stmt.setInt(2, mes);
			stmt.setInt(3, ano);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Cliente cliente = new Cliente();
				cliente.setNome(rs.getString("nome"));
				
				Calendar dataNascimento = Calendar.getInstance();
				dataNascimento.setTime(rs.getDate("dataNascimento"));
				cliente.setDataNascimento(dataNascimento);
				
				Calendar dataCadastro = Calendar.getInstance();
				dataCadastro.setTime(rs.getDate("dataCadastro"));
				cliente.setDataCadastro(dataCadastro);
				cliente.setIdCliente(rs.getLong("idCliente"));
				clientes.add(cliente);
			}
			rs.close();
			stmt.close();
			return clientes;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Cliente Não há retorno.
	 * 
	 * @param cliente
	 *            com ID informado.
	 * @see Cliente
	 */
	public void remove(Cliente cliente) {
		try {
			PreparedStatement stmt = con
					.prepareStatement("delete from clientes where idCliente=?");
			stmt.setLong(1, cliente.getIdCliente());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Método do Data Acess Object da classe Cliente
	 * 
	 * @param Um
	 *            id String e um id do cliente para identificação
	 * @return Um cliente com campos preenchidos
	 */
	public Cliente getClienteById(String id) {
		Cliente cliente = new Cliente();

		try {
			PreparedStatement stmt = this.con
					.prepareStatement("SELECT * FROM clientes WHERE idCliente=?");
			stmt.setLong(1, Long.parseLong(id));
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				cliente.setIdCliente(rs.getLong("idCliente"));
				cliente.setNome(rs.getString("nome"));
				cliente.setCpf(rs.getString("cpf"));
				cliente.setEmail(rs.getString("email"));
				cliente.setNomeMae(rs.getString("nomeMae"));

				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("dataNascimento"));
				cliente.setDataNascimento(data);

				Calendar data2 = Calendar.getInstance();
				data2.setTime(rs.getDate("dataCadastro"));
				cliente.setDataCadastro(data2);

				cliente.setCep(rs.getString("cep"));
				cliente.setEstado(rs.getString("estado"));
				cliente.setCidade(rs.getString("cidade"));
				cliente.setBairro(rs.getString("bairro"));
				cliente.setLogradouro(rs.getString("logradouro"));
				cliente.setNumero(rs.getString("numero"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return cliente;
	}

	/**
	 * Método do Data Acess Object da classe Cliente Não há retorno.
	 * 
	 * @param cliente
	 *            com os campos preenchidos
	 * @see Cliente
	 */
	public void altera(Cliente cliente) {
		String sql = "update clientes set nome=?, cpf=?, email=?, nomeMae=?,"
				+ "dataNascimento=?,dataCadastro=?,cep=?,estado=?, cidade=?, bairro=?, logradouro=?, "
				+ "numero=? where idCliente=?";
		try {

			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getCpf());
			stmt.setString(3, cliente.getEmail());
			stmt.setString(4, cliente.getNomeMae());
			stmt.setDate(5, new Date(cliente.getDataNascimento()
					.getTimeInMillis()));
			stmt.setDate(6, new Date(cliente.getDataCadastro()
					.getTimeInMillis()));
			stmt.setString(7, cliente.getCep());
			stmt.setString(8, cliente.getEstado());
			stmt.setString(9, cliente.getCidade());
			stmt.setString(10, cliente.getBairro());
			stmt.setString(11, cliente.getLogradouro());
			stmt.setString(12, cliente.getNumero());
			stmt.setLong(13, cliente.getIdCliente());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

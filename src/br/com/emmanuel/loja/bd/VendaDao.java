package br.com.emmanuel.loja.bd;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.emmanuel.loja.modelo.Itens;
import br.com.emmanuel.loja.modelo.Venda;

/**
 * Data Acess Object Venda
 * 
 * @author Emmanuel Messias da Silva Costa
 */
public class VendaDao {

	private Connection connection;

	/**
	 * Construtor da classe Venda que cria uma nova conexão com o banco de dados
	 */
	public VendaDao() {
		this.connection = new ConnectionFactory().getConnection();
	}

	/**
	 * Método do Data Acess Object da classe Venda Não há retorno.
	 * 
	 * @param venda
	 *            com os campos preenchidos
	 * @see Venda
	 */
	public void adicionaProduto(Venda venda) {
		String sql = "INSERT INTO venda"
				+ "(idCliente, idVendedor, formaPagamento, "
				+ "dataVenda, cartao, dinheiro, bandeiraCartao, cvvCartao, dataValidade, nomeClienteCartao)"
				+ " VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setLong(1, venda.getIdCliente());
			stmt.setLong(2, venda.getIdVendedor());
			stmt.setString(3, venda.getFormaPagamento());
			stmt.setDate(4, new Date(venda.getDataVenda().getTimeInMillis()));
			stmt.setString(5, venda.getCartao());
			stmt.setFloat(6, venda.getDinheiro());
			stmt.setString(7, venda.getBandeiraCartao());
			stmt.setInt(8, venda.getCvvCartao());
			stmt.setDate(9, new Date(venda.getDataValidade().getTimeInMillis()));
			stmt.setString(10, venda.getNomeClienteCartao());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Método do Data Acess Object da classe Itens Não há retorno.
	 * 
	 * @param itens
	 *            da venda com os campos preenchidos
	 * @see Itens
	 */
	public void adicionaItens(Itens itens) {
		String sql = "INSERT INTO itens "
				+ "(pro_id,pro_quantidade,pro_preco,preco_total)"
				+ " VALUES (?,?,?,?)";

		try {
			PreparedStatement stmt = connection.prepareStatement(sql);

			stmt.setLong(1, itens.getIdProduto());
			stmt.setInt(2, itens.getQuantidade());
			stmt.setDouble(3, itens.getPreco());
			stmt.setDouble(4, itens.getValorTotal());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Método do Data Acess Object da classe Venda Não há parâmetros.
	 * @return Lista de venda
	 * @see Venda
	 */
	public List<Venda> getLista() {
		try {
			List<Venda> vendas = new ArrayList<Venda>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from venda"); // inner join
																// itens
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Venda venda = new Venda();

				venda.setIdVenda(rs.getLong("idVenda"));
				venda.setIdCliente(rs.getLong("idCliente"));
				venda.setIdVendedor(rs.getLong("idVendedor"));
				venda.setFormaPagamento(rs.getString("formaPagamento"));

				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("dataVenda"));
				venda.setDataVenda(data);

				Calendar data2 = Calendar.getInstance();
				data2.setTime(rs.getDate("dataValidade"));
				venda.setDataValidade(data2);

				venda.setCartao(rs.getString("cartao"));
				venda.setBandeiraCartao(rs.getString("bandeiraCartao"));
				venda.setCvvCartao(rs.getInt("cvvCartao"));
				venda.setDinheiro(rs.getFloat("dinheiro"));
				venda.setNomeClienteCartao(rs.getString("nomeClienteCartao"));

				// itens ?

				// add a lista
				vendas.add(venda);
			}
			rs.close();
			stmt.close();
			return vendas;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * Método do Data Acess Object da classe Venda
	 * 
	 * @param Um
	 *            id String e um id do venda para identificação
	 * @return Um venda com campos preenchidos
	 */
	public Venda getVendaById(String id) {
		Venda venda = new Venda();

		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM venda WHERE idVenda=?");
			stmt.setLong(1, Long.parseLong(id));
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				venda.setIdVenda(rs.getLong("idVenda"));
				venda.setIdCliente(rs.getLong("idCliente"));
				venda.setIdVendedor(rs.getLong("idVendedor"));
				venda.setFormaPagamento(rs.getString("formaPagamento"));

				Calendar data = Calendar.getInstance();
				data.setTime(rs.getDate("dataVenda"));
				venda.setDataVenda(data);

				Calendar data2 = Calendar.getInstance();
				data2.setTime(rs.getDate("dataValidade"));
				venda.setDataValidade(data2);

				venda.setCartao(rs.getString("cartao"));
				venda.setBandeiraCartao(rs.getString("bandeiraCartao"));
				venda.setCvvCartao(rs.getInt("cvvCartao"));
				venda.setDinheiro(rs.getFloat("dinheiro"));
				venda.setNomeClienteCartao(rs.getString("nomeClienteCartao"));
			}
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return venda;
	}

	/**
	 * Método do Data Acess Object da classe Venda Não há retorno.
	 * @param venda	com ID informado.
	 * @see Venda
	 */
	public void remove(Venda venda) {
		try {
			PreparedStatement stmt = connection
					.prepareStatement("DELETE FROM venda WHERE idVenda=?");

			stmt.setLong(1, venda.getIdVenda());

			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	} // criar triggers no banco p/ ON DELETE em Venda
	/**
	 * Método do Data Acess Object da classe Venda Não há parâmetros.
	 * @param mes
	 * @return Lista do faturamento em cada mês.
	 * @see Venda
	 */
	public List<Venda> faturamentoMensal(int mes) {
		List<Venda> vendas = new ArrayList<Venda>();
		try {
			PreparedStatement stmt = this.connection
					.prepareStatement("SELECT * FROM venda WHERE MONTH(dataVenda)=?");
			stmt.setInt(1, mes);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Venda venda = new Venda();
				venda.setIdVenda(rs.getLong("idVenda"));
				venda.setFormaPagamento(rs.getString("formaPagamento"));
				venda.setIdCliente(rs.getLong("idCliente"));
				venda.setIdVendedor(rs.getLong("idVendedor"));
				venda.setCartao(rs.getString("cartao"));
				venda.setDinheiro(rs.getFloat("dinheiro"));
				venda.setBandeiraCartao(rs.getString("bandeiraCartao"));
				venda.setCvvCartao(rs.getInt("cvvCartao"));
				
				Calendar dataValidade = Calendar.getInstance();
				dataValidade.setTime(rs.getDate("dataValidade"));
				venda.setDataValidade(dataValidade);
				
				venda.setNomeClienteCartao(rs.getString("nomeClienteCartao"));
				
				vendas.add(venda);
			}

			rs.close();
			stmt.close();
			return vendas;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
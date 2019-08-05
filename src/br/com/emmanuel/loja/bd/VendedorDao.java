package br.com.emmanuel.loja.bd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.emmanuel.loja.modelo.Vendedor;
/**
 * Data Acess Object Vendedor
 * @author Emmanuel Messias da Silva Costa
 */
public class VendedorDao {
	private Connection con;
	/**
	 * Construtor da classe Vendedor que cria uma nova conexão com o banco de dados
	 */
	public VendedorDao() {
		this.con = new ConnectionFactory().getConnection();
	}
	/**
	 * Método do Data Acess Object da classe Vendedor
	 * Não há retorno.
	 * @param vendedor com os campos preenchidos
	 * @see Vendedor
	 */
	public void adiciona(Vendedor vendedor) {
		String sql = "insert into vendedores (nome)" + " values (?)";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, vendedor.getNome());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Vendedor
	 * Não há parâmetros.
	 * @return Lista de vendedores
	 * @see Vendedor
	 */
	public List<Vendedor> getLista() {
		try {
		List<Vendedor> vendedores = new ArrayList<Vendedor>();
		PreparedStatement stmt = this.con.prepareStatement("select * from vendedores");
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
		Vendedor vendedor = new Vendedor();
		
		vendedor.setNome(rs.getString("nome"));
		vendedor.setIdVendedor(rs.getLong("idVendedor"));
		vendedores.add(vendedor);
		}
		rs.close();
		stmt.close();
			return vendedores;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Vendedor
	 * Não há retorno.
	 * @param vendedor com ID informado.
	 * @see Vendedor
	 */
	public void remove(Vendedor vendedor) {
		try {
		PreparedStatement stmt = con.prepareStatement("delete from vendedores where idVendedor=?");
		stmt.setLong(1, vendedor.getIdVendedor());
		stmt.execute();
		stmt.close();
		} catch (SQLException e) {
		throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Vendedor
	 * @param Um id String e um id do vendedor para identificação
	 * @return Um vendedor com campos preenchidos
	 */
	public Vendedor getVendedorById(String id){
		Vendedor vendedor = new Vendedor();
        
        try {
            PreparedStatement stmt = this.con.prepareStatement("SELECT * FROM vendedores WHERE idVendedor=?");
            stmt.setLong(1, Long.parseLong(id));
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	vendedor.setIdVendedor(rs.getLong("idVendedor"));
        		vendedor.setNome(rs.getString("nome"));
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vendedor;
    }
	/**
	 * Método do Data Acess Object da classe Vendedor
	 * Não há retorno.
	 * @param vendedor com os campos preenchidos
	 * @see Vendedor
	 */
	public void altera(Vendedor vendedor) {
		String sql = "update vendedores set nome=? where idVendedor=?";
		try {
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, vendedor.getNome());
			stmt.setLong(2, vendedor.getIdVendedor());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

package br.com.emmanuel.loja.bd;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.emmanuel.loja.modelo.Produto;
/**
 * Data Acess Object Produto
 * @author Emmanuel Messias da Silva Costa
 */
public class ProdutoDao {
	private Connection con;
	/**
	 * Construtor da classe Produto que cria uma nova conexão com o banco de dados
	 */
	public ProdutoDao() {
		this.con = new ConnectionFactory().getConnection();
	}
	/**
	 * Método do Data Acess Object da classe Produto
	 * Não há retorno.
	 * @param produto com os campos preenchidos
	 * @see Produto
	 */
	public void adiciona(Produto produto) {
		String sql = "insert into produtos "
				+ "(nome,tipo,preco,peso,altura,largura,comprimento,alturaEmbalagem,larguraEmbalagem," +
				"comprimentoEmbalagem,dataCadastro)" + " values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setString(1, produto.getNome());
			stmt.setString(2, produto.getTipo());
			stmt.setDouble(3, produto.getPreco());
			stmt.setFloat(4, produto.getPeso());
			stmt.setFloat(5, produto.getAltura());
			stmt.setFloat(6, produto.getLargura());
			stmt.setFloat(7, produto.getComprimento());
			stmt.setFloat(8, produto.getAlturaEmbalagem());
			stmt.setFloat(9, produto.getLarguraEmbalagem());
			stmt.setFloat(10, produto.getComprimentoEmbalagem());
			stmt.setDate(11, new Date(produto.getDataCadastro().getTimeInMillis()));
	
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Produto
	 * Não há parâmetros.
	 * @return Lista de produtos
	 * @see Produto
	 */
	public List<Produto> getLista() {
		try {
		List<Produto> produtos = new ArrayList<Produto>();
		PreparedStatement stmt = this.con.prepareStatement("select * from produtos");
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
		Produto produto = new Produto();
		
		produto.setNome(rs.getString("nome"));
		produto.setTipo(rs.getString("tipo"));
		produto.setPreco(rs.getDouble("preco"));
		produto.setPeso(rs.getFloat("peso"));
		produto.setAltura(rs.getFloat("altura"));
		produto.setLargura(rs.getFloat("largura"));
		produto.setComprimento(rs.getFloat("comprimento"));
		produto.setAlturaEmbalagem(rs.getFloat("alturaEmbalagem"));
		produto.setLarguraEmbalagem(rs.getFloat("larguraEmbalagem"));
		produto.setComprimentoEmbalagem(rs.getFloat("comprimentoEmbalagem"));
		Calendar data = Calendar.getInstance();
		data.setTime(rs.getDate("dataCadastro"));
		produto.setDataCadastro(data);
		produto.setIdProduto(rs.getLong("idProduto"));
		
		produtos.add(produto);
		}
		rs.close();
		stmt.close();
			return produtos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Produto
	 * Não há parâmetros.
	 * @return Lista de produtos ordenados alfabeticamente
	 * @see Produto
	 */
	public List<Produto> getListaOrdenada() {
		try {
		List<Produto> produtos = new ArrayList<Produto>();
		PreparedStatement stmt = this.con.prepareStatement("select * from produtos order by nome");
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
		Produto produto = new Produto();
		
		produto.setNome(rs.getString("nome"));
		produto.setTipo(rs.getString("tipo"));
		produto.setPreco(rs.getDouble("preco"));
		produto.setPeso(rs.getFloat("peso"));
		produto.setAltura(rs.getFloat("altura"));
		produto.setLargura(rs.getFloat("largura"));
		produto.setComprimento(rs.getFloat("comprimento"));
		produto.setAlturaEmbalagem(rs.getFloat("alturaEmbalagem"));
		produto.setLarguraEmbalagem(rs.getFloat("larguraEmbalagem"));
		produto.setComprimentoEmbalagem(rs.getFloat("comprimentoEmbalagem"));
		Calendar data = Calendar.getInstance();
		data.setTime(rs.getDate("dataCadastro"));
		produto.setDataCadastro(data);
		produto.setIdProduto(rs.getLong("idProduto"));
		
		produtos.add(produto);
		}
		rs.close();
		stmt.close();
			return produtos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Produto
	 * Não há parâmetros.
	 * @return Lista de produtos ordenados pelo volume da embalagem
	 * @see Produto
	 */
	public List<Produto> getListaByVol() {
		try {
		List<Produto> produtos = new ArrayList<Produto>();
		PreparedStatement stmt = this.con.prepareStatement("select idProduto,nome,preco,peso," +
				"altura,largura,comprimento,alturaEmbalagem,larguraEmbalagem,comprimentoEmbalagem" +
				" from produtos order by " +
				"alturaEmbalagem*comprimentoEmbalagem*larguraEmbalagem desc");
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
		Produto produto = new Produto();
		
		produto.setIdProduto(rs.getLong("idProduto"));
		produto.setNome(rs.getString("nome"));
		produto.setPreco(rs.getDouble("preco"));
		produto.setPeso(rs.getFloat("peso"));
		produto.setAltura(rs.getFloat("altura"));
		produto.setLargura(rs.getFloat("largura"));
		produto.setComprimento(rs.getFloat("comprimento"));
		produto.setAlturaEmbalagem(rs.getFloat("alturaEmbalagem"));
		produto.setLarguraEmbalagem(rs.getFloat("larguraEmbalagem"));
		produto.setComprimentoEmbalagem(rs.getFloat("comprimentoEmbalagem"));
		
		produtos.add(produto);
		}
		rs.close();
		stmt.close();
			return produtos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Produto
	 * Não há parâmetros.
	 * @return Lista dos 5 novos produtos cadastrados na loja
	 * @see Produto
	 */
	public List<Produto> getListaByData() {
		try {
		List<Produto> produtos = new ArrayList<Produto>();
		PreparedStatement stmt = this.con.prepareStatement("select idProduto,nome,preco from produtos " +
				"order by idProduto desc");
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
		Produto produto = new Produto();
		
		produto.setIdProduto(rs.getLong("idProduto"));
		produto.setNome(rs.getString("nome"));
		produto.setPreco(rs.getDouble("preco"));
		
		produtos.add(produto);
		}
		rs.close();
		stmt.close();
			return produtos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Produto
	 * Não há retorno.
	 * @param produto com ID informado.
	 * @see Produto
	 */
	public void remove(Produto produto) {
		try {
		PreparedStatement stmt = con.prepareStatement("delete from produtos where idProduto=?");
		stmt.setLong(1, produto.getIdProduto());
		stmt.execute();
		stmt.close();
		} catch (SQLException e) {
		throw new RuntimeException(e);
		}
	}
	/**
	 * Método do Data Acess Object da classe Produto
	 * @param Um id String e um id do produto para identificação
	 * @return Um produto com campos preenchidos
	 */
	public Produto getProdutoById(String id){
		Produto produto = new Produto();
        
        try {
            PreparedStatement stmt = this.con.prepareStatement("SELECT * FROM produtos WHERE idProduto=?");
            stmt.setLong(1, Long.parseLong(id));
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
            	produto.setIdProduto(rs.getLong("idProduto"));
        		produto.setNome(rs.getString("nome"));
        		produto.setTipo(rs.getString("tipo"));
        		produto.setPreco(rs.getDouble("preco"));
        		produto.setPeso(rs.getFloat("peso"));
        		produto.setAltura(rs.getFloat("altura"));
        		produto.setLargura(rs.getFloat("largura"));
        		produto.setComprimento(rs.getFloat("comprimento"));
        		produto.setAlturaEmbalagem(rs.getFloat("alturaEmbalagem"));
        		produto.setLarguraEmbalagem(rs.getFloat("larguraEmbalagem"));
        		produto.setComprimentoEmbalagem(rs.getFloat("comprimentoEmbalagem"));
        		Calendar data = Calendar.getInstance();
        		data.setTime(rs.getDate("dataCadastro"));
        		produto.setDataCadastro(data);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return produto;
    }
	/**
	 * Método do Data Acess Object da classe Produto
	 * Não há retorno.
	 * @param produto com os campos preenchidos
	 * @see Produto
	 */
	public void altera(Produto produto) {
		String sql = "update produtos set nome=?,tipo=?,preco=?,peso=?,altura=?,largura=?," +
				"comprimento=?,alturaEmbalagem=?,larguraEmbalagem=?," +
				"comprimentoEmbalagem=?,dataCadastro=? where idProduto=?";
		try {
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, produto.getNome());
			stmt.setString(2, produto.getTipo());
			stmt.setDouble(3, produto.getPreco());
			stmt.setFloat(4, produto.getPeso());
			stmt.setFloat(5, produto.getAltura());
			stmt.setFloat(6, produto.getLargura());
			stmt.setFloat(7, produto.getComprimento());
			stmt.setFloat(8, produto.getAlturaEmbalagem());
			stmt.setFloat(9, produto.getLarguraEmbalagem());
			stmt.setFloat(10, produto.getComprimentoEmbalagem());
			stmt.setDate(11, new Date(produto.getDataCadastro().getTimeInMillis()));
			stmt.setLong(12, produto.getIdProduto());
			
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}

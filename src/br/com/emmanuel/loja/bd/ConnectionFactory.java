package br.com.emmanuel.loja.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 * Data Acess Object ConnectionFactory
 * @author Emmanuel Messias da Silva Costa
 */
public class ConnectionFactory {
	/**
	 * Método getConnection da classe ConnectionFactory
	 * @return Uma conexão para o banco de dados.
	 */
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/lacuisine", "root", "");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
}
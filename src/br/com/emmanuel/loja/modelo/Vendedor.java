package br.com.emmanuel.loja.modelo;
/**
 * Data Acess Object Vendedor
 * @author Emmanuel Messias da Silva Costa
 */
public class Vendedor {
	private Long idVendedor;
	private String nome;

	public Long getIdVendedor() {
		return idVendedor;
	}

	public void setIdVendedor(Long idVendedor) {
		this.idVendedor = idVendedor;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}

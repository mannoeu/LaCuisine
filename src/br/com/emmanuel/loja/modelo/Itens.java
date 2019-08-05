package br.com.emmanuel.loja.modelo;
/**
 * Data Acess Object Itens
 * @author Emmanuel Messias da Silva Costa
 */
public class Itens {
	private Long idProduto;
	private int quantidade;
	private double valorTotal;
	private double preco;
	private Long idVenda;

	public Long getIdVenda() {
		return idVenda;
	}

	public void setIdVenda(Long idVenda) {
		this.idVenda = idVenda;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}

	public Long getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Long idProduto) {
		this.idProduto = idProduto;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
/**
 * Método da classe Itens
 * Cálcula a variável valorTotal usando o preço e quantidade preenchidos
 * @return valorTotal
 * @see Produto
 */
	public double getValorTotal() {
		valorTotal = preco * quantidade;
		return valorTotal;
	}

	public void setValorTotal(double valorTotal) {
		this.valorTotal = valorTotal;
	}

}

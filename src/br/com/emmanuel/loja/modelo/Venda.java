package br.com.emmanuel.loja.modelo;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Data Acess Object Venda
 * 
 * @author Emmanuel Messias da Silva Costa
 */
public class Venda {

	private Long idVenda;
	private Long idCliente;
	private Long idVendedor;
	private String formaPagamento;
	private Calendar dataVenda;
	private String cartao;
	private String bandeiraCartao;
	private int cvvCartao;
	private Calendar dataValidade;
	private String nomeClienteCartao;
	private float dinheiro;
	private List<Itens> itens = new ArrayList<Itens>();

	public Calendar getDataValidade() {
		return dataValidade;
	}

	public void setDataValidade(Calendar dataValidade) {
		this.dataValidade = dataValidade;
	}

	public String getNomeClienteCartao() {
		return nomeClienteCartao;
	}

	public void setNomeClienteCartao(String nomeClienteCartao) {
		this.nomeClienteCartao = nomeClienteCartao;
	}

	public String getBandeiraCartao() {
		return bandeiraCartao;
	}

	public void setBandeiraCartao(String bandeiraCartao) {
		this.bandeiraCartao = bandeiraCartao;
	}

	public Long getIdVenda() {
		return idVenda;
	}

	public void setIdVenda(Long idVenda) {
		this.idVenda = idVenda;
	}

	public Long getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}

	public Long getIdVendedor() {
		return idVendedor;
	}

	public void setIdVendedor(Long idVendedor) {
		this.idVendedor = idVendedor;
	}

	public String getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public Calendar getDataVenda() {
		return dataVenda;
	}

	public void setDataVenda(Calendar dataVenda) {
		this.dataVenda = dataVenda;
	}

	public String getCartao() {
		return cartao;
	}

	public void setCartao(String cartao) {
		this.cartao = cartao;
	}

	public float getDinheiro() {
		return dinheiro;
	}

	public void setDinheiro(float dinheiro) {
		this.dinheiro = dinheiro;
	}

	public List<Itens> getItens() {
		return itens;
	}

	public void setItens(List<Itens> itens) {
		this.itens = itens;
	}

	public int getCvvCartao() {
		return cvvCartao;
	}

	public void setCvvCartao(int cvvCartao) {
		this.cvvCartao = cvvCartao;
	}
}

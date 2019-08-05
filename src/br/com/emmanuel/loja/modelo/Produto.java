package br.com.emmanuel.loja.modelo;

import java.util.Calendar;
/**
 * Data Acess Object Produto
 * @author Emmanuel Messias da Silva Costa
 */
public class Produto {
	private Long idProduto;
	private String nome;
	private String tipo;
	private Double preco;
	private Double precoComDesconto;
	private float peso;
	private float altura;
	private float largura;
	private float comprimento;
	private float volumeProduto;
	private float alturaEmbalagem;
	private float larguraEmbalagem;
	private float comprimentoEmbalagem;
	private float volumeEmbalagem;
	private Calendar dataCadastro;
	private float frete;
	private Double valorTotal;
	// private List<Itens> itens;

	public Long getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(Long idProduto) {
		this.idProduto = idProduto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public float getPeso() {
		return peso;
	}

	public void setPeso(float peso) {
		this.peso = peso;
	}

	public float getAltura() {
		return altura;
	}

	public void setAltura(float altura) {
		this.altura = altura;
	}

	public float getLargura() {
		return largura;
	}

	public void setLargura(float largura) {
		this.largura = largura;
	}

	public float getComprimento() {
		return comprimento;
	}

	public void setComprimento(float comprimento) {
		this.comprimento = comprimento;
	}

	public float getAlturaEmbalagem() {
		return alturaEmbalagem;
	}

	public void setAlturaEmbalagem(float alturaEmbalagem) {
		this.alturaEmbalagem = alturaEmbalagem;
	}

	public float getLarguraEmbalagem() {
		return larguraEmbalagem;
	}

	public void setLarguraEmbalagem(float larguraEmbalagem) {
		this.larguraEmbalagem = larguraEmbalagem;
	}

	public float getComprimentoEmbalagem() {
		return comprimentoEmbalagem;
	}

	public void setComprimentoEmbalagem(float comprimentoEmbalagem) {
		this.comprimentoEmbalagem = comprimentoEmbalagem;
	}

	public Calendar getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Calendar dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	/**
	 * Método da classe Produto 
	 * Calcula o volume do Produto com os valores de altura, largura e comprimento preenchidos
	 * @return volume do Produto
	 * @see Produto
	 */
	public float getVolumeProduto() {
		volumeProduto = altura * comprimento * largura;
		return volumeProduto;
	}

	public void setVolumeProduto(float volumeProduto) {
		this.volumeProduto = volumeProduto;
	}
	/**
	 * Método da classe Produto 
	 * Calcula o volume da Embalagem do Produto com os valores de alturaEmbalagem, larguraEmbalagem
	 * e comprimentoEmbalagem preenchidos
	 * @return volume do Produto
	 * @see Produto
	 */
	public float getVolumeEmbalagem() {
		volumeEmbalagem = alturaEmbalagem * comprimentoEmbalagem
				* larguraEmbalagem;
		return volumeEmbalagem;
	}

	public void setVolumeEmbalagem(float volumeEmbalagem) {
		this.volumeEmbalagem = volumeEmbalagem;
	}
	/**
	 * Método da classe Produto 
	 * Calcula o frete do produto usando valores de peso, e frete estimado de Natal para Angicos (13,00 R$).
	 * @return frete estimado do Produto
	 * @see Produto
	 */
	public void setFrete(float frete){
		this.frete = frete;
	}
	public float getFrete(){
		frete = peso*13;
		return frete;
		
	}
	public void setValorTotal (Double valorTotal){
		this.valorTotal = valorTotal;
	}
	public Double getValorTotal(){
		valorTotal = preco + frete;
		return valorTotal;
	}
	/**
	 * Método da classe Produto 
	 * Calcula o preço com desconto de 1,0735%.
	 * @return preço com desconto do Produto
	 * @see Produto
	 */
	public void setPrecoComDesconto (Double precoComDesconto){
		this.precoComDesconto = precoComDesconto;
	}
	public Double getPrecoComDesconto(){
		precoComDesconto = this.preco - (this.preco*0.010735);
		return precoComDesconto;
	}
}

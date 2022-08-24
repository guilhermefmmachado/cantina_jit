class ProdutoModel {
  String nome;
  String tipo;
  String descricao;
  double preco;
  int qtdeSelecionadaCliente;

  bool isSelecionadoCardapio;
  bool isDisponivel = true;
  int estoque = 0;
  int qtdeVendidos = 0;

  ProdutoModel({
    required this.nome,
    required this.tipo,
    required this.descricao,
    required this.preco,
    required this.qtdeSelecionadaCliente,
    required this.isSelecionadoCardapio,
  });

  // todo: Criar setter para estoque

  Map<String, dynamic> get obterDadosEssenciaisProduto {
    // Intuito de mostrar na tela
    return {
      "qtde": qtdeSelecionadaCliente,
      "nome": nome,
      "preco-uni": preco,
      "preco-total": calcularPrecoTotal()
    };
  }

  double calcularPrecoTotal() {
    return preco * qtdeSelecionadaCliente;
  }

  addQtdeSelecionadoCliente() {
    qtdeSelecionadaCliente += 1;
  }

  remQtdeSelecionadoCliente() {
    qtdeSelecionadaCliente -= 1;
  }

  set definirEstoque(int qtdeProdutosDisponiveis) {
    estoque = qtdeProdutosDisponiveis;
  }

  set atualizarQtdeVendidos(int numVendidos) {
    qtdeVendidos += numVendidos;
    _atualizarEstoque();
  }

  _atualizarEstoque() {
    estoque = estoque - qtdeVendidos;
    _tornarProdutoIndisponivel();
  }

  _tornarProdutoIndisponivel() {
    isDisponivel = estoque == 0 ? false : true;
  }
}

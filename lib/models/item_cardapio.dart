class ItemCardapio {
  String nome;
  String tipo;
  double preco;
  int qtdeSelecionadaCliente = 0;

  bool isSelecionadoCardapio = false;
  bool isDisponivel = true;
  int estoque = 0;
  int qtdeVendidos = 0;

  ItemCardapio({
    required this.nome,
    required this.tipo,
    required this.preco,
  });

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
    qtdeSelecionadaCliente = isSelecionadoCardapio ? 1 : 0;
  }

  remQtdeSelecionadoCliente() {
    if (!isSelecionadoCardapio) qtdeSelecionadaCliente = 0;
  }

  set definirEstoque(int qtdeProdutosDisponiveis) {
    estoque = qtdeProdutosDisponiveis;
  }

  set atualizarQtdeVendidos(int numVendidos) {
    qtdeVendidos += numVendidos;
    _atualizarEstoque();
  }

  set selecionarProduto(bool ckbxSelection) {
    isSelecionadoCardapio = ckbxSelection;
  }

  get estoqueAtual {
    return estoque;
  }

  _atualizarEstoque() {
    estoque = estoque - qtdeVendidos;
    _tornarProdutoIndisponivel();
  }

  _tornarProdutoIndisponivel() {
    isDisponivel = estoque == 0 ? false : true;
  }
}

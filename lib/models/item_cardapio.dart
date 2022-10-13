class ItemCardapio {
  String nome;
  String tipo;
  double preco;
  int limQtdePorSelecao;
  int qtdeSelecionadaCliente = 0;

  bool isSelecionadoCardapio = false;
  bool isDisponivel = true;
  int estoque = 0;
  int qtdeVendidos = 0;

  ItemCardapio({
    required this.nome,
    required this.tipo,
    required this.preco,
    required this.limQtdePorSelecao,
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

  // Métodos do Slidable
  acrescentarQtdeSelecionadoCliente() {
    if (isSelecionadoCardapio && qtdeSelecionadaCliente <= limQtdePorSelecao) {
      qtdeSelecionadaCliente = qtdeSelecionadaCliente + 1;
    }
  }

  retirarQtdeSelecionadoCliente() {
    if (isSelecionadoCardapio && qtdeSelecionadaCliente > 1) {
      qtdeSelecionadaCliente = qtdeSelecionadaCliente - 1;
    }
  }
  // Fim métodos do Slidable

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

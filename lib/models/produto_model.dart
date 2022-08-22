class Produto {
  String nome;
  String tipo;
  String descricao;
  double preco;
  int qtdeSelecionadaCliente;

  bool isSelecionadoCardapio;
  bool isDisponivel = true;
  int estoque = 0;
  int qtdeVendidos = 0;

  Produto(this.nome, this.tipo, this.descricao, this.preco,
      this.qtdeSelecionadaCliente, this.isSelecionadoCardapio, this.estoque);

  Map<String, dynamic> get obterDadosEssenciaisProduto { // Intuito de mostrar na tela
    return {
      "qtde": qtdeSelecionadaCliente,
      "nome": nome,
      "preco-uni": preco,
      "preco-total": calcularPrecoTotal()
    };
  }

  calcularPrecoTotal() {
    return preco * qtdeSelecionadaCliente;
  }

  addQtdeSelecionadoCliente() {
    qtdeSelecionadaCliente += 1;
  }

  remQtdeSelecionadoCliente() {
    qtdeSelecionadaCliente -= 1;
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

import 'package:cantina_jit/models/produto_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    print("Iniciando a suite de testes do produto");
  });

  tearDownAll(() {
    print("Finalizando a suite de testes do produto");
  });

  test(
      'Dado o seguinte produto, deve-se retornar os seguintes dados essenciais',
      () {
    final hamburguer = ProdutoModel(
      nome: "Hambúrguer",
      tipo: "Sanduíches",
      descricao: "Melhor que os hambúrgueres do MC!",
      preco: 6.99,
      qtdeSelecionadaCliente: 0,
      isSelecionadoCardapio: false,
    );

    hamburguer.definirEstoque = 30;

    expect(hamburguer.obterDadosEssenciaisProduto,
        {"qtde": 0, "nome": "Hambúrguer", "preco-uni": 6.99, "preco-total": 0});
  });

  test(
      'Foi pedido uma unidade desse produto. Deve-se portanto retornar o preço total igual ao preço de uma unidade.',
      () {
    final hamburguer = ProdutoModel(
      nome: "Hambúrguer",
      tipo: "Sanduíches",
      descricao: "Melhor que os hambúrgueres do MC!",
      preco: 6.99,
      qtdeSelecionadaCliente: 0,
      isSelecionadoCardapio: false,
    );

    hamburguer.definirEstoque = 30;

    hamburguer.addQtdeSelecionadoCliente();

    // ESTE É O EXEMPLO DE CENÁRIO QUE MAIS VAI APARECER NO DIALOG
    expect(hamburguer.obterDadosEssenciaisProduto, {
      "qtde": 1,
      "nome": "Hambúrguer",
      "preco-uni": 6.99,
      "preco-total": 6.99
    });
  });

  test('O produto foi selecionado e depois foi removido', () {
    final hamburguer = ProdutoModel(
      nome: "Hambúrguer",
      tipo: "Sanduíches",
      descricao: "Melhor que os hambúrgueres do MC!",
      preco: 6.99,
      qtdeSelecionadaCliente: 0,
      isSelecionadoCardapio: false,
    );

    hamburguer.definirEstoque = 30;

    hamburguer.addQtdeSelecionadoCliente();
    hamburguer.remQtdeSelecionadoCliente();

    expect(hamburguer.obterDadosEssenciaisProduto,
        {"qtde": 0, "nome": "Hambúrguer", "preco-uni": 6.99, "preco-total": 0});
  });

  test(
      'Foi pedido uma unidade desse produto. Deve-se portanto retornar o preço total igual ao preço de uma unidade.',
      () {
    final hamburguer = ProdutoModel(
      nome: "Hambúrguer",
      tipo: "Sanduíches",
      descricao: "Melhor que os hambúrgueres do MC!",
      preco: 6.99,
      qtdeSelecionadaCliente: 0,
      isSelecionadoCardapio: false,
    );

    hamburguer.definirEstoque = 30;

    hamburguer.addQtdeSelecionadoCliente();

    // ESTE É O EXEMPLO DE CENÁRIO QUE MAIS VAI APARECER NO DIALOG
    expect(hamburguer.obterDadosEssenciaisProduto, {
      "qtde": 1,
      "nome": "Hambúrguer",
      "preco-uni": 6.99,
      "preco-total": 6.99
    });
  });

  test('Realizado a compra de um produto, deve-se atualizar o estoque.', () {
    final hamburguer = ProdutoModel(
      nome: "Hambúrguer",
      tipo: "Sanduíches",
      descricao: "Melhor que os hambúrgueres do MC!",
      preco: 6.99,
      qtdeSelecionadaCliente: 0,
      isSelecionadoCardapio: false,
    );

    hamburguer.definirEstoque = 30;
    hamburguer.addQtdeSelecionadoCliente();
    hamburguer.atualizarQtdeVendidos = hamburguer.qtdeSelecionadaCliente;

    expect(hamburguer.estoqueAtual, 29);
  });
}

import 'package:cantina_jit/models/pedido_model.dart';
import 'package:cantina_jit/models/produto_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Mostrar aos usuários os produtos selecionados para revisar o pedido.',
      () {
    var produtosSelecionadosUsuario = [
      ProdutoModel(
          nome: "Coxinha",
          tipo: "Salgado",
          descricao: "Coxinha feita com frango, requeijão e cheiro verde.",
          preco: 2.99,
          qtdeSelecionadaCliente: 1,
          isSelecionadoCardapio: true,
          estoque: 30),
      ProdutoModel(
          nome: "Coca-cola 200ml",
          tipo: "Bebida",
          descricao: "Coca-cola garrafinha de 200ml.",
          preco: 1.99,
          qtdeSelecionadaCliente: 1,
          isSelecionadoCardapio: true,
          estoque: 30),
      ProdutoModel(
          nome: "Brigadeiro",
          tipo: "Doce",
          descricao: "Chocolate e granulado, a melhor das sobremesas!",
          preco: 0.99,
          qtdeSelecionadaCliente: 2,
          isSelecionadoCardapio: true,
          estoque: 30),
    ];

    var pedido = PedidoModel(itensPedido: produtosSelecionadosUsuario);

    List<Map> visaoDialogSelecao = [
      {"qtde": 1, "nome": "Coxinha", "preco-uni": 2.99, "preco-total": 2.99},
      {
        "qtde": 1,
        "nome": "Coca-cola 200ml",
        "preco-uni": 1.99,
        "preco-total": 1.99
      },
      {"qtde": 2, "nome": "Brigadeiro", "preco-uni": 0.99, "preco-total": 1.98},
    ];

    expect(pedido.getDadosEssenciaisItens, visaoDialogSelecao);
  });

  test('Dado a seguinte seleção, mostrar o preço total do pedido.', () {
    var produtosSelecionadosUsuario = [
      ProdutoModel(
          nome: "Coxinha",
          tipo: "Salgado",
          descricao: "Coxinha feita com frango, requeijão e cheiro verde.",
          preco: 2.99,
          qtdeSelecionadaCliente: 1,
          isSelecionadoCardapio: true,
          estoque: 30),
      ProdutoModel(
          nome: "Coca-cola 200ml",
          tipo: "Bebida",
          descricao: "Coca-cola garrafinha de 200ml.",
          preco: 1.99,
          qtdeSelecionadaCliente: 1,
          isSelecionadoCardapio: true,
          estoque: 30),
      ProdutoModel(
          nome: "Brigadeiro",
          tipo: "Doce",
          descricao: "Chocolate e granulado, a melhor das sobremesas!",
          preco: 0.99,
          qtdeSelecionadaCliente: 2,
          isSelecionadoCardapio: true,
          estoque: 30),
    ];

    var pedido = PedidoModel(itensPedido: produtosSelecionadosUsuario);

    expect(pedido.getPrecoPedido.toStringAsFixed(2), "6.96");

    // expect(pedido.getPrecoPedido, 6.96);
    // O getter getPrecoPedido quando retorna double retorna 6.960000000000001. Por isso, está sendo convertido para string aqui.
    //
  });

  test(
      'Dado a seguinte seleção, mostrar a quantidade de produtos pedidos pelo usuário.',
      () {
    var produtosSelecionadosUsuario = [
      ProdutoModel(
          nome: "Coxinha",
          tipo: "Salgado",
          descricao: "Coxinha feita com frango, requeijão e cheiro verde.",
          preco: 2.99,
          qtdeSelecionadaCliente: 1,
          isSelecionadoCardapio: true,
          estoque: 30),
      ProdutoModel(
          nome: "Coca-cola 200ml",
          tipo: "Bebida",
          descricao: "Coca-cola garrafinha de 200ml.",
          preco: 1.99,
          qtdeSelecionadaCliente: 1,
          isSelecionadoCardapio: true,
          estoque: 30),
      ProdutoModel(
          nome: "Brigadeiro",
          tipo: "Doce",
          descricao: "Chocolate e granulado, a melhor das sobremesas!",
          preco: 0.99,
          qtdeSelecionadaCliente: 2,
          isSelecionadoCardapio: true,
          estoque: 30),
    ];

    var pedido = PedidoModel(itensPedido: produtosSelecionadosUsuario);

    expect(pedido.getQtdeProdutosPedidos, 4);
  });
}

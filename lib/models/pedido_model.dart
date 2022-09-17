import 'produto_model.dart';

class PedidoModel {
  double precoPedido = 0;
  int qtdeProdutosPedidos = 0;
  List<ProdutoModel> itensPedido;
  String estadoAtual = ""; // A ser desenvolvido
  List<Map<String, String>> estados = [
    {"estado": "Pedido ainda não realizado", "desc": "Você ainda não fez seu pedido."},
    {"estado": "Pedido feito", "desc": "O pedido foi realizado e logo começará a ser produzido."},
    {"estado": "Em produção", "desc": "A cantina começou a produzir o seu pedido."},
    {"estado": "Pronto para entrega", "desc": "O seu pedido está pronto! Você já pode ir recebê-lo."},
    {"estado": "Pedido entregue", "desc": "Tenha uma boa refeição!"},
  ];

  List<Map> dadosEssenciaisItens = [];

  PedidoModel({required this.itensPedido}) {
    for (var item in itensPedido) {
      precoPedido += item.calcularPrecoTotal();
      qtdeProdutosPedidos += item.qtdeSelecionadaCliente;
      dadosEssenciaisItens.add(item.obterDadosEssenciaisProduto);
    }
  }

  double get getPrecoPedido => precoPedido;
  int get getQtdeProdutosPedidos => qtdeProdutosPedidos;
  List<Map> get getDadosEssenciaisItens => dadosEssenciaisItens;
}

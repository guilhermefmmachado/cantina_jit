import 'produto_model.dart';

class Pedido {
  double precoPedido = 0;
  int qtdeProdutosPedidos = 0;
  List<Produto> itensPedido;
  String estado = "";
  List<Map> dadosEssenciaisItens = [];

  Pedido({required this.itensPedido}) {
    for (var item in itensPedido) {
      precoPedido += item.calcularPrecoTotal();
      qtdeProdutosPedidos += item.qtdeSelecionadaCliente;
      dadosEssenciaisItens.add(item.obterDadosEssenciaisProduto);
    }
  }

  double get getPrecoPedido => precoPedido;
  int get getQtdeProdutosPedidos => qtdeProdutosPedidos;
}

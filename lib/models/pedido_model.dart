import 'produto_model.dart';

class PedidoModel {
  double precoPedido = 0;
  int qtdeProdutosPedidos = 0;
  List<ProdutoModel> itensPedido;
  String estado = "";
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
}

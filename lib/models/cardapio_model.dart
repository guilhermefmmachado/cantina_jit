class CardapioModel {
  List<String> categorias;
  bool accessBttnFinalizarPedido = false;

  CardapioModel({required this.categorias});

  set editarCardapio(List<String> novasCategorias) {
    categorias = novasCategorias;
  }

  set enableFinalizarPedido(int value) {
    accessBttnFinalizarPedido = value >= 1 ? true : false;
  }
}

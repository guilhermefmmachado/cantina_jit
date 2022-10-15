class CardapioModel {
  bool accessBttnFinalizarPedido = false;

  set enableFinalizarPedido(int value) {
    accessBttnFinalizarPedido = value >= 1 ? true : false;
  }


  /*
  List<String> categorias; (inicializaria com construtor)

  set editarCardapio(List<String> novasCategorias) {
    categorias = novasCategorias;
  }
  Função em desenvolvimento
  */
}

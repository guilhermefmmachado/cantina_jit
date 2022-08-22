import 'package:flutter/cupertino.dart';

class CardapioModel extends ChangeNotifier{
  List<String> categorias;
  bool accessBttnFinalizarPedido = false;

  CardapioModel(this.categorias) {
    notifyListeners();
  }

  set editarCardapio(List<String> novasCategorias) {
    categorias = novasCategorias;
  }
  set enableFinalizarPedido(int value) {
    accessBttnFinalizarPedido = value == 1 ? true : false;
  }


}

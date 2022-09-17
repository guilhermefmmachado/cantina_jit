import 'package:cantina_jit/widgets/cardapios_tab.dart';

class CardapioModel {
  List<String> categorias;
  bool accessBttnFinalizarPedido = false;

  CardapioModel(this.categorias);
  
  set editarCardapio(List<String> novasCategorias) {
    categorias = novasCategorias;
  }

  set enableFinalizarPedido(int value) {
    accessBttnFinalizarPedido = value >= 1 ? true : false;
  }
}

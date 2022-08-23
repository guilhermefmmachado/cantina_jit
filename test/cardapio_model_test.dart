import 'package:cantina_jit/models/cardapio_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    print("Iniciando a suite de testes do cardápio");
  });

  tearDownAll(() {
    print("Finalizando a suite de testes do cardápio");
  });

  test('O botão para finalizar o pedido deve ser habilitado.', () {
    final cardapio =
        CardapioModel(categorias: ["Salgados", "Doces", "Bebidas"]);
    cardapio.enableFinalizarPedido = 1;

    expect(cardapio.accessBttnFinalizarPedido, true);
  });

  test('O botão para finalizar o pedido deve ser desabilitado.', () {
    final cardapio =
        CardapioModel(categorias: ["Salgados", "Doces", "Bebidas"]);

    cardapio.enableFinalizarPedido = 1;
    cardapio.enableFinalizarPedido = 0;

    expect(cardapio.accessBttnFinalizarPedido, false);
  });

  test(
      'O cardápio será editado pela cantina. Foi adicionado uma nova categoria.',
      () {
    final cardapio =
        CardapioModel(categorias: ["Salgados", "Doces", "Bebidas"]);

    cardapio.editarCardapio = ["Salgados", "Assados", "Doces", "Bebidas"];

    expect(cardapio.categorias, ["Salgados", "Assados", "Doces", "Bebidas"]);
  });

  test(
      'O cardápio será editado pela cantina. Categorias foram removidas e renomeadas',
      () {
    final cardapio =
        CardapioModel(categorias: ["Salgados", "Doces", "Bebidas"]);

    cardapio.editarCardapio = ["Opções de lanche", "Opções de bebidas"];

    expect(cardapio.categorias, ["Opções de lanche", "Opções de bebidas"]);
  });
}

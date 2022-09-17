import 'package:cantina_jit/models/cardapio_model.dart';
import 'package:cantina_jit/models/produto_model.dart';
import 'package:cantina_jit/widgets/cardapios_tab.dart';
import 'package:flutter/material.dart';

class CardapioController {
  late CardapioModel cardapio;
  late List<ProdutoModel> produtos;

  CardapioController({required this.produtos}) {
    cardapio = CardapioModel();
    }
  }


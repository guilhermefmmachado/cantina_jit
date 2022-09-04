import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/controllers/cardapio_controller.dart';
import 'package:cantina_jit/widgets/cardapios_tab.dart';
import 'package:cantina_jit/widgets/contudo_cardapios_tab.dart';
import 'package:flutter/material.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({Key? key}) : super(key: key);

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Teste"),
      ),
    );
  }
}

import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/widgets/home_colored_button.dart';
import 'package:flutter/material.dart';

class EditarCardapioView extends StatelessWidget {
  const EditarCardapioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Cardápio"),
        backgroundColor: AppColorPalette.redMain,
      ),
      body: SafeArea(
        child: Column(
          children: [
            HomeColoredButton(
              text: "Adicionar produto",
              actorLevel: 2,
              cor: AppColorPalette.greenSec,
            ),
            HomeColoredButton(
              text: "Editar produto",
              actorLevel: 2,
              cor: AppColorPalette.greenMain,
            ),
            HomeColoredButton(
              text: "Remover produto",
              actorLevel: 2,
              cor: AppColorPalette.redMain,
            ),
          ],
        ),
      ),
    );
  }
}

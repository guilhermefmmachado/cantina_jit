import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

class CadastroClienteView extends StatefulWidget {
  const CadastroClienteView({Key? key}) : super(key: key);

  @override
  State<CadastroClienteView> createState() => _CadastroClienteViewState();
}

class _CadastroClienteViewState extends State<CadastroClienteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorPalette.redMain,
        title: const Text(". . ."),
      ),
      body: Center(
        child: Text("Funciona..."),
      ),
    );
  }
}

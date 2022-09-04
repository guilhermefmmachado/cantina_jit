import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

class AdicionarProdutoView extends StatefulWidget {
  const AdicionarProdutoView({Key? key}) : super(key: key);

  @override
  State<AdicionarProdutoView> createState() => _AdicionarProdutoViewState();
}

class _AdicionarProdutoViewState extends State<AdicionarProdutoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Produto"),
        backgroundColor: AppColorPalette.redMain,
      ),
      body: Center(
        child: Text("Funciona..."),
      ),
    );
  }
}

import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

class EditarProdutoView extends StatefulWidget {
  const EditarProdutoView({Key? key}) : super(key: key);

  @override
  State<EditarProdutoView> createState() => _EditarProdutoViewState();
}

class _EditarProdutoViewState extends State<EditarProdutoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Produto"),
        backgroundColor: AppColorPalette.redMain,
      ),
      body: Center(
        child: Text("Funciona..."),
      ),
    );
  }
}
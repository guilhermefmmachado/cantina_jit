import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

class RemoverProdutoView extends StatefulWidget {
  const RemoverProdutoView({Key? key}) : super(key: key);

  @override
  State<RemoverProdutoView> createState() => _RemoverProdutoViewState();
}

class _RemoverProdutoViewState extends State<RemoverProdutoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remover Produto"),
        backgroundColor: AppColorPalette.redMain,
      ),
      body: const Center(
        child: Text("Funciona..."),
      ),
    );
  }
}
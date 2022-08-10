import 'package:flutter/material.dart';

class PedidoView extends StatefulWidget {
  const PedidoView({ Key? key }) : super(key: key);

  @override
  State<PedidoView> createState() => _PedidoViewState();
}

class _PedidoViewState extends State<PedidoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Pedido Funciona!")),
    );
  }
}
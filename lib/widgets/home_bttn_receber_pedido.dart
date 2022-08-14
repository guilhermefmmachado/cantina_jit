import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

class BttnReceberPedido extends StatefulWidget {
  // Eu sei que esse botão tem um único objetivo, abrir a janela para receber pedido, só.
  final bool isEnabled;
  const BttnReceberPedido({
    Key? key,
    required this.isEnabled,
  }) : super(key: key);

  @override
  State<BttnReceberPedido> createState() => _BttnReceberPedidoState();
}

class _BttnReceberPedidoState extends State<BttnReceberPedido> {
  receberPedido() {
    return print("Olá, Mundo");
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "Receber pedido",
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        primary: AppColorPalette.redMain,
      ),
      onPressed: widget.isEnabled ? (() => receberPedido()) : null,
    );
  }
}
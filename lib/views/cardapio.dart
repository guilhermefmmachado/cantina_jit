import 'package:flutter/material.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({ Key? key }) : super(key: key);

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Cardápio Funciona!"),),
    );
  }
}
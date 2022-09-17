import 'package:flutter/material.dart';

class ConteudoCardapiosTab extends StatefulWidget {
  const ConteudoCardapiosTab({
    Key? key,
  }) : super(key: key);

  @override
  State<ConteudoCardapiosTab> createState() => _ConteudoCardapiosTabState();
}

class _ConteudoCardapiosTabState extends State<ConteudoCardapiosTab> {
  // Modificável - Teste do itembuilder / itemcount
  final myProducts = List<String>.generate(10, (i) => 'Product $i');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Teste"),
    );
  }
}

import 'package:flutter/material.dart';

class ConteudoCardapiosTab extends StatefulWidget {
  const ConteudoCardapiosTab({
    Key? key,
  }) : super(key: key);

  @override
  State<ConteudoCardapiosTab> createState() => _ConteudoCardapiosTabState();
}

class _ConteudoCardapiosTabState extends State<ConteudoCardapiosTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Olá, Mundo"),
    );
  }
}
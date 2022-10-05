import 'package:flutter/material.dart';

class IsClienteFuncionarioGerenteView extends StatelessWidget {
  const IsClienteFuncionarioGerenteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciando cadastro..."),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Informe-nos como você pretende usar nosso app"),
          ),
          
        ],
      ),
    );
  }
}

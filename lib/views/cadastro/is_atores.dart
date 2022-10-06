import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/views/cadastro/cadastro_escola.dart';
import 'package:cantina_jit/views/cadastro/cadastro_estudante_funcionario.dart';
import 'package:flutter/material.dart';

class IsClienteFuncionarioGerenteView extends StatelessWidget {
  const IsClienteFuncionarioGerenteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciando cadastro..."),
        backgroundColor: AppColorPalette.redMain,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Center(
            child: Text("Informe-nos quem é você ao usar nosso app."),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CadastroClienteView()),
              );
              },
              style: ElevatedButton.styleFrom(
                primary: AppColorPalette.redMain,
              ),
              child: Row(
                children: [
                  SizedBox(width: 24),
                  Icon(Icons.person_outline_rounded),
                  SizedBox(width: 8),
                  Text("Cliente"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: ElevatedButton(
              onPressed: () {
                print("Teste...");
              },
              style: ElevatedButton.styleFrom(
                primary: AppColorPalette.redMain,
              ),
              child: Row(
                children: [
                  SizedBox(width: 24),
                  Icon(Icons.room_service_outlined),
                  SizedBox(width: 8),
                  Text("Funcionário"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CadastroEscolaView()),
              );
              },
              style: ElevatedButton.styleFrom(
                primary: AppColorPalette.redMain,
              ),
              child: Row(
                children: [
                  SizedBox(width: 24),
                  Icon(Icons.account_box_rounded),
                  SizedBox(width: 8),
                  Text("Gerente"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

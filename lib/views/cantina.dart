import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/views/cantina/criar_cantina.dart';
import 'package:flutter/material.dart';

class CantinaView extends StatelessWidget {
  const CantinaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações da cantina"),
        backgroundColor: AppColorPalette.redMain,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CriarCantinaView()),
              );
              },
              style: ElevatedButton.styleFrom(
                primary: AppColorPalette.redMain,
              ),
              child: Row(
                children: const <Widget>[
                  SizedBox(width: 24),
                  Icon(Icons.person_outline_rounded),
                  SizedBox(width: 8),
                  Text("Cliente"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

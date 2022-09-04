import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/views/editar_cardapio.dart';
import 'package:cantina_jit/views/editar_cardapio_views/adicionar_produto.dart';
import 'package:cantina_jit/views/editar_cardapio_views/editar_produto.dart';
import 'package:cantina_jit/views/editar_cardapio_views/remover_produto.dart';
import 'package:flutter/material.dart';

class HomeColoredButton extends StatefulWidget {
  final String text;
  final Color cor;
  final int actorLevel;
  final navigation;

  const HomeColoredButton({
    Key? key,
    required this.text,
    required this.actorLevel,
    required this.cor,
    this.navigation,
  }) : super(key: key);

  @override
  State<HomeColoredButton> createState() => _HomeColoredButtonState();
}

class _HomeColoredButtonState extends State<HomeColoredButton> {
  final List<String> actors = [
    "Visitante",
    "Cliente",
    "Funcionário",
    "Gerente",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (widget.navigation == "editar-cardapio") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditarCardapioView()));
            }
            if (widget.navigation == "adicionar-produto") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdicionarProdutoView()));
            }
            if (widget.navigation == "editar-produto") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditarProdutoView()));
            }
            if (widget.navigation == "remover-produto") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RemoverProdutoView()));
            }
            /*
            Não implementado
            if (widget.navigation == "tela-login") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditarCardapioView()));
            }
            */
          },
          child: Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: widget.cor,
                border: Border.all(color: AppColorPalette.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColorPalette.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/navigations/tabbar.dart';
import 'package:cantina_jit/views/cardapio.dart';
import 'package:cantina_jit/views/editar_cardapio.dart';
import 'package:flutter/material.dart';

class HomeNavButton extends StatefulWidget {
  final String imgPath;
  final String text;
  final int actorLevel;
  final navigation;

  const HomeNavButton({
    Key? key,
    required this.imgPath,
    required this.text,
    required this.actorLevel,
    this.navigation,
  }) : super(key: key);

  @override
  State<HomeNavButton> createState() => _HomeNavButtonState();
}

class _HomeNavButtonState extends State<HomeNavButton> {
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
            if (widget.navigation == "editar-cardapio" && widget.actorLevel >= 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditarCardapioView()),
              );
            }
          },
          child: Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              height: 80,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColorPalette.black, width: 2),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(widget.imgPath),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                  colorFilter: ColorFilter.mode(
                      AppColorPalette.black.withOpacity(0.4), BlendMode.darken),
                ),
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

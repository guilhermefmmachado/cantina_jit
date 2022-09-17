import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage("assets/system_images/home-wallpaper.jpg"),
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColorPalette.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 6,
                ),
              ]),
          width: MediaQuery.of(context).size.width,
          height: 200,
          margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Row(
            children: [
              Image(
                  image: AssetImage(
                      "assets/system_images/logos/Cantina JIT-logos_transparent.png")),
              Expanded(
                child: Text(
                  "Bem-vindo à Cantina JIT!",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

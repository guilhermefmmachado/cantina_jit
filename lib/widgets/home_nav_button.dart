import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/navigations/tabbar.dart';
import 'package:cantina_jit/views/cardapio.dart';
import 'package:flutter/material.dart';

class HomeNavButton extends StatefulWidget {
  const HomeNavButton({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeNavButton> createState() => _HomeNavButtonState();
}

class _HomeNavButtonState extends State<HomeNavButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Tabbar(setCurrentIndex: 1,)));
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
                  image: AssetImage(
                      "assets/system_images/cardapio-button-wallpaper-02.jpg"),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                  colorFilter: ColorFilter.mode(
                      AppColorPalette.black.withOpacity(0.4), BlendMode.darken),
                ),
              ),
              child: Center(
                child: Text(
                  "Cardápio",
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

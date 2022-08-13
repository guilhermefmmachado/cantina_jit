import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/widgets/home_nav_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "O que lhe traz aqui hoje?",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),

            // NOVAS ROWS E GESTURE DETECTORS
            HomeNavButton(),
            HomeNavButton(),
          ],
        ),
      ),
    );
  }
}

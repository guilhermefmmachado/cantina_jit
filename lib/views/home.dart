import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/widgets/home_header.dart';
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
            HomeHeader(),
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

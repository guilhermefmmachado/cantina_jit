import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/widgets/cardapios_tab.dart';
import 'package:cantina_jit/widgets/contudo_cardapios_tab.dart';
import 'package:flutter/material.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({Key? key}) : super(key: key);

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // Modificável
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorPalette.redMain,
        title: TabBar(
          controller: _tabController,
          // Modificável
          tabs: [
            CardapiosTab(
              title: "Categoria",
            ),
            CardapiosTab(
              title: "Categoria",
            ),
            CardapiosTab(
              title: "Categoria",
            ),
            CardapiosTab(
              title: "Categoria",
            ),
          ],
          physics: const BouncingScrollPhysics(),
          isScrollable: true,
          indicatorColor: AppColorPalette.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        // Modificável
        children: [
          ConteudoCardapiosTab(),
          ConteudoCardapiosTab(),
          ConteudoCardapiosTab(),
          ConteudoCardapiosTab(),
        ],
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}

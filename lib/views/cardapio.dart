import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/models/cardapio_model.dart';
import 'package:flutter/material.dart';

/*
class CardapioView extends StatefulWidget {
  const CardapioView({ Key? key }) : super(key: key);

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Cardápio Funciona!"),),
    );
  }
}
*/

class CardapioView extends StatefulWidget {
  const CardapioView({Key? key}) : super(key: key);

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  var cardapio = CardapioModel(["Salgados", "Doces", "Bebidas"]);

  List<Widget> categoriasCardapio = List.generate(cardapio.categorias.length,
      (index) => TabCategoria(title: categorias[index]));

  List<Widget> categoriasViews = [
    ProdutosCategoria(),
    ProdutosCategoria(),
    ProdutosCategoria(),
    ProdutosCategoria(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: categoriasCardapio.length, vsync: this);
    cardapio.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorPalette.redMain,
        title: TabBar(
          controller: _tabController,
          tabs: categoriasCardapio,
          physics: BouncingScrollPhysics(),
          isScrollable: true,
          indicatorColor: AppColorPalette.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categoriasViews,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class TabCategoria extends StatelessWidget {
  final String title;
  const TabCategoria({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(text: title);
  }
}

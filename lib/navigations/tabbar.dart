import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';
import 'package:cantina_jit/views/cardapio.dart';
import 'package:cantina_jit/views/home.dart';
import 'package:cantina_jit/views/pedido.dart';
import 'package:cantina_jit/views/profile.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  final String _title = "Cantina JIT";
  int currentIndex = 0;
  final views = [
    HomeView(),
    CardapioView(),
    PedidoView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR DO TOPO
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        backgroundColor: AppColorPalette.redMain,
      ),
      body: IndexedStack(children: views, index: currentIndex,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColorPalette.white,
        selectedItemColor: AppColorPalette.redMain,
        unselectedItemColor: AppColorPalette.blackAux,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Início"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: "Cardápio"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.room_service_outlined), label: "Pedido"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: "Perfil"),
        ],
      ),
    );
  }
}

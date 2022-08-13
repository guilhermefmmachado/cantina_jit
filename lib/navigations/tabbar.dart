import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';
import 'package:cantina_jit/views/cardapio.dart';
import 'package:cantina_jit/views/home.dart';
import 'package:cantina_jit/views/pedido.dart';
import 'package:cantina_jit/views/profile.dart';

class Tabbar extends StatefulWidget {
  final int setCurrentIndex;

  const Tabbar({required int setCurrentIndex}) : this.setCurrentIndex = setCurrentIndex;


  @override
  State<Tabbar> createState() => _TabbarState(setCurrentIndex);
}

class _TabbarState extends State<Tabbar> {

  _TabbarState(this.currentIndex);

  final String _title = "Aqui fica o nome da escola";
  int currentIndex = 0;
  final views = [
    HomeView(),
    CardapioView(),
    PedidoView(),
    ProfileView(),
  ];

  /*
    TODO:
    1. Separar APPBAR; 2. SEPARAR BOTTOM NAVBAR; 3 CONTINUAR PROGRAMAÇÃO
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR DO TOPO
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        backgroundColor: AppColorPalette.redMain,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Início"),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded), label: "Cardápio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service_outlined), label: "Pedido"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: "Perfil"),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColorPalette.white,
        selectedItemColor: AppColorPalette.redMain,
        unselectedItemColor: AppColorPalette.blackAux,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: views,
      ),
    );
  }
}

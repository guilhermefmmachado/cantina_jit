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

  final String _title = "Aqui fica o nome da escola";
  int _selectedTab = 0;

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
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            this._selectedTab = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColorPalette.white,
        selectedItemColor: AppColorPalette.redMain,
        unselectedItemColor: AppColorPalette.blackAux,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
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
      ),
      body: Stack(
        children: [
          renderView(0, HomeView()),
          renderView(1, CardapioView()),
          renderView(2, PedidoView()),
          renderView(3, ProfileView()),
        ],
      ),
    );
  }

  Widget renderView(tabIndex, currentView) {
    return IgnorePointer(
      ignoring: _selectedTab != tabIndex,
      child: Opacity(
        opacity: _selectedTab == tabIndex ? 1 : 0,
        child: currentView,
      ),
    );
  }
}

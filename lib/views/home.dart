import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/views/editar_cardapio.dart';
import 'package:cantina_jit/widgets/home_bttn_receber_pedido.dart';
import 'package:cantina_jit/widgets/home_colored_button.dart';
import 'package:cantina_jit/widgets/home_header.dart';
import 'package:cantina_jit/widgets/home_nav_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String estadoPedido = "não realizado";

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
            HomeColoredButton(
              cor: AppColorPalette.redSec,
              text: "Faça seu login aqui",
              actorLevel: 0,
              navigation: 0,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 32,
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColorPalette.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 32,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColorPalette.whiteAux,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Pedido atual ",
                            style: TextStyle(
                              color: AppColorPalette.greenMain,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "${estadoPedido}",
                                style: TextStyle(
                                  color: AppColorPalette.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(text: "."),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 150,
                            margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColorPalette.whiteAux,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: "Dados do pedido atual:\n",
                                style: TextStyle(
                                  color: AppColorPalette.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: AppColorPalette.whiteAux,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BttnReceberPedido(
                                  isEnabled: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // NOVAS ROWS E GESTURE DETECTORS
            HomeNavButton(
              imgPath: "assets/system_images/cardapio-button-wallpaper-02.jpg",
              text: "Editar Cardápio",
              actorLevel: 2,
              navigation: "editar-cardapio",
            )
          ],
        ),
      ),
    );
  }
}

/* 
  TODO: Estilizar melhor o HOMENAVBUTTON;
  TODO: Iniciar design do cardápio;
  TODO: Iniciar design da tela de pedido;
  TODO: Iniciar design da tela de perfil;
  TODO: Iniciar design das telas de histórico;
  TODO: BACKEND
  TODO: SLIDES
  TODO: LOGIN E CADASTRO

  ! TUDO AQUI TEM SUBTAREFA E O TEMPO É CURTO! SEJA SÁBIO!
*/
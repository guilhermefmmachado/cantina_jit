// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class PedidoView extends StatefulWidget {
  const PedidoView({ Key? key }) : super(key: key);
  

  @override
  State<PedidoView> createState() => _PedidoViewState();
}


class _PedidoViewState extends State<PedidoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                //? Cards dos pedidos
                Container(
                  //* estilização do card
                  margin: EdgeInsets.fromLTRB(12, 12, 12, 15),
                  padding: EdgeInsets.all(10),
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(60, 51, 46, 46),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  //* conteúdo do card
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              'assets/system_images/product-icon.png',
                              width: 60
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                          ), 
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 5),
                            child: Text(
                              //! variável
                              'Nome do produto',
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                          )
                        ],
                      ),
                      //* divisória
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: DottedLine(
                          dashLength: 22,
                          dashGapLength: 10,
                        ),
                      ),
                      //* preço do produto
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Preço:',
                              style: TextStyle(
                                fontSize: 25
                              ),
                            ), 
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                //! variável
                                'R\$ 5,00',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: AppColorPalette.redMain
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          //? Valor total da compra
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Valor total:',
                    style: TextStyle(
                      fontSize: 22
                    ),
                  ), 
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      //! variável
                      'R\$ 5,00',
                      style: TextStyle(
                        color: AppColorPalette.redMain,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


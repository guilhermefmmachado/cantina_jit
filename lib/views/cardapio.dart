import 'dart:convert';
import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/controllers/cardapio_controller.dart';
import 'package:cantina_jit/models/item_cardapio.dart';
import 'package:cantina_jit/widgets/cardapios_tab.dart';
import 'package:cantina_jit/widgets/contudo_cardapios_tab.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardapioView extends StatefulWidget {
  const CardapioView({Key? key}) : super(key: key);

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  String phpUrl =
      "http://192.168.15.9/projetos_flutter/cantina_jit_backend/index.php";
  late List dadosCardapio;
  List<ItemCardapio> listaProdutos = [];
  Color? _color = AppColorPalette.redMain;

  Future listarProdutos() async {
    http.Response response = await http.get(Uri.parse(phpUrl));
    if (response.statusCode == 200) {
      dadosCardapio = json.decode(response.body);
      setState(() {
        for (var i = 0; i < dadosCardapio.length; i++) {
          listaProdutos.add(ItemCardapio(
              nome: dadosCardapio[i]["nome_produto"],
              tipo: dadosCardapio[i]["tipo_produto"],
              preco: double.parse(dadosCardapio[i]["preco"])));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    listarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: listaProdutos.isNotEmpty ? listaProdutos.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                activeColor: _color,
                title: Text(listaProdutos[index].nome),
                value: listaProdutos[index].isSelecionadoCardapio,
                onChanged: (bool? value) {
                  setState(() {
                    listaProdutos[index].selecionarProduto = value!;
                    listaProdutos[index].addQtdeSelecionadoCliente();
                    listaProdutos[index].remQtdeSelecionadoCliente();
                  });
                  print(
                      "${listaProdutos[index].nome}, ${listaProdutos[index].isSelecionadoCardapio}");
                },
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: AppColorPalette.whiteAux,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text("Realizar pedido"),
                style: ButtonStyle(
                  backgroundColor: AppColorPalette.greenMain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

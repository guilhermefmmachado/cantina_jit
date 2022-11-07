import 'dart:convert';

import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/models/item_cardapio.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';

class RemoverProdutoView extends StatefulWidget {
  const RemoverProdutoView({Key? key}) : super(key: key);

  @override
  State<RemoverProdutoView> createState() => _RemoverProdutoViewState();
}

class _RemoverProdutoViewState extends State<RemoverProdutoView> {
  String phpUrl =
      "http://192.168.95.131/projetos_flutter/cantina_jit_backend/controllers/cardapio_ctl.php";
  /*String phpUrl = "http://192.168.137.186/projetos_flutter/cantina_jit_backend/controllers/cardapio_ctl.php";*/
  /*String phpUrl =
      "http://192.168.102.76/projetos_flutter/cantina_jit_backend/controllers/cardapio_ctl.php";*/
  late List dadosCardapio;
  List<ItemCardapio> listaProdutos = [];

  late bool erro, enviando, sucesso;
  late String msg;

  /*
  bool _isBtnFinalizarEnabled = false;
  Color? _btnColor = AppColorPalette.greenMain;
  */
  final Color? _ckbxColor = AppColorPalette.redMain;

  Future listarProdutos() async {
    http.Response response = await http.get(Uri.parse(phpUrl));
    if (response.statusCode == 200) {
      dadosCardapio = json.decode(response.body);
      setState(() {
        for (var i = 0; i < dadosCardapio.length; i++) {
          listaProdutos.add(ItemCardapio(
            nome: dadosCardapio[i]["nome_produto"],
            tipo: dadosCardapio[i]["tipo_produto"],
            preco: double.parse(dadosCardapio[i]["preco"]),
            limQtdePorSelecao:
                int.parse(dadosCardapio[i]["lim_qtde_por_selecao"]),
          ));
        }
      });
    }
  }

  String phpUrlRemoverProduto = "http://192.168.95.131/projetos_flutter/cantina_jit_backend/controllers/rem_produto_ctl.php";

  Future<void> remProduto(String nomeProduto) async {
    var response = await http.post(Uri.parse(phpUrlRemoverProduto), body: {
      // $novoProduto = new Produto($_POST["nome"], $_POST["desc"], $_POST["tipo"], $_POST["preco"], $_POST["limqtdeporselecao"] $_POST["estoque"]);
      "nome": nomeProduto,
    });

    if (response.statusCode == 200) {
      print(response.body);
      var data =
          json.decode(response.body); // Decodificando JSON para um array.
      if (data["erro"]) {
        setState(() {
          enviando = false;
          erro = true;
          msg = data["msg"];
        });
      } else {
        setState(() {
          enviando = false;
          sucesso = true;
          // Mensagem de sucesso e atualizar UI com setState
        });
      }
    } else {
      // Erro de statusCode
      setState(() {
        erro = true;
        msg = "Erro no envio do conteúdo. ${response.statusCode}";
        enviando = false;
        // Dispara erro e atualiza com setState
      });
    }
  }

  @override
  void initState() {
    erro = false;
    enviando = false;
    sucesso = false;
    msg = "";
    super.initState();
    listarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remover Produto"),
        backgroundColor: AppColorPalette.redMain,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: ListView.builder(
              itemCount: listaProdutos.isNotEmpty ? listaProdutos.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                  activeColor: _ckbxColor,
                  title: Text(listaProdutos[index].nome),
                  subtitle: Text(NumberFormat.simpleCurrency(
                          locale: "pt-BR", decimalDigits: 2)
                      .format(listaProdutos[index].preco)),
                  value: listaProdutos[index].isSelecionadoCardapio,
                  onChanged: (bool? value) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Você está removendo este produto"),
                          content: const Text("Deseja prosseguir"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Não"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: const Text("Sim"),
                              onPressed: () {
                                remProduto(listaProdutos[index].nome);
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

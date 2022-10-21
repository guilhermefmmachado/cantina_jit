import 'dart:convert';
import 'package:cantina_jit/models/pedido_model.dart';
import 'package:intl/intl.dart';
import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/models/item_cardapio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;

class CardapioView extends StatefulWidget {
  const CardapioView({Key? key}) : super(key: key);

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

// TODO: IMPLEMENTAR ÚLTIMAS MUDANÇAS DO BANCO DE DADOS E BACKEND
/* 
  todo:
  - Campo limite, recepção do add produto, recepção do cardápio.
  ! CHEGUEI EM UM PONTO EM QUE AS CONTAS SÃO IMPORTANTES PARA PROGREDIR!
*/
class _CardapioViewState extends State<CardapioView> {
  /*String phpUrl =
      "http://192.168.15.9/projetos_flutter/cantina_jit_backend/controllers/cardapio_ctl.php";*/
  /*String phpUrl = "http://192.168.137.186/projetos_flutter/cantina_jit_backend/controllers/cardapio_ctl.php";*/
  String phpUrl =
      "http://192.168.102.76/projetos_flutter/cantina_jit_backend/controllers/cardapio_ctl.php";
  late List dadosCardapio;
  List<ItemCardapio> listaProdutos = [];
  
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

  String resumoPedido(PedidoModel pedido) {
    List<Map> dadosPedido = pedido.getDadosEssenciaisItens;
    String resumo = "";
    for (var i = 0; i < dadosPedido.length; i++) {
      resumo +=
          "Item: ${dadosPedido[i]["nome"]}; \nQuantidade: ${dadosPedido[i]["qtde"]}; \nPreço total: ${NumberFormat.simpleCurrency(locale: "pt-BR", decimalDigits: 2).format(dadosPedido[i]["preco-total"])};\n\n";
    }
    return resumo;
  }
  
  // Função para partes sem qualquer interação do slidable.
  void doNothing(BuildContext context) {}

  @override
  void initState() {
    super.initState();
    listarProdutos();
  }

  // ! VARIÁVEL TEMPORÁRIA
  int TEMPnumPedidosRealizados = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            child: ListView.builder(
              itemCount: listaProdutos.isNotEmpty ? listaProdutos.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        autoClose: false,
                        backgroundColor: AppColorPalette.redMain,
                        foregroundColor: AppColorPalette.white,
                        icon: Icons.remove,
                        onPressed: (context) {
                          listaProdutos[index].retirarQtdeSelecionadoCliente();
                          setState(() {});
                        },
                      ),
                      SlidableAction(
                        autoClose: false,
                        backgroundColor: AppColorPalette.whiteAux,
                        foregroundColor: AppColorPalette.black,
                        label: "${listaProdutos[index].qtdeSelecionadaCliente}",
                        onPressed: doNothing,
                      ),
                      SlidableAction(
                        autoClose: false,
                        backgroundColor: AppColorPalette.greenMain,
                        foregroundColor: AppColorPalette.white,
                        icon: Icons.add,
                        onPressed: (context) {
                          listaProdutos[index]
                              .acrescentarQtdeSelecionadoCliente();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  child: CheckboxListTile(
                    activeColor: _ckbxColor,
                    title: Text(listaProdutos[index].nome),
                    subtitle: Text(NumberFormat.simpleCurrency(
                            locale: "pt-BR", decimalDigits: 2)
                        .format(listaProdutos[index].preco)),
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
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              color: AppColorPalette.whiteAux,
              width: MediaQuery.of(context).size.width,
              height: 60,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  // print("Funciona...");
                  List<bool> listaProdutosSelecionados = [];
                  for (var item in listaProdutos) {
                    listaProdutosSelecionados.add(item.isSelecionadoCardapio);
                  }
                  if (!listaProdutosSelecionados.contains(true)) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Pedido inválido"),
                          content: const Text(
                              "Você não selecionou um ou mais produtos, portanto não poderá fazer um pedido."),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Ok"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  // ! CONDIÇÃO COM VARIÁVEIS A SER SUBSTITUÍDAS NO FUTURO (TEMPnumPedidosRealizados)
                  if (TEMPnumPedidosRealizados >= 1 &&
                      listaProdutosSelecionados.contains(true)) {
                    List<ItemCardapio> itensPedido = [];
                    for (var item in listaProdutos) {
                      if (item.isSelecionadoCardapio) {
                        itensPedido.add(item);
                      }
                    }
                    PedidoModel novoPedido =
                        PedidoModel(itensPedido: itensPedido);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                              "Você já tem um ou mais pedidos em andamento"),
                          content: Text(
                              "Você tem certeza que deseja fazer mais um pedido?\n\nEste é o resumo do seu pedido:\n${resumoPedido(novoPedido)}"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Cancelar"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: const Text("Sim"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  if (TEMPnumPedidosRealizados == 0 &&
                      listaProdutosSelecionados.contains(true)) {
                    List<ItemCardapio> itensPedido = [];
                    for (var item in listaProdutos) {
                      if (item.isSelecionadoCardapio) {
                        itensPedido.add(item);
                      }
                    }
                    PedidoModel novoPedido =
                        PedidoModel(itensPedido: itensPedido);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Este é o seu pedido"),
                          content: SingleChildScrollView(
                              child: Text(resumoPedido(novoPedido))),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Cancelar"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                              child: const Text("Ok"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text("Realizar pedido"),
                style: ElevatedButton.styleFrom(
                  primary: AppColorPalette.greenMain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

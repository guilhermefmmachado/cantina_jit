import 'dart:convert';

import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdicionarProdutoView extends StatefulWidget {
  const AdicionarProdutoView({Key? key}) : super(key: key);

  @override
  State<AdicionarProdutoView> createState() => _AdicionarProdutoViewState();
}

// TODO: Estilizar os campos.
// ! Atenção aos retornos NULL
class _AdicionarProdutoViewState extends State<AdicionarProdutoView> {
  TextEditingController nomeProdutoCtl = TextEditingController();
  TextEditingController descProdutoCtl = TextEditingController();
  TextEditingController tipoProdutoCtl = TextEditingController();
  TextEditingController precoProdutoCtl = TextEditingController();
  TextEditingController estoqueProdutoCtl = TextEditingController();

  //text controller for TextField

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late bool erro, enviando, sucesso;
  late String msg;

  String phpUrl =
      "http://177.71.69.206/projetos_flutter/cantina_jit_backend/index.php";

  @override
  void initState() {
    // TODO: implement initState
    erro = false;
    enviando = false;
    sucesso = false;
    msg = "";
    super.initState();
  }

  Future<void> addProduto() async {
    var response = await http.post(Uri.parse(phpUrl), body: {
      // $novoProduto = new Produto($_POST["nome"], $_POST["desc"], $_POST["tipo"], $_POST["preco"], $_POST["estoque"]);
      "nome": nomeProdutoCtl.text,
      "desc": descProdutoCtl.text,
      "tipo": tipoProdutoCtl.text,
      "preco": precoProdutoCtl.text,
      "estoque": estoqueProdutoCtl.text,
    });

    if (response.statusCode == 200) {
      print(response.body);
      // ! Rever o que "data" fala
      var data =
          json.decode(response.body); // Decodificando JSON para um array.
      if (data["erro"]) {
        // TODO: Completar o código daqui
        setState(() {
          enviando = false;
          erro = true;
          msg = data["msg"];
        });
      } else {
        // Se a inserção ao BD for bem sucedida, esvazie os campos.
        nomeProdutoCtl.text = "";
        descProdutoCtl.text = "";
        tipoProdutoCtl.text = "";
        precoProdutoCtl.text = "";
        estoqueProdutoCtl.text = "";

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Produto"),
        backgroundColor: AppColorPalette.redMain,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: nomeProdutoCtl,
                  decoration: const InputDecoration(
                    hintText: "Nome do produto",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe o nome do produto.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descProdutoCtl,
                  decoration: const InputDecoration(
                    hintText: "Descrição do produto (opcional)",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: tipoProdutoCtl,
                  decoration: const InputDecoration(
                    hintText: "Tipo ou categoria do produto",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe o tipo do produto.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: precoProdutoCtl,
                  decoration: const InputDecoration(
                    hintText: "Preço do produto (R\$)",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null ||
                        value.isEmpty ||
                        double.tryParse(value) == null) {
                      return "Por favor, informe um valor numérico. Ex.: 2.00";
                    }
                    return null;
                  },
                ),
                TextFormField(
                    controller: estoqueProdutoCtl,
                    decoration: const InputDecoration(
                      hintText: "Estoque",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColorPalette.greenMain,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          int.tryParse(value) == null) {
                        return "Por favor, informe um valor numérico. Ex.: 30";
                      }
                      return null;
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // currentState! -> a exclamação indica que esse valor JAMAIS será nulo
                          // print("Funciona...");
                          // * É aqui onde a programação para alterar o BD acontece
                          setState(() {
                            enviando = true;
                          });
                          addProduto();
                        }
                      },
                      child: Text(enviando ? "Adicionando..." : "Adicionar"),
                      style: ElevatedButton.styleFrom(
                        primary: AppColorPalette.redMain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

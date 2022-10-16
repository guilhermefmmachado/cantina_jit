import 'dart:convert';

import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CriarCantinaView extends StatefulWidget {
  const CriarCantinaView({Key? key}) : super(key: key);

  @override
  State<CriarCantinaView> createState() => _CriarCantinaViewState();
}

// ! NA MONOGRAFIA, MUDAR O PROCESSO DE CADASTRO DE ESCOLA PARA INSCREVER O GERENTE
class _CriarCantinaViewState extends State<CriarCantinaView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController funcionariosEmailsCtl = TextEditingController();
  TextEditingController lucroDia = TextEditingController();
  TextEditingController lucroMes = TextEditingController();
  TextEditingController lucroAno = TextEditingController();

  late bool erro, enviando, sucesso;
  late String msg;

  // String phpUrl = "http://192.168.15.9/projetos_flutter/cantina_jit_backend/controllers/escola_ctl.php";
  // ! CUIDADO AO USAR NA ESCOLA, ERRO DE IP.

  @override
  void initState() {
    erro = false;
    enviando = false;
    sucesso = false;
    msg = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro da Escola"),
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
                  controller: funcionariosEmailsCtl,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: "E-mails dos funcionários",
                    hintText: "email1, email2, email3, ...",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Informe os e-mails dos funcionários para registrá-los.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lucroDia,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "80.00",
                    labelText: "Lucro Diário (R\$)",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe um valor numérico conforme o exemplo.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lucroMes,
                  decoration: const InputDecoration(
                    hintText: "1500.00",
                    labelText: "Lucro Mensal (R\$)",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe um valor numérico conforme o exemplo.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: lucroAno,
                  decoration: const InputDecoration(
                    labelText: "Lucro Anual (R\$)",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe um valor numérico conforme o exemplo.";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // * É aqui onde a programação para alterar o BD acontece
                          setState(() {
                            enviando = true;
                          });
                          /*cadastrarEscola();*/
                        }
                      },
                      child: Text(enviando ? "Cadastrando..." : "Cadastrar"),
                      style: ElevatedButton.styleFrom(
                        primary: AppColorPalette.redMain,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    sucesso
                        ? "Cadastro realizado, agora faça seu login na página de login e cofigure sua cantina."
                        : msg,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

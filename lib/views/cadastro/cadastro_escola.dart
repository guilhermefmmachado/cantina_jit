import 'dart:convert';

import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CadastroEscolaView extends StatefulWidget {
  const CadastroEscolaView({Key? key}) : super(key: key);

  @override
  State<CadastroEscolaView> createState() => _CadastroEscolaViewState();
}

// ! NA MONOGRAFIA, MUDAR O PROCESSO DE CADASTRO DE ESCOLA PARA INSCREVER O GERENTE
class _CadastroEscolaViewState extends State<CadastroEscolaView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomeEscolaCtl = TextEditingController();
  TextEditingController emailEscolaCtl = TextEditingController();
  TextEditingController senhaEscolaCtl = TextEditingController();
  TextEditingController nomeGerenteCtl = TextEditingController();
  TextEditingController emailGerenteCtl = TextEditingController();
  TextEditingController senhaGerenteCtl = TextEditingController();

  bool _isEscolaPasswordFieldObscure = true,
      _isGerentePasswordFieldObscure = true;

  late bool erro, enviando, sucesso;
  late String msg;
  String phpUrl =
      "http://192.168.95.131/projetos_flutter/cantina_jit_backend/controllers/escola_ctl.php";
  /*String phpUrl =
      "http://192.168.102.76/projetos_flutter/cantina_jit_backend/controllers/escola_ctl.php";*/
  // ! CUIDADO AO USAR NA ESCOLA, ERRO DE IP.

  @override
  void initState() {
    erro = false;
    enviando = false;
    sucesso = false;
    msg = "";
    super.initState();
  }

  Future<void> cadastrarEscola() async {
    var response = await http.post(Uri.parse(phpUrl), body: {
      // $escola = new Escola($_POST["nome"], $_POST["emailescola"], $_POST["senhaescola"], $_POST["nomegerente"], $_POST["emailgerente"], $_POST["senhagerente"], $condicaoExecucao);
      "nome": nomeEscolaCtl.text,
      "emailescola": emailEscolaCtl.text,
      "senhaescola": senhaEscolaCtl.text,
      "nomegerente": nomeGerenteCtl.text,
      "emailgerente": emailGerenteCtl.text,
      "senhagerente": senhaGerenteCtl.text,
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data["erro"]) {
        setState(() {
          enviando = false;
          erro = true;
          msg = data["msg"];
        });
      } else {
        nomeEscolaCtl.text = "";
        emailEscolaCtl.text = "";
        senhaEscolaCtl.text = "";
        nomeGerenteCtl.text = "";
        emailGerenteCtl.text = "";
        senhaGerenteCtl.text = "";

        setState(() {
          enviando = false;
          sucesso = true;
        });
      }
    } else {
      setState(() {
        erro = true;
        msg = "Erro no envio do conteúdo. ${response.statusCode}";
        enviando = false;
      });
    }
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
                  controller: nomeEscolaCtl,
                  decoration: const InputDecoration(
                    hintText: "E. M. Exemplo Ilustrativo",
                    labelText: "Nome da escola",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe o nome da escola.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailEscolaCtl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "escola@example.com",
                    labelText: "E-mail da escola",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe o e-mail semelhante ao exemplo.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: senhaEscolaCtl,
                  obscureText: _isEscolaPasswordFieldObscure,
                  decoration: InputDecoration(
                    hintText: "Senha da escola",
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(_isEscolaPasswordFieldObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isEscolaPasswordFieldObscure =
                                !_isEscolaPasswordFieldObscure;
                          });
                        }),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe sua senha.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: nomeGerenteCtl,
                  decoration: const InputDecoration(
                    hintText: "Nome do gerente ou coordenador da escola",
                    labelText: "Nome do gerente ou coordenador da escola",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe o nome da escola.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailGerenteCtl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "gerente@example.com",
                    labelText: "E-mail do gerente ou coordenador da escola.",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe o e-mail semelhante ao exemplo.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: senhaGerenteCtl,
                  obscureText: _isGerentePasswordFieldObscure,
                  decoration: InputDecoration(
                    hintText: "Senha do gerente da escola.",
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(_isGerentePasswordFieldObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isGerentePasswordFieldObscure =
                                !_isGerentePasswordFieldObscure;
                          });
                        }),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe sua senha.";
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
                          cadastrarEscola();
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

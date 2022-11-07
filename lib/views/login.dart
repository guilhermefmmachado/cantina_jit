import 'dart:convert';

import 'package:cantina_jit/auxiliar-classes/acesso.dart';
import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/navigations/tabbar.dart';
import 'package:cantina_jit/views/cadastro/is_atores.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController senhaCtl = TextEditingController();
  bool _isPasswordFieldObscure = true;

  final List<String> _atores = <String>["Cliente", "Funcionário", "Gerente"];
  late String _valorAtoresDropdown;

  late bool erro, enviando, sucesso;
  late String msg;

  String phpUrl =
      "http://192.168.15.9/projetos_flutter/cantina_jit_backend/controllers/login_ctl.php";
  /*String phpUrl =
      "http://192.168.102.76/projetos_flutter/cantina_jit_backend/controllers/login_ctl.php";*/
  // ! CUIDADO AO USAR NA ESCOLA, ERRO DE IP.

  @override
  void initState() {
    // TODO: implement initState
    erro = false;
    enviando = false;
    sucesso = false;
    msg = "";
    _valorAtoresDropdown = _atores.first;
    super.initState();
  }

  Future fazerAutenticacao() async {
    var response = await http.post(Uri.parse(phpUrl), body: {
      // $login = new Login($_POST["email"], $_POST["senha"], $_POST["ator"], $condicaoExecucao);
      "email": emailCtl.text,
      "senha": senhaCtl.text,
      "ator": _valorAtoresDropdown,
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
        setState(() {
          enviando = false;
          sucesso = true;
        });

        if (sucesso) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString("email", emailCtl.text);
          // Acesso as funcionalidades dependendo do ator
          Acesso.tipoUsuario(_valorAtoresDropdown);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Tabbar(),
            ),
          );
        }

        emailCtl.text = "";
        senhaCtl.text = "";
      }
    } else {
      setState(() {
        erro = true;
        msg = "Erro no envio do conteúdo. ${response.statusCode}";
        enviando = false;
      });
    }

    // ! FAZER PHP P/ REMOVER DEAD CODE
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  Text("Bem-vindo à Cantina JIT",
                      style: TextStyle(fontSize: 24)),
                  Text(
                    "Faça seu login e aproveite!",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                  ),
                ],
              ),
            ),
            backgroundColor: AppColorPalette.redMain,
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: emailCtl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "usuario@example.com",
                    labelText: "E-mail do usuário",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
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
                const SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: senhaCtl,
                  obscureText: _isPasswordFieldObscure,
                  decoration: InputDecoration(
                    hintText: "Senha",
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(_isPasswordFieldObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordFieldObscure = !_isPasswordFieldObscure;
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
                const SizedBox(
                  height: 32,
                ),
                DropdownButton(
                  value: _valorAtoresDropdown,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: AppColorPalette.greenMain,
                  ),
                  items: _atores.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // Usado quando o usuário selecionar um item
                    setState(() {
                      _valorAtoresDropdown = value!;
                    });
                  },
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //print("Login realizado...");
                        fazerAutenticacao();
                        // * É aqui onde a programação para alterar o BD acontece
                      }
                    },
                    child: const Text("Entrar"),
                    style: ElevatedButton.styleFrom(
                      primary: AppColorPalette.redMain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Não tem uma conta? Crie sua conta "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const IsClienteFuncionarioGerenteView()),
                        );
                      },
                      child: const Text(
                        "aqui",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColorPalette.greenMain,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColorPalette.greenMain,
                        ),
                      ),
                    ),
                    const Text("."),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

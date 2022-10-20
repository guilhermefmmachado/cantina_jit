import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

class CadastroClienteView extends StatefulWidget {
  const CadastroClienteView({Key? key}) : super(key: key);

  @override
  State<CadastroClienteView> createState() => _CadastroClienteViewState();
}

class _CadastroClienteViewState extends State<CadastroClienteView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomeClienteCtl = TextEditingController();
  TextEditingController emailClienteCtl = TextEditingController();
  TextEditingController senhaClienteCtl = TextEditingController();
  TextEditingController emailClienteEscolaCtl = TextEditingController();

  bool _isPasswordFieldObscure = true;

  //late bool erro, enviando, sucesso;
  //late String msg;

  /*String phpUrl =
      "http://192.168.15.9/projetos_flutter/cantina_jit_backend/index.php";*/
  String phpUrl =
      "http://192.168.102.76/projetos_flutter/cantina_jit_backend/index.php";

  // ! CUIDADO AO USAR NA ESCOLA, ERRO DE IP.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Clientes"),
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
                  controller: nomeClienteCtl,
                  decoration: const InputDecoration(
                    hintText: "Insira seu nome real, evite apelidos.",
                    labelText: "Nome do cliente",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe o nome do cliente.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailClienteCtl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "cliente@example.com",
                    labelText: "E-mail do cliente",
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
                  controller: senhaClienteCtl,
                  obscureText: _isPasswordFieldObscure,
                  decoration: InputDecoration(
                    hintText: "Senha do cliente",
                    focusedBorder: const UnderlineInputBorder(
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
                TextFormField(
                  controller: emailClienteEscolaCtl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "escola@example.com",
                    labelText: "E-mail da escola do cliente",
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // * É aqui onde a programação para alterar o BD acontece
                          print("Funciona...");
                          //cadastrarEscola();
                        }
                      },
                      child:
                          Text(/*enviando ? "Cadastrando..." : */ "Cadastrar"),
                      style: ElevatedButton.styleFrom(
                        primary: AppColorPalette.redMain,
                      ),
                    ),
                  ),
                ),
                /*
                Center(
                  child: Text(
                    sucesso
                        ? "Cadastro realizado, agora faça seu login na página de login e cofigure sua cantina."
                        : msg,
                    textAlign: TextAlign.center,
                  ),
                )
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

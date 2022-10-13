import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

class CadastroFuncionarioView extends StatefulWidget {
  const CadastroFuncionarioView({Key? key}) : super(key: key);

  @override
  State<CadastroFuncionarioView> createState() => _CadastroFuncionarioViewState();
}

class _CadastroFuncionarioViewState extends State<CadastroFuncionarioView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomeFuncionarioCtl = TextEditingController();
  TextEditingController emailFuncionarioCtl = TextEditingController();
  TextEditingController senhaFuncionarioCtle = TextEditingController();
  TextEditingController emailFuncionarioEscolaCtl = TextEditingController();

  bool _isPasswordFieldObscure = true;

  //late bool erro, enviando, sucesso;
  //late String msg;

  String phpUrl =
      "http://192.168.15.9/projetos_flutter/cantina_jit_backend/index.php";
  // ! CUIDADO AO USAR NA ESCOLA, ERRO DE IP.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Funcionários"),
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
                  controller: nomeFuncionarioCtl,
                  decoration: const InputDecoration(
                    hintText: "Insira seu nome real, evite apelidos.",
                    labelText: "Nome do funcionário",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColorPalette.greenMain,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, informe o nome do funcionário.";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: emailFuncionarioCtl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "funcionario@example.com",
                    labelText: "E-mail do funcionário",
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
                  controller: senhaFuncionarioCtle,
                  obscureText: _isPasswordFieldObscure,
                  decoration: InputDecoration(
                    hintText: "Senha do funcionário",
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
                  controller: emailFuncionarioCtl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "escola@example.com",
                    labelText: "E-mail da escola do funcionário",
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
                      child: Text(/*enviando ? "Cadastrando..." : */"Cadastrar"),
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

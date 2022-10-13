import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/views/cadastro/is_atores.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

// TODO: Estilizar os campos.
// ! Atenção aos retornos NULL
class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordFieldObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(
                  height: 8,
                ),
                Text("Bem-vindo à Cantina JIT", style: TextStyle(fontSize: 24)),
                Text(
                  "Faça seu login e aproveite!",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Login realizado...");
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
                            builder: (context) => const IsClienteFuncionarioGerenteView()),
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
    );
  }
}

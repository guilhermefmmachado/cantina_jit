import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text("Fazer login"),
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
                  decoration: const InputDecoration(
                    hintText: "usuario@example.com",
                    labelText: "E-mail do usuário",
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
                  obscureText: _isPasswordFieldObscure,
                  decoration: InputDecoration(
                    hintText: "Senha",
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

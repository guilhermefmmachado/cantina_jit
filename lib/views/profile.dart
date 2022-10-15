import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:cantina_jit/views/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? _email = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _email = preferences.getString("email");
    });
  }

  Future logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("email");
    Navigator.push(
      context,
      MaterialPageRoute(
        maintainState: false,
        builder: (context) => const LoginView(),
      ),
    );
  }

  @override
  void initState() {
    getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            SizedBox(
                //* Foto de perfil
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: const <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/system_images/user-image.png'),
                      radius: 50,
                    )
                  ],
                )),
            Container(
              //* Nome do estudante
              padding: const EdgeInsets.only(top: 20, left: 15),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Nome do Estudante',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.mode_edit))
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            _email == "" ? const Text("") : Text(_email!),
            Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15, top: 25),
                  child: Text(
                    'Conexões',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: Row(
                children: [
                  //* Logo
                  /*
                  const Expanded(
                    child: SizedBox(
                      height: 140,
                      child: Image(
                        image: AssetImage('assets/system_images/logos/etpc_logo.png'),
                      ),
                    ),
                  ),
                  */
                  //* Nome da escola
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Escola. . .',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              //* Botão
              width: MediaQuery.of(context).size.width - 80,
              child: ElevatedButton(
                //* estilos do botão
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColorPalette.redMain),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                child: const Text("Sair do perfil"),
                onPressed: (() {
                  //? Adicionar uma função ao botão
                  logOut();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

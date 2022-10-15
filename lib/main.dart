import 'package:cantina_jit/views/login.dart';
import 'package:flutter/material.dart';
import 'package:cantina_jit/navigations/tabbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * Shared Preferences: banco de dados "cache" do celular.
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString("email");
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: email == null ? LoginView() : Tabbar(),
    ),
  );
}

/*
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Tabbar(),
    );
  }
}
*/
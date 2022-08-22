// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'dart:ffi';

import 'package:cantina_jit/auxiliar-classes/app_color_palette.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({ Key? key }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            SizedBox(
              //* Foto de perfil
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/system_images/user-image.png'),
                    radius: 50,
                  )
                ],
              )
            ),
            Container(
              //* Nome do estudante
              padding: EdgeInsets.only(top: 20, left: 15),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nome do Estudante',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.mode_edit)
                  )
                ],
              ),
            ),
            Container(
              //* Conexões
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 25),
                    child: Text(
                      'Conexões', 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(  
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: Row(
                children: [
                  //* Logo
                  Expanded(
                    child: SizedBox(
                      height: 140,
                      child: Image(
                        image: AssetImage('assets/system_images/logos/etpc_logo.png'),
                      ),
                    ),
                  ),
                  //* Nome da escola
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Escola Técnica Pandiá Calógeras', 
                            style: TextStyle(
                              fontSize: 16
                            ),
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
                  backgroundColor: MaterialStateProperty.all<Color>(AppColorPalette.redMain),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  )
                ),
                onPressed: (() {
                  //? Adicionar uma função ao botão
                }),
                //* ícone e texto
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 21,),
                    Text('alterar conexão'.toUpperCase())
                  ],
                ),
              ),
            )
          ],
        ),   
      ),
    );
  }
}


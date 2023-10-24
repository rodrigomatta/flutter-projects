import 'package:flutter/material.dart';

class TelaLogada extends StatefulWidget {
  const TelaLogada({super.key});

  @override
  State<TelaLogada> createState() => _TelaLogadaState();
}

class _TelaLogadaState extends State<TelaLogada> {
  String usuarioBanco = "admin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tela de Log"),
        ),
        body: Container(
          child: Row(
            children: [
              Text("LOGADO COM SUCESSO!"),
              Spacer(),
              Text("Bem-vindo, ${usuarioBanco}!"),
            ],
          ),
        )
    );
  }
}
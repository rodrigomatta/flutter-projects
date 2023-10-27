import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {
  String usuario;
  String senha;
  Tela2(this.usuario, this.senha);

  @override
  State<Tela2> createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 2 shared preferences"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("BEM-VINDO --> ${widget.usuario}"),
            Text("SUA SENHA --> ${widget.senha}"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ElevatedButton(
          child: Text("Ir para a segunda tela"),
          onPressed: (){
            Navigator.push( //adiciona uma tela a pilha.
              context,
              MaterialPageRoute(
                builder: (context)=> TelaSecundaria(),
                )
            );
          },
        ),
      )
    );
  }
}
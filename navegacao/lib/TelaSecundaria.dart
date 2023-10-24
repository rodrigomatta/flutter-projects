import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  const TelaSecundaria({super.key});

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundaria"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ElevatedButton(
          child: Text("Ir para a tela Principal"),
          onPressed: (){
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context)=> TelaPrincipal()
            //   )
            // );
            Navigator.pop(context); //só exclui a ultima tela da pilha.
          }, 
        ),
      ),
    );
  }
}
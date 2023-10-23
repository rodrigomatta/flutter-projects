import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController campoTexto = TextEditingController();
  TextEditingController campoDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Campo Texto"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(30),
            child: TextField(
              controller: campoTexto,
              maxLength: 10,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText:  "Digite um valor",
                fillColor: Colors.yellow,
                filled: true,
              ),
              style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 15,
                //backgroundColor: Colors.red,
                //letterSpacing: 20,
              ),
              //obscureText: true,
              //obscuringCharacter: 'h',
              // onTap: (){
              //   print("Campo clicado");
              // },
              // onSubmitted: (String campo1){
              //   print("Campo submitted $campo1");
              // },
              // onChanged: (String campo1){,
              //   print("campo OnChange $campo1");
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: TextField(
              controller: campoDescricao,
              decoration: InputDecoration(
                labelText: "Digite uma descrição"
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                // if(campoTexto.text.isEmpty){
                //   print("Campo vazio");
                // } else {
                //   print("Valor capturado ${campoTexto.text}");
                // }
                print("Campo texto: ${campoTexto.text}");
                print("campo descrição: ${campoDescricao.text}");
              },
              child: Text("SALVAR"),
          )
        ],
      ),
    );
  }
}
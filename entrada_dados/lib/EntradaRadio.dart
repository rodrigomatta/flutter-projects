import 'package:flutter/material.dart';

class EntradaRadio extends StatefulWidget {
  const EntradaRadio({super.key});

  @override
  State<EntradaRadio> createState() => _EntradaRadioState();
}

class _EntradaRadioState extends State<EntradaRadio> {
  String escolhaUsuario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Radio"),
      ),
      body: Container(
        child: Column(
          children: [
            RadioListTile(
                title: Text("Masculino"),
                value: "masculino",
                groupValue: escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    escolhaUsuario = escolha!;
                  });
                }
            ),
            RadioListTile(
                title: Text("Feminino"),
                value: "feminino",
                groupValue: escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    escolhaUsuario = escolha!;
                  });
                }
            ),
            ElevatedButton(
                onPressed: (){
                  print("A escolha do usuário foi: "+escolhaUsuario.toString());
                },
                child: Text("SALVAR")
            )
          ],
        ),
      ),
    );
  }
}
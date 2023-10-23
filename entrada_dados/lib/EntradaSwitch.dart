import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({super.key});

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool entradaSwitch =  false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Switch"),
      ),
      body: Container(
        child: Column(
          children: [
            SwitchListTile(
                title: Text("Quer receber notificações?"),
                subtitle: Text("serão enviadas 1.000.000 de notificações por dia"),
                secondary: Icon(Icons.ac_unit),
                value: entradaSwitch,
                onChanged: (valor){
                  setState(() {
                    entradaSwitch = valor;
                  });
                }
            )
          ],
        ),
      ),
    );
  }
}

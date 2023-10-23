import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({super.key});

  @override
  State<EntradaCheckbox> createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {
  bool milhoAtivado = false;
  bool sojaAtivado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Checkbox"),
      ),
      body: Container(
        color: Colors.greenAccent,
        child: Column(
          children: [
            CheckboxListTile(
                title: Text("Variedade de milho"),
                subtitle: Text("IPR-216"),
                secondary: Icon(Icons.check_circle),
                activeColor: Colors.orangeAccent,
                value: milhoAtivado,
                onChanged: (valor){
                  setState(() {
                    milhoAtivado = valor!;
                  });
                  print("Componente milho é ${valor.toString()}");
                }
            ),
            CheckboxListTile(
                title: Text("Variedade de soja"),
                subtitle: Text("IPR-220"),
                secondary: Icon(Icons.check_circle),
                activeColor: Colors.orangeAccent,
                value: sojaAtivado,
                onChanged: (valor) {
                  setState(() {
                    sojaAtivado = valor!;
                  });
                  print("Componente soja é ${valor.toString()}");
                }
            ),
          ],
        ),
      )
    );
  }
}

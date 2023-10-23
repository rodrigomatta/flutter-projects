import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({super.key});

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double valor = 1;
  String meuLabel = "5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Slider"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Slider(
                value: valor,
                min: 0,
                max: 10,
                label: meuLabel,
                divisions: 20,
                activeColor: Colors.green,
                inactiveColor: Colors.deepOrange,
                onChanged: (double valorEscolhido) {
                  setState(() {
                    valor = valorEscolhido;
                    meuLabel = valor.toString();
                  });
                }
            ),
            ElevatedButton(
                onPressed: (){
                  print("O valor configurado é ${valor.toString()}");
                },
                child: Text("SALVAR")
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ResponsividadeWrap extends StatefulWidget {
  // Construtor da classe ResponsividadeWrap
  const ResponsividadeWrap({super.key});

  @override
  State<ResponsividadeWrap> createState() => _ResponsividadeWrapState();
}

class _ResponsividadeWrapState extends State<ResponsividadeWrap> {
  @override
  Widget build(BuildContext context) {

    // Definição das dimensões dos contêineres
    double altura = 150;
    double largura = 250;

    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
      ),

      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Wrap(
          runSpacing: 10,  // Espaçamento entre as linhas
          spacing: 10,     // Espaçamento entre os elementos na mesma linha
          alignment: WrapAlignment.center,  // Alinhamento dos elementos
          children: [
            Container(
              width: largura,
              height: altura,
              color: Colors.red,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.green,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.blue,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.lightBlue,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.yellow,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.black,
            ),
            Container(
              width: largura,
              height: altura,
              color: Colors.greenAccent,
            ),
          ],
        ),
      )
    );
  }
}
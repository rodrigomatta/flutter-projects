import 'package:flutter/material.dart';

class ResponsividadeOrientacao extends StatefulWidget {
  // Construtor da classe ResponsividadeOrientacao
  const ResponsividadeOrientacao({super.key});

  @override
  State<ResponsividadeOrientacao> createState() => _ResponsividadeOrientacaoState();
}

class _ResponsividadeOrientacaoState extends State<ResponsividadeOrientacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orientação"),
      ),
      body: OrientationBuilder(
        builder: (context, orientacao) {
          //return Container(
            //child: orientacao == Orientation.landscape ? Text("Paisagem"):Text("Formato Retrato"),
           // Verifica a orientação da tela e retorna um GridView correspondente
          return GridView.count(
            crossAxisCount: orientacao == Orientation.landscape ? 5 : 2,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.lightBlue,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.deepPurpleAccent,
              ),
              Container(
                color: Colors.amberAccent,
              ),
              Container(
                color: Colors.black12,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.lightBlue,
              ),
              Container(
                color: Colors.orange,
              ),
              Container(
                color: Colors.deepPurpleAccent,
              ),
              Container(
                color: Colors.amberAccent,
              ),
              Container(
                color: Colors.black12,
              ),
            ],
          );
        },
      ),
    );
  }
}
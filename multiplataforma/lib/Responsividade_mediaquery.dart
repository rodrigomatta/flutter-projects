import 'package:flutter/material.dart';

class Responsividade_MediaQuery extends StatefulWidget {
  const Responsividade_MediaQuery({super.key});

  @override
  State<Responsividade_MediaQuery> createState() => _Responsividade_MediaQueryState();
}

class _Responsividade_MediaQueryState extends State<Responsividade_MediaQuery> {
  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;
    var alturaAppBar = AppBar().preferredSize.height;
    var alturaBarraStatus = MediaQuery.of(context).padding.top;

    var larguraContainer = largura / 3;

    return Scaffold(
      appBar: AppBar(title: Text("MediaQuery")),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            width: largura,
            height: 200,
            child: Text("Texto de exemplo"),
          ),
          Container(
            color: Colors.orange,
            width: largura,
            height: 200,
            //height: altura - alturaAppBar - alturaBarraStatus,
            child: Text("Texto de exemplo"),
          ),
          Container(
            color: Colors.blueAccent,
            width: largura,
            height: 200,
            //height: altura - alturaAppBar - alturaBarraStatus,
            child: Text("Texto de exemplo"),
          )
        ],
      ),
    );
  }
}

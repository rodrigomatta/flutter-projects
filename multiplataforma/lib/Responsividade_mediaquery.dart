import 'package:flutter/material.dart';

class Responsividade_MediaQuery extends StatefulWidget {
  // Construtor da classe Responsividade_MediaQuery
  const Responsividade_MediaQuery({super.key});

  @override
  State<Responsividade_MediaQuery> createState() => _Responsividade_MediaQueryState();
}

class _Responsividade_MediaQueryState extends State<Responsividade_MediaQuery> {
  @override
  Widget build(BuildContext context) {
    // Obtém a largura e a altura da tela usando MediaQuery
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;

    // Obtém a altura da AppBar
    var alturaAppBar = AppBar().preferredSize.height;

    // Obtém a altura da barra de status
    var alturaBarraStatus = MediaQuery.of(context).padding.top;

    // Calcula a largura de cada Container baseada na largura da tela
    var larguraContainer = largura / 3;

    return Scaffold(
      appBar: AppBar(title: Text("MediaQuery")),
      body: Column(
        children: [
          // Primeiro Container com largura e altura definidas
          Container(
            color: Colors.green,
            width: largura,
            height: 200,
            child: Text("Texto de exemplo"),
          ),
          // Segundo Container com largura da tela e altura calculada
          Container(
            color: Colors.orange,
            width: largura,
            height: 200,
            //height: altura - alturaAppBar - alturaBarraStatus,
            child: Text("Texto de exemplo"),
          ),
          // Terceiro Container com largura da tela e altura calculada
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

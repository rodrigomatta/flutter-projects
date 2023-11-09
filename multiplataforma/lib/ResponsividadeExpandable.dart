import 'package:flutter/material.dart';

class ResponsividadeExpandable extends StatefulWidget {
  // Construtor da classe ResponsividadeExpandable
  const ResponsividadeExpandable({super.key});

  @override
  State<ResponsividadeExpandable> createState() => _ResponsividadeExpandableState();
}

class _ResponsividadeExpandableState extends State<ResponsividadeExpandable> {
  @override
  Widget build(BuildContext context) {
    // Obtém a largura e a altura da tela usando MediaQuery
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;

    // Calcula a largura de cada Container baseada na largura da tela
    var larguraContainer = largura / 3;

    return Scaffold(
      appBar: AppBar(title: Text("MediaQuery")),
      body: Column(
        children: [
          // Primeiro bloco expandido
          Expanded(
            child: Container(
              color: Colors.pinkAccent,
              // child: Text("Texto de Exemplo"),
            ),
          ),
          // Segundo bloco expandido (uma linha com 3 Containers)
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,  // Ocupa 2/4 do espaço disponível
                  child: Container(
                    color: Colors.blueAccent,
                    // child: Text("Texto de Exemplo"),
                  ),
                ),
                Expanded(
                  flex: 1,  // Ocupa 1/4 do espaço disponível
                  child: Container(
                    color: Colors.black,
                    // child: Text("Texto de Exemplo"),
                  ),
                ),
                Expanded(
                  flex: 1,  // Ocupa 1/4 do espaço disponível
                  child: Container(
                    color: Colors.orange,
                    // child: Text("Texto de Exemplo"),
                  ),
                ),
              ],
            ),
          ),
          // Terceiro bloco expandido
          Expanded(
            child: Container(
              color: Colors.purpleAccent,
              // child: Text("Texto de Exemplo"),
            ),
          ),
        ],
      ),
    );
  }
}

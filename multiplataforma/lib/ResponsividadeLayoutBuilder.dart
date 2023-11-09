import 'package:flutter/material.dart';

class ResponsividadeLayoutBuilder extends StatefulWidget {
  // Construtor da classe ResponsividadeLayoutBuilder
  const ResponsividadeLayoutBuilder({super.key});

  @override
  State<ResponsividadeLayoutBuilder> createState() => _ResponsividadeLayoutBuilderState();
}

class _ResponsividadeLayoutBuilderState extends State<ResponsividadeLayoutBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Builder"),
      ),
      body: Container(
        // Define a largura e altura do Container com base no tamanho da tela
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.greenAccent,
        child: LayoutBuilder(
          builder: (context, constraint) {
            // Obtém a largura e altura disponíveis a partir do LayoutBuilder
            var largura = constraint.maxWidth;
            var altura = constraint.maxHeight;

            print(largura); // Imprime a largura no console
            print(altura); // Imprime a altura no console

            // Verifica a largura e retorna um Texto correspondente à resolução da tela
            if (largura < 767) {
              return Text("Tela Celular");
            } else if (largura < 1023) {
              return Text("Tela Tablet");
            } else {
              return Text("Tela PC");
            }
          },
        ),
      ),
    );
  }
}
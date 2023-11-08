import 'package:flutter/material.dart';
import 'package:mapas/Principal.dart'; // Importa o pacotes

void main() { // Função principal que inicia a aplicação Flutter.
  runApp(MaterialApp( // Inicia o aplicativo com um MaterialApp, que é um widget conveniente que inclui um número de widgets comuns necessários em aplicações.
    home: Principal(), // Define o widget Principal como a tela inicial do aplicativo.
    debugShowCheckedModeBanner: false // Desativa o banner de modo de depuração no canto superior direito.
  ));
}

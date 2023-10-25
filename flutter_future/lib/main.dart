// Importações necessárias
import 'package:flutter/material.dart';
import 'package:flutter_future/Principal.dart';

// Função principal que é executada quando o aplicativo é iniciado
void main() {
  runApp(MaterialApp(
    home: Principal(), // Define a tela inicial do aplicativo como Principal()
    debugShowCheckedModeBanner: false, // Configura para não exibir o banner de depuração
  ));
}
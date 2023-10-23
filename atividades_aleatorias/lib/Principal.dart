import 'dart:math'; // Importação da biblioteca 'dart:math' para usar a classe Random.
import 'package:flutter/material.dart'; // Importação da biblioteca 'flutter/material' para uso do Flutter.

class Principal extends StatefulWidget {
  const Principal({super.key}); // Definição da classe Principal, que é um StatefulWidget.
  @override
  State<Principal> createState() => _PrincipalState(); // Criação do estado associado à classe Principal.
}

class _PrincipalState extends State<Principal> {
  List atividades = [
    "Apenas mais um dia de código quebrado.",
    "Não importa o que eu faça, sempre haverá erros.",
    "Minha documentação é um labirinto sem saída.",
    "Esqueça os testes, vamos torcer para que funcione.",
    "Só mais um bug para a coleção interminável.",
    "Ninguém nunca vai entender meu código, nem eu.",
    "Meu projeto é como um castelo de cartas em um furacão.",
    "Eu codifico, mas nada parece funcionar.",
    "Nada como passar horas para resolver um problema trivial.",
    "Eu desisti de entender o Flutter. É magia negra."
  ]; // Lista de frases desmotivacionais.
  String frases = ""; // Variável para armazenar a frase desmotivacional exibida.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerador de Frases Desmotivacionais"), // Título da barra de aplicativo.
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 50, 153, 204), // Cor de fundo da barra de aplicativo.
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(frases), // Exibe a frase desmotivacional.
            ElevatedButton(
              onPressed: () {
                int aleatorio = Random().nextInt(atividades.length); // Gera um número aleatório com base no tamanho da lista de atividades.
                print(atividades[aleatorio]); // Imprime a frase desmotivacional no console.
                setState(() {
                  frases = atividades[aleatorio]; // Define a frase desmotivacional exibida no aplicativo.
                });
              },
              child: Text("Gerar frase desmotivacional!"), // Texto exibido no botão.
            ),
          ],
        ),
      ),
    );
  }
}
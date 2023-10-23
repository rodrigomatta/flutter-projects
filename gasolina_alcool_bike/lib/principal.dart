import 'package:flutter/material.dart';

// Classe Principal que herda de StatefulWidget
class Principal extends StatefulWidget {
  // Construtor da classe Principal
  const Principal({super.key});

  // Sobrescreve o método createState para criar o estado
  @override
  State<Principal> createState() => _PrincipalState();
}

// Classe _PrincipalState que representa o estado da tela
class _PrincipalState extends State<Principal> {
  // Controladores de texto para campos de entrada
  TextEditingController campoGasolina = TextEditingController();
  TextEditingController campoAlcool = TextEditingController();
  String resultado = "Resultado"; // Variável de resultado inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent, // Cor de fundo da tela
        appBar: AppBar(
          title: Text("Gasolina, Álcool ou Bike branck secondary"),
          // Título da barra de aplicativo
          backgroundColor:
              Colors.purpleAccent, // Cor de fundo da barra de aplicativo
        ),
        body: Container(
          padding: EdgeInsets.all(20), // Preenchimento do contêiner
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Inserindo imagens
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/gasosa.jpg", // Imagem de gasolina
                      scale: 6.3, // Escala da imagem
                    ),
                    Image.asset(
                      "images/bicicleta.png", // Imagem de bicicleta
                      scale: 6, // Escala da imagem
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    resultado, // Exibe o resultado
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        labelText: "Digite o preço da Gasolina: "),
                    // Campo de entrada para preço da gasolina
                    keyboardType: TextInputType.number,
                    controller: campoGasolina,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        labelText: "Digite o preço do Álcool: "),
                    // Campo de entrada para preço do álcool
                    keyboardType: TextInputType.number,
                    controller: campoAlcool,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Função executada quando o botão é pressionado
                    String gasolinaTexto =
                        campoGasolina.text.replaceAll(',', '.');
                    String alcoolTexto = campoAlcool.text.replaceAll(',', '.');

                    double gasolina = double.parse(gasolinaTexto);
                    double alcool = double.parse(alcoolTexto);

                    if (gasolina <= 0 || alcool <= 0) {
                      setState(() {
                        resultado =
                            "Digite um valor válido"; // Mensagem de erro se os valores forem não positivos
                      });
                    } else if (gasolina >= 10 && alcool >= 10) {
                      setState(() {
                        resultado =
                            "Melhor ir de BIKE"; // Se ambos os preços forem altos, melhor ir de bicicleta
                      });
                    } else if ((alcool / gasolina) >= 0.7) {
                      setState(() {
                        resultado =
                            "Melhor abastecer com gasolina"; // Comparação de preços para determinar o resultado
                      });
                    } else {
                      setState(() {
                        resultado =
                            "Melhor abastecer com álcool"; // Se nenhuma das condições anteriores for atendida
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                  ),
                  child: Text("CALCULAR"), // Botão para calcular
                )
              ],
            ),
          ),
        ));
  }
}

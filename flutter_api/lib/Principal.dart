import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  String nomeCidade = "", respostaTemp = "", respostaTempMax = "", respostaTempMin = "", porSol = "", nascerSol = "";
  TextEditingController campoCidade = TextEditingController();
  TextEditingController campoPais = TextEditingController();

  //sincrona - com respostas praticamente imediatas.
  //assincrona - fica aguardando a volta da informação.

  getDados() async {
    if(!campoCidade.text.isEmpty && !campoPais.text.isEmpty) {
      String apiKey = "XXXXXXXXXXXXXXXXXXXX";
      String lang = "pt_br";
      String urlApi = "https://api.openweathermap.org/data/2.5/weather?q=${campoCidade.text},${campoPais.text}&lang=$lang&APPID=$apiKey&units=metric";

      http.Response response = await http.get(Uri.parse(urlApi));

      if (response.statusCode == 200) {
        Map<String, dynamic> dados = json.decode(response.body);
        double temp = dados['main']['temp'];
        double tempMax = dados['main']['temp_max'];
        double tempMin = dados['main']['temp_min'];
        DateTime dateUtcNascer = DateTime.fromMillisecondsSinceEpoch(dados['sys']['sunrise'] * 1000, isUtc: true);
        String horaNascerSol = "${(dateUtcNascer.hour - 3).toString().padLeft(2, '0')}:${dateUtcNascer.minute.toString().padLeft(2, '0')}:${dateUtcNascer.second.toString().padLeft(2, '0')}";
        DateTime dateUtcPor = DateTime.fromMillisecondsSinceEpoch(dados['sys']['sunset'] * 1000, isUtc: true);
        String horaPorSol = "${(dateUtcPor.hour - 3).toString().padLeft(2, '0')}:${dateUtcPor.minute.toString().padLeft(2, '0')}:${dateUtcPor.second.toString().padLeft(2, '0')}";
        //print(dados);

        setState(() {
          nomeCidade = "Cidade: ${dados['name']}";
          nascerSol = "Horario de Nascimento do Sol: ${horaNascerSol}";
          porSol = "Horario de Por do Sol: ${horaPorSol}";
          respostaTemp = "Temperatura Agora: ${temp.toStringAsFixed(2)} °C";
          respostaTempMax = "Temperatura Máxima: ${tempMax.toStringAsFixed(2)} °C";
          respostaTempMin = "Temperatura Minima: ${tempMin.toStringAsFixed(2)} °C";
        });
      } else {
        setState(() {
          respostaTemp = "Falha ao obter dados: ${response.statusCode}";
          nomeCidade = "";
          porSol = "";
          nascerSol = "";
          respostaTempMax = "";
          respostaTempMin = "";
        });
      }
    } else {
      setState(() {
        respostaTemp = "Favor preencher todos os campos corretamente";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tempo"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: campoCidade,
                decoration: InputDecoration(
                  labelText: "Informe o nome da cidade Ex: Londrina"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                controller: campoPais,
                decoration: InputDecoration(
                  labelText: "Informe o país ex: br"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: ElevatedButton(
                onPressed:  (){
                  getDados();
                },
                child: Text("ACESSAR"),
              ),
            ),
            Text("\n $nomeCidade\n $nascerSol\n $porSol\n $respostaTemp\n $respostaTempMax\n $respostaTempMin\n"),
          ],
        ),
      ),
    );
  }
}
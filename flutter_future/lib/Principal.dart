// Importações necessárias
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Classe Principal que é um StatefulWidget
class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

// Classe que representa o estado da tela Principal
class _PrincipalState extends State<Principal> {
  // Lista para armazenar informações sobre moedas
  List<Map<String, dynamic>> listaMoedas = [];

  // Função assíncrona para buscar cotações
  Future<Map> buscarCotacao() async {
    String url = "https://blockchain.info/ticker";
    http.Response resposta = await http.get(Uri.parse(url));
    Map<String, dynamic> lista = json.decode(resposta.body);
    return lista;
  }

  String repostaServidor = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cotações Biticão"),
      ),
      body: FutureBuilder<Map>(
        future: buscarCotacao(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              print("sem conexão");
              // Fluxo de execução: Quando não há conexão.
            case ConnectionState.active:
              print("conexao ativa");
              // Fluxo de execução: Quando a conexão está ativa.
            case ConnectionState.waiting:
              print("conexao aguardando");
              repostaServidor += "\nAGUARDANDO";
              return Center(
                child: CircularProgressIndicator(),
              );
              // Fluxo de execução: Quando a conexão está aguardando.
            case ConnectionState.done:
              print("conexao finalizada");
              repostaServidor += "\nFINALIZADO";

              if (snapshot.hasError) {
                repostaServidor = "Erro ao carregar dados da internet";
              } else {
                // Processa os dados da resposta e os armazena na listaMoedas
                snapshot.data?.values.forEach((element) {
                  Map<String, dynamic> moeda = Map();
                  moeda["nome"] = element["symbol"];
                  moeda["cotacao"] = element["buy"];
                  listaMoedas.add(moeda);
                });
              }
              break;
          }
          // Exibe a lista de moedas em um ListView
          return Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: listaMoedas.length,
              itemBuilder: (context, indice) {
                return ListTile(
                  title: Text(listaMoedas[indice]["nome"]),
                  subtitle: Text(listaMoedas[indice]["cotacao"].toString()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
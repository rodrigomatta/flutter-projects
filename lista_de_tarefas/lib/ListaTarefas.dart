import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class ListaTarefas extends StatefulWidget {
  const ListaTarefas({super.key});

  @override
  _ListaTarefasState createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  int indice = 0;
  List<Map<String, dynamic>> listaItens = [];
  TextEditingController campoItem = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializa a tela lendo os itens da lista de tarefas do arquivo.
    lerArquivo().then((conteudo) {
      setState(() {
        listaItens = (json.decode(conteudo) as List).cast<Map<String, dynamic>>();
      });
    });
  }

  // Função para salvar os itens da lista de tarefas em um arquivo.
  Future<void> salvarArquivo() async {
    try {
      final diretorio = await getApplicationDocumentsDirectory();
      File arquivo = File('${diretorio.path}/arquivo.json');
      String conteudo = json.encode(listaItens);
      await arquivo.writeAsString(conteudo);
    } catch (erro) {
      print("Erro ao salvar o arquivo: ${erro.toString()}");
    }
  }

  // Função para ler os itens da lista de tarefas de um arquivo.
  Future<String> lerArquivo() async {
    try {
      final diretorio = await getApplicationDocumentsDirectory();
      File arquivo = File('${diretorio.path}/arquivo.json');
      if (await arquivo.exists()) {
        return await arquivo.readAsString();
      } else {
        return "";
      }
    } catch (erro) {
      print("Erro ao ler o arquivo: ${erro.toString()}");
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaItens.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    padding: EdgeInsets.all(15),
                    color: Color.fromARGB(255, 209, 49, 38),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.delete_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    // Remove o item da lista ao arrastá-lo para a esquerda.
                    setState(() {
                      listaItens.removeAt(index);
                    });
                    salvarArquivo();
                  },
                  child: CheckboxListTile(
                    title: Text(listaItens[index]['nome']),
                    value: listaItens[index]['finalizado'],
                    onChanged: (valor) {
                      // Atualiza o status de conclusão do item.
                      setState(() {
                        listaItens[index]['finalizado'] = valor;
                      });
                      salvarArquivo();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Adicionar item"),
                content: TextField(
                  decoration: InputDecoration(
                    labelText: "Digite o item a incluir",
                  ),
                  controller: campoItem,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Adiciona um novo item à lista de tarefas.
                      Map<String, dynamic> item = Map();
                      item['nome'] = campoItem.text;
                      item['finalizado'] = false;

                      setState(() {
                        listaItens.add(item);
                      });
                      salvarArquivo();
                      campoItem.text = "";
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Item incluído com sucesso"),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                      );
                    },
                    child: Text("Adicionar"),
                  ),
                ],
              );
            },
          );
        },
        label: Text("Adicionar à lista"),
        icon: Icon(
          Icons.add_circle,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
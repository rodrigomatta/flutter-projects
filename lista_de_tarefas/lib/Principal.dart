import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key});

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List<String> listaItens = ["milho", "soja", "trigo", "café", "feijão"];
  TextEditingController campoItem = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listaItens.length,
              itemBuilder: (context, indice) {
                return ListTile(
                  title: Text(listaItens[indice]),
                );
              },
            ),
          )
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
                      Navigator.of(context).pop(); // Fechar o diálogo
                    },
                    child: Text("Cancelar"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        listaItens.add(campoItem.text);
                      });
                      Navigator.of(context).pop(); // Fechar o diálogo
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

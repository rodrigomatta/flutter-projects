import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  List listaProdutos = [];

  getListaProdutos() {
    for (int i = 1; i < 11; i++) {
      Map<String,dynamic> produto = Map();
      produto["nome"] = "Nome ${i}";
      produto["descricao"] = "Descrição do produto ${i}";
      listaProdutos.add(produto);
    }
  }

  @override
  Widget build(BuildContext context) {
    getListaProdutos();
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Lista"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listaProdutos.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(listaProdutos[index]["nome"]),
              subtitle: Text(listaProdutos[index]["descricao"]),
              onTap: (){
                showDialog(
                  context: context, 
                  builder: (context){
                    return AlertDialog(
                      title: Text(listaProdutos[index]["nome"]),
                      titlePadding: EdgeInsets.all(30),
                      titleTextStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.black38,
                      ),
                      content: Text(listaProdutos[index]["descricao"]),
                      backgroundColor: Colors.deepOrangeAccent,
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(onPressed: (){ print("SALVANDO"); }, child: Text("SALVAR") ),
                            ElevatedButton(onPressed: (){ print("CANCELANDO"); Navigator.pop(context); }, child: Text("CANCELAR")),
                          ],
                        )
                      ],
                    );
                  }
                );
              },
            );
          },
        ),
      ),
    );
  }
}
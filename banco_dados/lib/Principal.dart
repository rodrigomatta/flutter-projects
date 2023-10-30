//import 'package:banco_dados/Banco.dart';
//import 'package:banco_dados/Produto.dart';
import 'package:banco_dados/Alterar.dart';
import 'package:banco_dados/Cadastrar.dart';
import 'package:banco_dados/Excluir.dart';
import 'package:banco_dados/Listar.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int indiceSelecionado = 0;

  List telas = [
    Listar(),
    Cadastrar(),
    Alterar(),
    Excluir(),
  ];

  List<Color> appBarColors = [
    Colors.deepOrangeAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
    Colors.redAccent,
  ];

  @override
  Widget build(BuildContext context) {
    // Banco banco = Banco();
    // Produto p = Produto();
    // //banco.buscarBanco();
    // p.id = 3;
    // p.nome = "Soja";
    // p.marca = "ISR";
    // p.preco = 270.0;
    // p.validade = "10/02/2097";
    // //banco.salvar(p);
    // banco.alterarProduto(p);
    // //banco.apagarProduto(2);
    // banco.getProdutos();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "images/idrparana.png",
            width: 150,
            height: 60,
          ),
        ),
        backgroundColor: appBarColors[indiceSelecionado],
      ),
      body: telas[indiceSelecionado],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceSelecionado,
        type: BottomNavigationBarType.shifting,
        onTap: (indice) {
          setState(() {
            indiceSelecionado = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Listar",
            backgroundColor: Colors.orangeAccent,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: "Cadastar",
            backgroundColor: Colors.blueAccent,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.security_update_good),
            label: "Alterar",
            backgroundColor: Colors.green,
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.delete_forever),
            label: "Excluir",
            backgroundColor: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}

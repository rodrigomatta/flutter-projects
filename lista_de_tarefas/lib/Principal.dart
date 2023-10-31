import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/ListaTarefas.dart';
import 'package:lista_de_tarefas/Pagina1.dart';
import 'package:lista_de_tarefas/Pagina2.dart';
import 'package:lista_de_tarefas/Pagina3.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int indice = 0; // Variável para rastrear o índice da tela atual
  List<Widget> telas = [ListaTarefas(), Pagina1(), Pagina2(), Pagina3()]; // Lista de telas disponíveis

  // Função para mudar a tela com base no índice
  void mudarPagina(int newIndex) {
    setState(() {
      indice = newIndex; // Atualiza o índice da tela
    });
    // Fecha o drawer ao selecionar uma opção
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"), // Título da AppBar
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            // Opções no Drawer para mudar a tela
            ListTile(
              title: Text("Lista de Tarefas"),
              leading: Icon(Icons.add_task_sharp),
              onTap: () {
                mudarPagina(0); // Muda para a tela de Lista de Tarefas
              },
            ),
            ListTile(
              title: Text("Pagina1"),
              leading: Icon(Icons.first_page),
              onTap: () {
                mudarPagina(1); // Muda para a tela de Pagina1
              },
            ),
            ListTile(
              title: Text("Pagina2"),
              leading: Icon(Icons.contact_page),
              onTap: () {
                mudarPagina(2); // Muda para a tela de Pagina2
              },
            ),
            ListTile(
              title: Text("Pagina3"),
              leading: Icon(Icons.last_page),
              onTap: () {
                mudarPagina(3); // Muda para a tela de Pagina3
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: indice, // Exibe a tela com o índice selecionado
              children: telas, // Lista de telas disponíveis
            ),
          ),
        ],
      ),
    );
  }
}

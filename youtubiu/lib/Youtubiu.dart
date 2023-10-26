import 'package:flutter/material.dart';
import 'package:youtubiu/Biblioteca.dart';
import 'package:youtubiu/EmAlta.dart';
import 'package:youtubiu/Inicio.dart';
import 'package:youtubiu/Inscricoes.dart';

class Youtube extends StatefulWidget {
  const Youtube({super.key});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  int indiceSelecionado = 0;

  List telas = [
    Inicio(),
    EmAlta(),
    Inscricoes(),
    Biblioteca()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          width: 47,
          height: 50,
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white70),

        actions: [
          IconButton(
            onPressed: () {

            }, 
            icon: Icon(Icons.videocam)
          ),
          IconButton(
            onPressed: () {

            }, 
            icon: Icon(Icons.search_rounded)
          ),
          IconButton(
            onPressed: () {

            }, 
            icon: Icon(Icons.account_circle)
          )
        ],
      ),
      body: telas[indiceSelecionado],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indice){
          setState(() {
            indiceSelecionado = indice;
          });
        },

        type: BottomNavigationBarType.fixed,
        //type: BottomNavigationBarType.shifting,
        currentIndex: indiceSelecionado,
        unselectedItemColor: Colors.white70,
        fixedColor: Colors.redAccent,
        backgroundColor: Colors.black,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Inicio",
            //backgroundColor: Colors.redAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: "Em alta",
            //backgroundColor: Colors.blueAccent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: "Inscrições",
            //backgroundColor: Colors.purpleAccent
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.folder_copy),
            label: "Biblioteca",
            //backgroundColor: Colors.green
          ),
        ],
      ),
    );
  }
}
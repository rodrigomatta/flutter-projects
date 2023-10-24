import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Detector"),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
                child: SvgPicture.asset(
                'images/foguete.svg',
                semanticsLabel: 'Imagem SVG Foguete',
                height: 200,
                width: 140,
              ),
              onTap: () {
                print("Clicando: 1x");
              },
              onLongPress: (){
                //poderia ser o comando pra levar para outra página.
                print("Clicado: LongPress");
              },
              onDoubleTap: (){
                print("Clicando 2X");
              },
            ),
            SvgPicture.asset(
              'images/pesquisa.svg',
              semanticsLabel: 'Imagem SVG Pesquisa',
              height: 200,
              width: 140,
            ),
          ],
        ),
      ),
    );
  }
}
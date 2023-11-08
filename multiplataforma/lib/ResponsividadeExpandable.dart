import 'package:flutter/material.dart';

class ResponsividadeExpandable extends StatefulWidget {
  const ResponsividadeExpandable({super.key});

  @override
  State<ResponsividadeExpandable> createState() => _ResponsividadeExpandableState();
}

class _ResponsividadeExpandableState extends State<ResponsividadeExpandable> {
  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;

    var larguraContainer = largura / 3;

    return Scaffold(
      appBar: AppBar(title: Text("MediaQuery")),
      body: Column(
        children: [
          Expanded(
              child: Container(
                color: Colors.pinkAccent,
                //child: Text("Texto de Exemplo"),
              )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blueAccent,
                        //child: Text("Texto de Exemplo"),
                      )
                  ),
                  Expanded(
                    flex: 1,
                      child: Container(
                        color: Colors.black,
                        //child: Text("Texto de Exemplo"),
                      )
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.orange,
                        //child: Text("Texto de Exemplo"),
                      )
                  )
                ],
              )
          ),
          Expanded(
              child: Container(
                color: Colors.purpleAccent,
                //child: Text("Texto de Exemplo"),
              )
          )
        ],
      ),
    );
  }
}

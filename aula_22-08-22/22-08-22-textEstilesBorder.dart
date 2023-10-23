import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      //color: Colors.blueGrey,
      padding: EdgeInsets.all(20),
      //margin: EdgeInsets.fromLTRB(10, 30, 100, 30),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        border: Border.all(
          color: Colors.yellow,
          width: 5,
        )
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Texto1"),
          Text("Texto2"),
          Text("Texto3"),
        ],
      ),
    ),
  ));
}

import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating"),
      ),
      body: Center(
        child: Text("Olá, Mundo!"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          print("Floating Clicando");
        },
        label: Icon(Icons.ad_units),
        backgroundColor: Colors.deepPurple,
        tooltip: "mostrar",
        focusElevation: 40,
        focusColor: Colors.green,
        shape: CircleBorder(),
        //shape: BeveledRectangleBorder(
        //  borderRadius: BorderRadius.circular(40)
        //),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: Row(
          children: [
            IconButton(
              tooltip: "teste",
              color: Colors.white,
                onPressed: () {

                },
                icon: Icon(Icons.menu_book)
            ),
            IconButton(
                tooltip: "butuon",
                color: Colors.yellow,
                onPressed: () {

                },
                icon: Icon(Icons.account_balance)
            ),
          ],
        ),
      ),
    );
  }
}
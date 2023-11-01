import 'package:abas/Pagina1.dart';
import 'package:abas/Pagina2.dart';
import 'package:abas/Pagina3.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(
      length: 3, 
      vsync: this,
      initialIndex: 0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas"),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              text: "Pagina1",
              icon: Icon(Icons.account_circle_outlined),
            ),
            Tab(
              text: "Pagina2",
              icon: Icon(Icons.ad_units),
            ),
            Tab(
              text: "Pagina3",
              icon: Icon(Icons.add_alert_outlined),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Pagina1();
          Pagina2(),
          Pagina3(),
        ],
      )
    );
  }
}

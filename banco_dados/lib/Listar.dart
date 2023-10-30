import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
import 'package:flutter/material.dart';

class Listar extends StatefulWidget {
  const Listar({super.key});

  @override
  State<Listar> createState() => _ListarState();
}

class _ListarState extends State<Listar> {
  Banco banco = Banco();

  @override
  void initState() {
    super.initState();
    getListaProdutos();
  }

  List<Produto> listarProdutos = [];

  getListaProdutos() async {
    List lista = await banco.getProdutos();
    //zerar lista
    lista.forEach((element) { 
      Produto p = Produto();
      p.id = element["id"];
      p.nome = element["nome"];
      p.marca = element["marca"];
      p.preco = element["preco"];
      p.validade = element["validade"];
      setState(() {
        listarProdutos.add(p);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(15),
      child: ListView.builder(
        itemCount: listarProdutos.length,
        itemBuilder: (context,indice){
          return ListTile(
            title: Text(listarProdutos[indice].nome),
            subtitle: Text("Preço: R\$ ${(listarProdutos[indice].preco).toStringAsFixed(2)}, Marca: ${listarProdutos[indice].marca}"),
          );
        },
      ),
    );
  }
}
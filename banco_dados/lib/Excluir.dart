import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
import 'package:flutter/material.dart';

class Excluir extends StatefulWidget {
  const Excluir({super.key});

  @override
  State<Excluir> createState() => _ExcluirState();
}

class _ExcluirState extends State<Excluir> {
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
        itemBuilder: (context,indice) {
          return Dismissible(
            key: Key(listarProdutos[indice].id.toString()), 
            child: ListTile(
              title: Text(listarProdutos[indice].nome),
              subtitle: Text("Preço: R\$ ${(listarProdutos[indice].preco).toStringAsFixed(2)}, Marca: ${listarProdutos[indice].marca}"),
            ),
              direction: DismissDirection.startToEnd,
              background: Container(
                padding: EdgeInsets.all(15),
                color: Color.fromARGB(255, 209, 49, 38),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete_sharp,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              onDismissed: (direction) {
                banco.apagarProduto(listarProdutos[indice].id);
                listarProdutos.removeAt(indice);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Produto excluido com sucesso"),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.greenAccent,
                  ),
                );
              },
          );
        },
      ),
    );
  }
}
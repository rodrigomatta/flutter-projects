import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
import 'package:flutter/material.dart';

class Alterar extends StatefulWidget {
  const Alterar({super.key});

  @override
  State<Alterar> createState() => _AlterarState();
}

class _AlterarState extends State<Alterar> {
   Future<void> selectDate(BuildContext context) async {
    final DateTime? pegada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pegada != null) {
      String dataFormatada = "${pegada.day}/${pegada.month}/${pegada.year}";
      campoValidade.text = dataFormatada;
    }
  }
  
  Banco banco = Banco();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoMarca = TextEditingController();
  TextEditingController campoPreco = TextEditingController();
  TextEditingController campoValidade = TextEditingController();

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
            onTap: (){
              showDialog(
                context: context, 
                builder: (context) {
                  Produto p = listarProdutos[indice];
                  campoNome.text = p.nome;
                  campoMarca.text = p.marca;
                  campoPreco.text = p.preco.toString();
                  campoValidade.text = p.validade;

                  return AlertDialog(
                    title: Text("AlterarProduto"),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: "NOME",
                            ),
                            controller: campoNome,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "MARCA",
                            ),
                            controller: campoMarca,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "PREÇO",
                            ),
                            controller: campoPreco,
                          ),
                           TextField(
                            decoration: InputDecoration(
                              labelText: "Data de Validade",
                              hintText: "Selecione a data de validade",
                            ),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            controller: campoValidade,
                            readOnly: true, // Configura o campo como somente leitura
                            onTap: () {
                              selectDate(context); // Função para abrir o seletor de data
                            },
                          ),
                        ],
                      )
                    ),
                    actions: [
                      TextButton(
                        child: Text("CANCELAR"),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text("ALTERAR"),
                        onPressed: () async {
                          Produto p = Produto();
                          p.id = listarProdutos[indice].id;
                          p.nome = campoNome.text;
                          p.marca = campoMarca.text;
                          p.preco = double.parse(campoPreco.text);
                          p.validade = campoValidade.text;
                          await banco.alterarProduto(p);
                          Navigator.pop(context);
                          //Limpa a lista
                          setState(() {
                            listarProdutos.clear();
                          });
                          //Atualiza a lista de produtos após a alteração
                          getListaProdutos();
                          //Exibe uma SnackBar para informar ao usuário que o produto foi alterado
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Produto alterado com sucesso"),
                              duration: Duration(seconds: 5),
                              backgroundColor: Colors.greenAccent,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
              );
            },
          );
        },
      ),
    );
  }
}
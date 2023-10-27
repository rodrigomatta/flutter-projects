import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    Banco banco = Banco();
    Produto p = Produto();
    //banco.buscarBanco();
    p.id = 3;
    p.nome = "Soja";
    p.marca = "ISR";
    p.preco = 270.0;
    p.validade = "10/02/2097";
    //banco.salvar(p);
    banco.alterarProduto(p);
    //banco.apagarProduto(2);
    banco.getProdutos();
    return Center();
  }
}
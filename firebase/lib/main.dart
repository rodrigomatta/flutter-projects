import 'package:firebase/Principal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  //iniciaFirebase();
  autenticar();
  runApp(MaterialApp(
    home: Principal(),
    debugShowCheckedModeBanner: false,
  ));
}

//firebase autenticação
void autenticar() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth auth = FirebaseAuth.instance;
  String email = "contatu@bol.com";
  String senha = "123456"; // ao menos 6 caracteres

  //criar usuario
  // auth.createUserWithEmailAndPassword(
  //   email: email,
  //   password: senha,
  // ).then((retornoFirebase) {
  //   print("Usuario cadastrado: ${retornoFirebase.user!.email}");
  // }).catchError((erro) {
  //   print("Erro ao cadastrar: ${erro.toString()}");
  // });

  //deslogar o usuario
  //auth.signOut();

  //ver se o usuario está logado
  // User? usuario = await auth.currentUser;
  // if(usuario == null){
  //   print("usuario deslogado");
  // }else{
  //   print("usuario logado: ${usuario.email.toString()}");
  // }

  //tratamento de autenticação de usuário
  auth.signInWithEmailAndPassword(
      email: email, 
      password: senha
  ).then((usuario){
    print("usuario logado ${usuario.user!.email}");
  }).catchError((erro){
    print("Erro ao logar ${erro.toString()}");
  });
}

//firebase metodos banco raiz
// void iniciaFirebase() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseFirestore db = FirebaseFirestore.instance;
//   //inserir funcionario
//   //db.collection("funcionarios").doc("001").set({"nome": "Zé da Carrocinha", "idade": "40"});
//   //inserir usando autoincrement
//   //DocumentReference ref = await db.collection("funcionarios").add({"nome": "Maik Taison", "idade": "77"});
//   //print("Usuario inserido no indice: ${ref.toString()}");
//   //alterar um funcionário
//   //db.collection("funcionarios").doc("Rjt8cPcFoKHvwLqlodUi").set({"nome": "Zé da Manga", "idade": "77"});
//   //remover funcionario
//   //db.collection("funcionarios").doc("Rjt8cPcFoKHvwLqlodUi").delete();
//   //inserir produtos
//   // db.collection("produtos").doc("001").set({"nome": "Soja", "marca": "Tabajara", "preco": 12.3,"validade":"20/02/2001"});
//   // db.collection("produtos").doc("002").set({"nome": "Pessego", "marca": "Tabajara", "preco": 90.1,"validade":"21/03/2001"});
//   // db.collection("produtos").doc("003").set({"nome": "Arroz", "marca": "Tabajara", "preco": 20.4,"validade":"22/04/2001"});
//   // db.collection("produtos").doc("004").set({"nome": "Jiló", "marca": "Tabajara", "preco": 40.4,"validade":"23/05/2001"});
//   // db.collection("produtos").doc("005").set({"nome": "Milho", "marca": "Tabajara", "preco": 60.4,"validade":"24/06/2001"});
//   // db.collection("produtos").doc("006").set({"nome": "Trigo", "marca": "Tabajara", "preco": 80.4,"validade":"25/07/2001"});
//   // db.collection("produtos").doc("007").set({"nome": "Trigo", "marca": "Tabijara", "preco": 87.4,"validade":"25/07/2002"});
//   // db.collection("produtos").doc("008").set({"nome": "Trigometrica", "marca": "Tangajara", "preco": 84.4,"validade":"25/07/2001"});
//   // DocumentSnapshot snapshot = await db.collection("produtos").doc("005").get();
//   // print("Nome: ${snapshot.get("nome")}");
//   // print("Marca: ${snapshot.get("marca")}");
//   // print("Preço: ${snapshot.get("preco").toString()}");
//   // print("Validade: ${snapshot.get("validade")}");
//   //recuperar todos os produtos
//   // QuerySnapshot todos = await db.collection("produtos").get();
//   // todos.docs.forEach((documento) {
//   //   var dado = documento.data() as Map<String,dynamic>;
//   //   print("Nome: ${dado["nome"]}, Preço: R\$ ${dado["preco"].toString()}");
//   // });
//   //ouvindo as mudanças no banco firebase
//   // db.collection("produtos").snapshots().listen((snapshot) {
//   //   snapshot.docs.forEach((documento) {
//   //     var dado = documento.data() as Map<String,dynamic>;
//   //     print("Nome: ${dado["nome"]}, Preço: R\$ ${dado["preco"].toString()}");
//   //   });
//   // });
//   //filtros
//   //QuerySnapshot todos = await db.collection("produtos").where("marca",isEqualTo: "Tabajara").get();
//   // QuerySnapshot todos = await db.collection("produtos").where("preco",isLessThan: 50).orderBy("nome", descending: false).limit(2).get();
//   // todos.docs.forEach((documento) {
//   //   var dado = documento.data() as Map<String,dynamic>;
//   //   print("Nome: ${dado["nome"]}, Marca: ${dado["marca"]}, Preço: R\$ ${dado["preco"].toString()}");
//   // });
//   var pesquisa = "T";
//   QuerySnapshot todos = await db.collection("produtos").where("nome",isGreaterThanOrEqualTo: pesquisa).where("nome",isLessThanOrEqualTo: pesquisa+"\uf8ff").get();
//   todos.docs.forEach((documento) {
//     var dado = documento.data() as Map<String,dynamic>;
//     print("Nome: ${dado["nome"]}, Marca: ${dado["marca"]}, Preço: R\$ ${dado["preco"].toString()}");
//   });
// }
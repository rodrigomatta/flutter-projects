import 'package:flutter/material.dart';
import 'package:projeto_login/TelaLogada.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  TextEditingController campoUsuario = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  bool senha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Login"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("image/Nicolas-Cage.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Informe o usuário",
                  ),
                  controller: campoUsuario,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Informe a senha",
                  ),
                  controller: campoSenha,
                  obscureText: senha,
                  onTap: () {
                    setState(() {
                      senha = !senha;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Ex: receberia usuário e senha para fazer consulta ao banco
                  String usuarioBanco = "admin";
                  String senhaBanco = "1234";

                  if (campoUsuario.text == usuarioBanco && campoSenha.text == senhaBanco) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaLogada(),
                      ),
                    );
                  }
                },
                child: Text("LOGAR"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Ação para "Esqueci a senha"
                    },
                    child: Text("Esqueci a senha"),
                  ),
                  TextButton(
                    onPressed: () {
                      // Ação para "Registrar"
                    },
                    child: Text("Registrar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

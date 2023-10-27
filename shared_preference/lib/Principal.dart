import 'package:flutter/material.dart';
import 'package:shared_preference/Tela2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  TextEditingController campoUsuario = TextEditingController();
  TextEditingController campoSenha = TextEditingController();

  salvarDados(String usuario, String senha) async {
    print("salvando dados");
    final pref = await SharedPreferences.getInstance();
    await pref.setString("usuario", usuario);
    await pref.setString("senha", senha);
  }

  excluirDados() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove("usuario");
    await pref.remove("senha");
  }

  lerdados() async {
    print("buscando dados");
    final pref = await SharedPreferences.getInstance();
    String usuario = pref.getString('usuario') ?? "";
    String senha = pref.getString('senha') ?? "";
    if (usuario == 'admin' && senha = '123') {
      Navigator.push(
        context, MaterialPageRoute(
        builder: (context)=>Tela2(usuario, senha)
      )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //salvarDados();
    lerdados();

    return Scaffold(
      appBar: AppBar(
        title: Text("Tela 1 shared preferences"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "USUARIO"
              ),
              controller: campoUsuario,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "SENHA"
              ),
              controller: campoSenha,
            ),
            ElevatedButton(
                onPressed: (){
                  salvarDados(campoUsuario.text, campoSenha.text);
                  if (campoUsuario.text == "admin" && campoSenha.text == "123") {
                    //comparação com banco de dados
                    Navigator.push(
                        context, MaterialPageRoute (
                          builder: (context)=>Tela2(campoUsuario.text,campoSenha.text)
                        )
                    );
                  }
                },
                child: Text("LOGAR")
            )
          ],
        )
        ,
      ),
    );
  }
}

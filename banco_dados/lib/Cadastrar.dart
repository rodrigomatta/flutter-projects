import 'package:banco_dados/Banco.dart';
import 'package:banco_dados/Produto.dart';
import 'package:flutter/material.dart';

// Definindo a classe Cadastrar como um StatefulWidget
class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  // Método que cria o estado associado ao widget
  @override
  State<Cadastrar> createState() => _CadastrarState();
}

// Classe que representa o estado do widget Cadastrar
class _CadastrarState extends State<Cadastrar> {
  // Função assíncrona para selecionar a data
  Future<void> selectDate(BuildContext context) async {
    // Exibe um seletor de data e aguarda a seleção do usuário
    final DateTime? pegada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    
    // Verifica se o usuário selecionou uma data
    if (pegada != null) {
      // Formata a data selecionada
      String dataFormatada = "${pegada.day}/${pegada.month}/${pegada.year}";
      
      // Preenche o campo de validade com a data formatada
      campoValidade.text = dataFormatada;
    }
  }

  // Cria uma instância do banco de dados
  Banco banco = Banco();

  // Controladores para os campos de texto
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoMarca = TextEditingController();
  TextEditingController campoPreco = TextEditingController();
  TextEditingController campoValidade = TextEditingController();

  // Método que constrói a interface do widget
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de entrada para o nome do produto
            TextField(
              decoration: InputDecoration(
                labelText: "Nome do Produto",
                hintText: "Informe o nome"
              ),
              style: TextStyle(
                fontSize: 16,
              ),
              controller: campoNome,
            ),
            // Campo de entrada para a marca do produto
            TextField(
              decoration: InputDecoration(
                labelText: "Marca do produto",
                hintText: "Informe a marca"
              ),
              style: TextStyle(
                fontSize: 16,
              ),
              controller: campoMarca,
            ),
            // Campo de entrada para o preço do produto
            TextField(
              decoration: InputDecoration(
                labelText: "Preço do produto",
                hintText: "Informe o preço"
              ),
              style: TextStyle(
                fontSize: 16,
              ),
              controller: campoPreco,
            ),
            // Campo de entrada para a data de validade (apresenta um seletor de data)
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
            // Botão para salvar os dados do produto no banco
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                child: Text("SALVAR"),
                onPressed: (){
                  print("SALVANDO PRODUTO");
                  
                  // Cria uma instância de Produto e preenche com os dados dos campos
                  Produto p = Produto();
                  p.nome = campoNome.text;
                  p.marca = campoMarca.text;
                  p.preco = double.parse(campoPreco.text);
                  p.validade = campoValidade.text;
                  
                  // Salva o produto no banco de dados
                  banco.salvar(p);

                  // Limpa os campos de entrada
                  campoNome.text = "";
                  campoMarca.text = "";
                  campoPreco.text = "";
                  campoValidade.text = "";

                  // Exibe uma mensagem de sucesso
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Produto adicionado com sucesso"),
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.greenAccent,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

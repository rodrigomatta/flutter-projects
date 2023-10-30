import 'package:banco_dados/Produto.dart'; // Importa a classe Produto de um módulo externo.
import 'package:sqflite/sqflite.dart'; // Importa a biblioteca sqflite para trabalhar com SQLite.
import 'package:path/path.dart'; // Importa a biblioteca path para manipular caminhos de arquivos.

class Banco {
  buscarBanco() async {
    final caminhoBanco = await getDatabasesPath(); // Obtém o caminho padrão para o diretório de bancos de dados do dispositivo.
    final localBanco = join(caminhoBanco, "banco.db"); // Une o caminho com o nome do arquivo do banco de dados.

    var bancoDados = await openDatabase(
      localBanco,
      version: 3, // Versão do banco de dados.
      onCreate: (banco, versaoMaisRecente) {
        // Define a estrutura da tabela quando o banco é criado pela primeira vez.
        String sql = "CREATE TABLE produtos(id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, marca VARCHAR, preco REAL, validade VARCHAR)";
        banco.execute(sql);
      }
    );
    print("---->" + bancoDados.isOpen.toString()); // Verifica se o banco de dados está aberto.
    return bancoDados; // Retorna o objeto de banco de dados.
  }

  salvar(Produto p) async {
    Database banco = await buscarBanco(); // Abre o banco de dados.
    Map<String, dynamic> produto = {
      "nome": p.nome,
      "marca": p.marca,
      "preco": p.preco,
      "validade": p.validade
    };
    int id = await banco.insert("produtos", produto); // Insere um produto na tabela 'produtos'.
    print("Produto salvo com ID: ${id}"); // Exibe o ID do produto salvo.
  }

  getProdutos() async {
    Database banco = await buscarBanco(); // Abre o banco de dados.
    List produtos = await banco.rawQuery("SELECT * FROM produtos ORDER BY nome asc"); // Executa uma consulta SQL para obter todos os produtos ordenados por nome.

    // Exemplos de consultas SQLite
    // List produtos = await banco.rawQuery("SELECT * FROM produtos WHERE nome='Milho'");
    // List produtos = await banco.rawQuery("SELECT * FROM produtos WHERE preco >= 110 and preco <= 200");
    // List produtos = await banco.rawQuery("SELECT * FROM produtos WHERE nome LIKE `%lho`");
    // List produtos = await banco.rawQuery("SELECT * FROM produtos ORDER BY nome desc LIMIT 2");

    print(produtos.toString()); // Exibe os produtos recuperados.
    return produtos; // Retorna a lista de produtos.
  }

  getProduto(int id) async {
    Database banco = await buscarBanco(); // Abre o banco de dados.
    List produto = await banco.query(
      "produtos",
      columns: ["id", "nome", "marca", "preco", "validade"],
      where: "id=?",
      whereArgs: [id]
    );
    return produto[0]; // Retorna o primeiro produto encontrado com o ID especificado.
  }

    apagarProduto(int id) async{
    Database banco = await buscarBanco(); // Abre o banco de dados.
    int linhasExcluidas = await banco.delete(
      "produtos",
      where: "id=?",
      whereArgs: [id]
    );
    print("linhas excluidas: "+linhasExcluidas.toString());
  }

  alterarProduto(Produto p) async {
    Database banco = await buscarBanco(); // Abre o banco de dados.
    Map<String, dynamic> dadosDoProduto = {
      "nome":p.nome,
      "marca":p.marca,
      "preco":p.preco,
      "validade":p.validade,
    };
    int numeroMudancas = await banco.update(
      "produtos",
      dadosDoProduto,
      where: "id=?",
      whereArgs: [p.id]
    );
    print("Quantidade de itens alterados: ${numeroMudancas.toString()}");
  }
}

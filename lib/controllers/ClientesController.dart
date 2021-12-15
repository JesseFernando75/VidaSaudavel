import 'package:mysql1/mysql1.dart';
import '../database/mysql.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientesController {
  void cadastrarCliente(nome, idade, login, senha) async {
    Mysql db = new Mysql();
    Map<String, String> data = new Map();

    data["nome"] = nome;
    data["idade"] = idade;
    data["login"] = login;
    data["senha"] = senha;

    db.insert("cliente", data);
  }

  Future<bool> verificaLogin(login, senha) async {
    Mysql db = new Mysql();
    bool retorno = false;

    MySqlConnection connection = await db.getConnection();
    print("Conectado ao banco de dados.");

    var resultado = await connection.query(
        "SELECT id FROM cliente WHERE BINARY login = ? AND BINARY senha = ?",
        [login, senha]);

    if (resultado.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id_cliente', resultado.first.elementAt(0).toString());
      retorno = true;
    }
    connection.close();
    print("Conexão com o banco de dados fechada.");

    print(retorno);
    return Future.value(retorno);
  }
}

import '../database/mysql.dart';

class ClientesController {
  int _authuser;
  bool _validado;

  int getAuthUser() {
    return this._authuser;
  }

  bool getValidado() {
    return this._validado;
  }

  void cadastrarCliente(nome, idade, login, senha) {
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

    db.getConnection().then((connection) async {
      print("Conectado ao banco de dados.");

      var resultado = await connection.query(
          "SELECT id, login, senha FROM cliente WHERE BINARY login = ? AND BINARY senha = ?",
          [login, senha]);

      if (resultado.isNotEmpty) {
        _authuser = resultado.first.elementAt(0);
        _validado = true;
      } else {
        _authuser = null;
        _validado = false;
      }

      connection.close();
      print("Conexão com o banco de dados fechada.");
    });
    print(_validado);
    return _validado;
  }
}

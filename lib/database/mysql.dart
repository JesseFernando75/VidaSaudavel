import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '192.168.0.104',
      user = 'root',
      password = 'alpha619',
      db = 'vida_saudavel';
  static int port = 3306;

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }

  void insert(String table, Map<String, String> data) async {
    MySqlConnection connection = await getConnection();
    print("Conectado ao banco de dados.");

    String query = "";
    String keys = "";
    String values = "(";

    keys = data.keys.toString();
    data.values.forEach((v) => values += "'$v', ");
    values = values.substring(0, values.length - 2);
    values += ")";

    query = "INSERT INTO $table $keys VALUES $values";
    print(query);

    connection.query(query);
    connection.close();
    print("Conexão com o banco de dados fechada.");
  }

  void update(String table, Map<String, String> data, String id) async {
    MySqlConnection connection = await getConnection();
    print("Conectado ao banco de dados.");

    String query = "";
    String values = "";

    data.forEach((key, value) => values += "$key = '$value', ");
    values = values.substring(0, values.length - 2);

    query = "UPDATE $table SET $values WHERE id = $id";
    print(query);

    connection.query(query);
    connection.close();
    print("Conexão com o banco de dados fechada.");
  }
}

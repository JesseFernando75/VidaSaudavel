import 'package:mysql1/mysql1.dart';
import '../database/mysql.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class ReceitasController {
  Future<void> cadastrarReceita(
      categoria, nome, descricao, ingredientes, modopreparo, imagem) async {
    Mysql db = new Mysql();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> data = new Map();

    data["id_cliente"] = prefs.getString('id_cliente') ?? '';
    data["id_categoria"] = categoria.toString();
    data["nome"] = nome;
    data["descricao"] = descricao;
    data["ingredientes"] = ingredientes;
    data["modo_preparo"] = modopreparo;
    data["imagem"] = imagem;

    db.insert("receita", data);
  }

  Future<void> editarReceita(
      id, categoria, nome, descricao, ingredientes, modopreparo, imagem) async {
    Mysql db = new Mysql();
    Map<String, String> data = new Map();

    data["id_categoria"] = categoria.toString();
    data["nome"] = nome;
    data["descricao"] = descricao;
    data["ingredientes"] = ingredientes;
    data["modo_preparo"] = modopreparo;
    data["imagem"] = imagem;

    db.update("receita", data, id);
  }

  Future<Results> obterReceitaPorCategoria(String idcategoria) async {
    Random random = new Random();
    int randomNumber = 0, idaleatorio = 0;
    Mysql db = new Mysql();
    MySqlConnection connection = await db.getConnection();

    print("Conectado ao banco de dados.");

    var resultado = await connection
        .query("SELECT * FROM receita WHERE id_categoria = ?", [idcategoria]);

    if (resultado.length == 0) {
      return resultado;
    }

    randomNumber = random.nextInt(resultado.length);
    idaleatorio = resultado.elementAt(randomNumber).first;

    Results resultado2 = await connection
        .query("SELECT * FROM receita WHERE id = ?", [idaleatorio]);

    print(resultado2);
    connection.close();
    print("Conexão com banco de dados fechada.");

    return Future.value(resultado2);
  }

  Future<Results> obterReceitaPorId(String id) async {
    Mysql db = new Mysql();
    MySqlConnection connection = await db.getConnection();

    print("Conectado ao banco de dados.");

    var resultado =
        await connection.query("SELECT * FROM receita WHERE id = ?", [id]);

    print(resultado);
    connection.close();
    print("Conexão com banco de dados fechada.");

    return Future.value(resultado);
  }

  Future<Results> obterReceitaPorCliente() async {
    Mysql db = new Mysql();
    MySqlConnection connection = await db.getConnection();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print("Conectado ao banco de dados.");

    var resultado = await connection.query(
        "SELECT * FROM receita WHERE id_cliente = ?",
        [prefs.getString('id_cliente') ?? '']);

    print(resultado);
    connection.close();
    print("Conexão com banco de dados fechada.");

    return Future.value(resultado);
  }

  Future<void> excluirReceita(String id) async {
    Mysql db = new Mysql();
    MySqlConnection connection = await db.getConnection();

    print("Conectado ao banco de dados.");

    var resultado =
        await connection.query("DELETE FROM receita WHERE id = ?", [id]);

    print(resultado);
    connection.close();
    print("Conexão com banco de dados fechada.");
  }
}

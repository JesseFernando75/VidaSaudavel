import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vida_saudavel/controllers/ReceitasController.dart';
import 'package:vida_saudavel/views/edicaodereceita.dart';
import 'cadastrodereceita.dart';

class ReceitasCliente extends StatefulWidget {
  @override
  _ReceitasClienteState createState() => _ReceitasClienteState();
}

class _ReceitasClienteState extends State<ReceitasCliente> {
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  final ReceitasController receita = new ReceitasController();
  var resultado;
  bool vazio = false;
  String id = "";

  getData() async {
    var resultado1 = await receita.obterReceitaPorCliente();

    setState(() {
      if (resultado1.isNotEmpty) {
        resultado = resultado1;
      } else {
        vazio = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  showAlertDialog(BuildContext context) {
    Widget cancelaButton = ElevatedButton(
      child: Text("Cancelar"),
      style: ElevatedButton.styleFrom(
        primary: BACKGROUNDCOLOR,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continuaButton = ElevatedButton(
      child: Text("Excluir"),
      onPressed: () {
        Navigator.pop(context);
        receita.excluirReceita(id);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Receita excluída com sucesso.')));
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Excluir?"),
      content: Text(
          "Você realmente deseja excluir essa receita? Essa ação é irreversível."),
      actions: [
        continuaButton,
        cancelaButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suas receitas"),
        backgroundColor: BUTTONCOLOR,
      ),
      backgroundColor: BACKGROUNDCOLOR,
      body: GridView.count(
        padding: EdgeInsets.all(30),
        crossAxisCount: 1,
        children: [
          if (resultado == null)
            Center(
              child: Text(
                "Você não cadastrou nenhuma receita",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          if (resultado != null)
            for (var i in resultado)
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: new InkWell(
                  onTap: () {
                    id = i[0].toString();
                    print(id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              EdicaodeReceita(id: id)),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        width: 300,
                        height: 200,
                        image: "${i[7].toString()}" != ""
                            ? FileImage(File(i[7].toString()))
                            : AssetImage("assets/receitaunknown.jpg")
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${i[3].toString()}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${i[4].toString()}",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            child: const Text('Excluir'),
                            onPressed: () {
                              id = i[0].toString();
                              showAlertDialog(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Cadastrodereceita()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: BUTTONCOLOR,
      ),
    );
  }
}

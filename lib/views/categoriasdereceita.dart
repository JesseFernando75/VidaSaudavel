import 'package:flutter/material.dart';
import 'package:vida_saudavel/views/descricaoreceita.dart';
import '../controllers/ReceitasController.dart';

class CategoriasdeReceita extends StatefulWidget {
  @override
  _CategoriasdeReceitaState createState() => _CategoriasdeReceitaState();
}

class _CategoriasdeReceitaState extends State<CategoriasdeReceita> {
  final ReceitasController receita = new ReceitasController();

  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias de receita"),
        backgroundColor: BUTTONCOLOR,
      ),
      backgroundColor: BACKGROUNDCOLOR,
      body: GridView.count(
        padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
        crossAxisCount: 1,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: new InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Descricaoreceita(categoria: "1")),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.coffee_maker_sharp,
                    size: 70,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Café da manhã",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: new InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Descricaoreceita(categoria: "2")),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.fastfood_rounded,
                    size: 70,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Almoço",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: new InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Descricaoreceita(categoria: "3")),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.dinner_dining,
                    size: 70,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Jantar",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

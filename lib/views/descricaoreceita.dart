import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vida_saudavel/controllers/ReceitasController.dart';

class Descricaoreceita extends StatefulWidget {
  Descricaoreceita({required this.categoria});
  final String categoria;

  @override
  DescricaoreceitaState createState() => DescricaoreceitaState();
}

class DescricaoreceitaState extends State<Descricaoreceita> {
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  final ReceitasController receita = new ReceitasController();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _ingredientesController = TextEditingController();
  final TextEditingController _modopreparoController = TextEditingController();
  String _imgController = "";
  int _categoria = 1;

  void getData() async {
    var resultado =
        await receita.obterReceitaPorCategoria(widget.categoria.toString());

    if (resultado.isNotEmpty) {
      setState(() {
        _categoria = resultado.first.elementAt(2);
        _nomeController.text = resultado.first.elementAt(3);
        _descricaoController.text = resultado.first.elementAt(4);
        _ingredientesController.text = resultado.first.elementAt(5).toString();
        _modopreparoController.text = resultado.first.elementAt(6).toString();
        _imgController = resultado.first.elementAt(7).toString();
      });
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
                'Não há nenhuma receita cadastratada para essa categoria')),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Receita"),
        backgroundColor: BUTTONCOLOR,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 40, right: 40),
        color: BACKGROUNDCOLOR,
        child: Form(
          child: ListView(children: <Widget>[
            GestureDetector(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: _imgController != ""
                            ? FileImage(File(_imgController))
                            : AssetImage("assets/receitaunknown.jpg")
                                as ImageProvider,
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                keyboardType: TextInputType.name,
                readOnly: true,
                controller: _nomeController,
                decoration: InputDecoration(
                    labelText: "Nome da receita",
                    labelStyle: TextStyle(
                      height: 0.1,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    )),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                readOnly: true,
                maxLines: null,
                controller: _descricaoController,
                decoration: InputDecoration(
                    labelText: "Descrição da receita",
                    labelStyle: TextStyle(
                      height: 0.1,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            SizedBox(
              height: 20,
            ),
            DropdownButton(
              isExpanded: true,
              value: _categoria,
              icon: const Icon(Icons.arrow_downward),
              items: [
                DropdownMenuItem(
                  child: Text("Café da manhã"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Almoço"),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Jantar"),
                  value: 3,
                ),
              ],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  backgroundColor: BUTTONCOLOR),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                readOnly: true,
                maxLines: null,
                controller: _ingredientesController,
                decoration: InputDecoration(
                    labelText: "Ingredientes",
                    labelStyle: TextStyle(
                      height: 0.1,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                keyboardType: TextInputType.multiline,
                readOnly: true,
                maxLines: null,
                controller: _modopreparoController,
                decoration: InputDecoration(
                    labelText: "Modo de preparo",
                    labelStyle: TextStyle(
                      height: 0.1,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            SizedBox(
              height: 30,
            ),
          ]),
        ),
      ),
    );
  }
}

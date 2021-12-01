import 'package:flutter/material.dart';
import 'package:vida_saudavel/views/edicaodecliente.dart';
import '../controllers/ClientesController.dart';
import 'package:flutter/services.dart';

class Cadastrodereceita extends StatefulWidget {
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  @override
  _CadastrodereceitaState createState() => _CadastrodereceitaState();
}

class _CadastrodereceitaState extends State<Cadastrodereceita> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final ClientesController cliente = new ClientesController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _ingredientesController = TextEditingController();
  final TextEditingController _modopreparoController = TextEditingController();
  int _categoria = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de receita"),
        backgroundColor: Cadastrodereceita.BUTTONCOLOR,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 40, right: 40),
        color: Cadastrodereceita.BACKGROUNDCOLOR,
        child: Form(
          key: _formkey,
          child: ListView(children: <Widget>[
            GestureDetector(
              child: Container(
                width: 140.0,
                height: 140.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {},
            ),
            TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome da receita';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                controller: _nomeController,
                decoration: InputDecoration(
                    labelText: "Digite o nome da receita",
                    labelStyle: TextStyle(
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a descrição';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: _descricaoController,
                decoration: InputDecoration(
                    labelText: "Descreva sua receita",
                    labelStyle: TextStyle(
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
                  backgroundColor: EdicaoCliente.BUTTONCOLOR),
              onChanged: (value) {
                setState(() {
                  _categoria = value as int;
                });
              },
              hint: Text("Selecione uma opção"),
            ),
            TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe os ingredientes';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: _ingredientesController,
                decoration: InputDecoration(
                    labelText: "Liste os ingredientes por linha",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o modo de preparo';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: _modopreparoController,
                decoration: InputDecoration(
                    labelText: "Descreva o modo de preparo",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    )),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  primary: Cadastrodereceita.BUTTONCOLOR,
                ),
                child: Text("Cadastrar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                onPressed: () {
                  print(_categoria);
                }),
          ]),
        ),
      ),
    );
  }
}

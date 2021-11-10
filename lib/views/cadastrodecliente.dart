import 'package:flutter/material.dart';
import '../controllers/ClientesController.dart';
import 'package:flutter/services.dart';

class Cadastrodecliente extends StatelessWidget {
  final ClientesController cliente = new ClientesController();
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastre-se"),
        backgroundColor: BUTTONCOLOR,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: BACKGROUNDCOLOR,
        child: ListView(children: <Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset("assets/healthcare.png"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
              keyboardType: TextInputType.name,
              controller: _nomeController,
              decoration: InputDecoration(
                  labelText: "Digite seu nome",
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
          TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              controller: _idadeController,
              decoration: InputDecoration(
                  labelText: "Digite sua idade",
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
          TextFormField(
              keyboardType: TextInputType.text,
              controller: _loginController,
              decoration: InputDecoration(
                  labelText: "Digite seu login",
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
              keyboardType: TextInputType.text,
              controller: _senhaController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha",
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
            height: 25,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                primary: BUTTONCOLOR,
              ),
              child: Text("Cadastrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              onPressed: () {
                cliente.cadastrarCliente(
                    _nomeController.text,
                    _idadeController.text,
                    _loginController.text,
                    _senhaController.text);
              }),
        ]),
      ),
    );
  }
}

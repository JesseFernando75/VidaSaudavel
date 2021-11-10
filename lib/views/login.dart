import 'package:flutter/material.dart';
import '../controllers/ClientesController.dart';
import '../views/cadastrodecliente.dart';

class Login extends StatefulWidget {
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ClientesController cliente = new ClientesController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Login.BACKGROUNDCOLOR,
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
              keyboardType: TextInputType.text,
              controller: _loginController,
              decoration: InputDecoration(
                  labelText: "Login",
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
              primary: Login.BUTTONCOLOR,
            ),
            child: Text("Entrar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
            onPressed: () async {
              if (await cliente.verificaLogin(
                  _loginController.text, _senhaController.text)) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Cadastrodecliente()));
              }
            },
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            style: TextButton.styleFrom(
              alignment: Alignment.bottomRight,
            ),
            child: Text("Não tem conta? Cadastre-se",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Cadastrodecliente()));
            },
          ),
        ]),
      ),
    );
  }
}

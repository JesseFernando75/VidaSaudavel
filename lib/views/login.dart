import 'package:flutter/material.dart';
import 'package:vida_saudavel/views/Principal.dart';
import '../controllers/ClientesController.dart';
import '../views/cadastrodecliente.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final ClientesController cliente = new ClientesController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: BACKGROUNDCOLOR,
        child: Form(
          key: _formkey,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o login';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: _loginController,
                decoration: InputDecoration(
                    labelText: "Login",
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a senha';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                controller: _senhaController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    labelText: "Senha",
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
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                primary: BUTTONCOLOR,
              ),
              child: Text("Entrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  if (await cliente.verificaLogin(
                      _loginController.text, _senhaController.text)) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Principal()),
                        (Route<dynamic> route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: BUTTONCOLOR,
                          content: Text('Usuário ou senha incorretos.')),
                    );
                  }
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
                        builder: (BuildContext context) =>
                            Cadastrodecliente()));
              },
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../controllers/ClientesController.dart';

class Login extends StatelessWidget {
  final ClientesController cliente = new ClientesController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Cadastre-se'),
            ),
            body: Column(
              children: <Widget>[
                TextField(
                  controller: _loginController,
                  decoration: InputDecoration(labelText: "Login"),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: _senhaController,
                  decoration: InputDecoration(labelText: "Senha"),
                  keyboardType: TextInputType.visiblePassword,
                ),
                ElevatedButton(child: Text('Cadastrar'), onPressed: () {})
              ],
            )));
  }
}

import 'package:flutter/material.dart';
import '../controllers/ClientesController.dart';
import 'package:flutter/services.dart';

class Cadastrodecliente extends StatelessWidget {
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final ClientesController cliente = new ClientesController();
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
                    return 'Informe o seu nome';
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe sua idade';
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o login';
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a senha';
                  } else if (value.length < 6) {
                    return 'A senha deve ter no mínimo seis caracteres';
                  }
                  return null;
                },
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
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    if (await cliente.cadastrarCliente(
                        _nomeController.text,
                        _idadeController.text,
                        _loginController.text,
                        _senhaController.text)) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Usuário cadastrado com sucesso.')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Usuário cadastrado com sucesso.')),
                      );
                    }
                  }
                }),
          ]),
        ),
      ),
    );
  }
}

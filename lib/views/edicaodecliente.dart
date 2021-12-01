import 'package:flutter/material.dart';
import 'package:vida_saudavel/views/login.dart';

class EdicaoCliente extends StatelessWidget {
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sua conta"),
        backgroundColor: BUTTONCOLOR,
      ),
      body: Container(
        color: BACKGROUNDCOLOR,
        child: Row(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  primary: BUTTONCOLOR,
                ),
                child: Text("Sair",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()),
                      (Route<dynamic> route) => false);
                }),
          ],
        ),
      ),
    );
  }
}

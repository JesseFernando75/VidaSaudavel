import 'dart:io';
import 'package:flutter/material.dart';
import '../controllers/ReceitasController.dart';
import 'package:image_picker/image_picker.dart';

class EdicaodeReceita extends StatefulWidget {
  EdicaodeReceita({required this.id});
  final String id;

  @override
  _EdicaodeReceitaState createState() => _EdicaodeReceitaState();
}

class _EdicaodeReceitaState extends State<EdicaodeReceita> {
  static const BUTTONCOLOR = Color.fromRGBO(235, 116, 94, 1.0);
  static const BACKGROUNDCOLOR = Color.fromRGBO(38, 50, 56, 1.0);

  final ReceitasController receita = new ReceitasController();

  getData() async {
    var resultado = await receita.obterReceitaPorId(widget.id);

    setState(() {
      if (resultado.isNotEmpty) {
        _categoria = resultado.first.elementAt(2);
        _nomeController.text = resultado.first.elementAt(3);
        _descricaoController.text = resultado.first.elementAt(4);
        _ingredientesController.text = resultado.first.elementAt(5).toString();
        _modopreparoController.text = resultado.first.elementAt(6).toString();
        _imgController = resultado.first.elementAt(7).toString();
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Houve um erro ao carregar a receita')),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _ingredientesController = TextEditingController();
  final TextEditingController _modopreparoController = TextEditingController();
  String _imgController = "";
  int _categoria = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edição de receita"),
        backgroundColor: BUTTONCOLOR,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 40, right: 40),
        color: BACKGROUNDCOLOR,
        child: Form(
          key: _formkey,
          child: ListView(children: <Widget>[
            GestureDetector(
              child: Container(
                width: 180,
                height: 180,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: BUTTONCOLOR,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ))),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: _imgController != ""
                          ? FileImage(File(_imgController))
                          : AssetImage("assets/receitaunknown.jpg")
                              as ImageProvider,
                      fit: BoxFit.cover),
                ),
              ),
              onTap: () {
                ImagePicker()
                    .pickImage(source: ImageSource.gallery)
                    .then((file) {
                  if (file == null) return;
                  setState(() {
                    _imgController = file.path;
                  });
                });
              },
            ),
            SizedBox(
              height: 20,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a descrição';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _descricaoController,
                decoration: InputDecoration(
                    labelText: "Descreva sua receita",
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
              onChanged: (value) {
                setState(() {
                  _categoria = value as int;
                });
              },
              hint: Text("Selecione uma opção"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe os ingredientes';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _ingredientesController,
                decoration: InputDecoration(
                    labelText: "Liste os ingredientes por linha",
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
                    return 'Informe o modo de preparo';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _modopreparoController,
                decoration: InputDecoration(
                    labelText: "Descreva o modo de preparo",
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  primary: BUTTONCOLOR,
                ),
                child: Text("Editar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    receita.editarReceita(
                        widget.id,
                        _categoria,
                        _nomeController.text,
                        _descricaoController.text,
                        _ingredientesController.text,
                        _modopreparoController.text,
                        _imgController);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Receita editada com sucesso.')),
                    );
                  }
                }),
            SizedBox(
              height: 30,
            )
          ]),
        ),
      ),
    );
  }
}

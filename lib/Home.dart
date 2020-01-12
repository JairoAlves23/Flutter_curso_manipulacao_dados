import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() {
    
  }

  _recuperarDados() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Nada Salvo"),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite Algo",
              ),
              controller: _controllerCampo,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  child: Text("Salvar", style: TextStyle(fontSize: 20)),
                  textColor: Colors.white,
                  onPressed: _salvar,
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text("Recuperar", style: TextStyle(fontSize: 20)),
                  textColor: Colors.white,
                  onPressed: _recuperarDados,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String _textoSalvo = "Nada Salvo";
  TextEditingController _controllerCampo = TextEditingController();
  
  _salvar() async {
    
    String valorDigitado = _controllerCampo.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);
    print("Operação (salvar):$valorDigitado"); 
    
    
  }

  _recuperarDados() async {

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _textoSalvo = prefs.getString("nome") ?? ("Sem valor");
    });
    print("Operação (recuperação):$_textoSalvo"); 
  }

  _remover() async {
    
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");
    print("Operação (remover)"); 

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
            Text(_textoSalvo),
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
                ),
                RaisedButton(
                  color: Colors.blue,
                  child: Text("Remover", style: TextStyle(fontSize: 20)),
                  textColor: Colors.white,
                  onPressed: _remover,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

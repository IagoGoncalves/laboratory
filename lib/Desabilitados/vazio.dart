import 'package:flutter/material.dart';

class Vazios extends StatefulWidget {
  @override
  _VaziosState createState() => _VaziosState();
}

class _VaziosState extends State<Vazios> {
  GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();

  TextEditingController pesoAAController = TextEditingController();
  TextEditingController pesoSSController = TextEditingController();
  TextEditingController pesoImersoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vazios"),
        flexibleSpace: Opacity(
          opacity: 0.7,
          child: Image(
            image: AssetImage('images/red.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetaValores();
              }),
        ],
      ),
      body: widgetBody(),
    );
  }

  widgetBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Form(
        key: _formkey1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            titulo(),
            pesoAA(),
            pesoSS(),
            pesoImerso(),
            vazioButton(),
            calcula(),
            resultado(),
          ],
        ),
      ),
    );
  }

  void _resetaValores() {
    setState(() {
      // _resultado = "";

      pesoAAController.text = "";
      pesoSSController.text = "";
      pesoImersoController.text = "";
    });
  }

  titulo() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "VAZIOS",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  pesoAA() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Peso Ao Ar",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: pesoAAController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe o valor do Peso Ao Ar';
        }
        return null;
      },
    );
  }

  pesoSS() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Peso Saturado",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: pesoSSController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe o valor do Peso Saturado';
        }
        return null;
      },
    );
  }

  pesoImerso() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Peso Imerso",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: pesoImersoController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe o valor do Peso Imerso';
        }
        return null;
      },
    );
  }

  vazioButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 35.0,
      child: RaisedButton(
        onPressed: () {
          if (_formkey1.currentState.validate()) {
            // calcula();
            // resultado();
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text(
          "Calcular Vazio",
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        color: Colors.orange,
      ),
    );
  }

  calcula() {}

  resultado() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "a",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

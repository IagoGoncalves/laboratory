import 'package:flutter/material.dart';

class Rice extends StatefulWidget {
  @override
  _RiceState createState() => _RiceState();
}

class _RiceState extends State<Rice> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController taraController = TextEditingController();
  TextEditingController pesoAmostraController = TextEditingController();
  TextEditingController pesoAmostraAguaController = TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rice"),
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
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            titulo(),
            tara(),
            pesoAmostra(),
            pesoAmostraAgua(),
            riceButton(),
            resultado(),
          ],
        ),
      ),
    );
  }

  titulo() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "RICE",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  tara() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Tara",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: taraController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe o valor da Tara';
        }
        return null;
      },
    );
  }

  pesoAmostra() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Peso Amostra",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: pesoAmostraController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe o valor do Peso da Amostra';
        }
        return null;
      },
    );
  }

  pesoAmostraAgua() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Peso Amostra + Água",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 17,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: pesoAmostraAguaController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe o valor do Peso da Amostra + Água';
        }
        return null;
      },
    );
  }

  void _resetaValores() {
    setState(() {
      taraController.text = "";
      pesoAmostraController.text = "";
      pesoAmostraAguaController.text = "";
      result = "";
    });
  }

  riceButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 35.0,
      child: RaisedButton(
        onPressed: () {
          if (_formkey.currentState.validate()) {
            calcula();
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text(
          "Calcular Rice",
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        color: Colors.orange,
      ),
    );
  }

  void calcula() {
    setState(() {
      double tara = double.parse(taraController.text);
      double amostra = double.parse(pesoAmostraController.text);
      double amostraAgua = double.parse(pesoAmostraAguaController.text);

      double contagem = ((amostra + tara) / amostraAgua);

      if (contagem > 0) {
        result = "Rice (peso): ${contagem.toStringAsPrecision(3)}";
      } else {
        result = "Valor inválido";
      }
    });
  }

  resultado() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        result,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

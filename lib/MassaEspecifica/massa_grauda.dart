import 'package:flutter/material.dart';

class MassaEGrauda extends StatefulWidget {
  @override
  _MassaEGraudaState createState() => _MassaEGraudaState();
}

class _MassaEGraudaState extends State<MassaEGrauda> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController secaController = TextEditingController();
  TextEditingController saturadaController = TextEditingController();
  TextEditingController volumeController = TextEditingController();
  String resutReal = "";
  String resutAparente = "";
  String resutAbsorcao = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Massa E. Graúda"),
        flexibleSpace: Opacity(
          opacity: 0.9,
          child: Image(
            image: AssetImage('images/yello1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.report),
              onPressed: () {
                Navigator.pushNamed(context, '/infograuda');
              }),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _reset();
              }),
        ],
      ),
      body: widgetMassaEGraudaBody(),
    );
  }

  widgetMassaEGraudaBody() {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // tituloRice(),
              amostraSeca(),
              amostraSaturada(),
              amostraVolume(),
              buttonMGrauda(),
              resultadoMGrauda(),
            ],
          ),
        ),
      ),
    );
  }

  void _reset() {
    setState(() {
      secaController.text = "";
      saturadaController.text = "";
      volumeController.text = "";
      resutReal = "";
      resutAparente = "";
      resutAbsorcao = "";
    });
  }

  amostraSeca() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Amostra Seca",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        style: TextStyle(fontSize: 17),
        textAlign: TextAlign.center,
        controller: secaController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Informe o valor da Amostra Seca';
          }
          return null;
        },
      ),
    );
  }

  amostraSaturada() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Amostra Saturada",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        style: TextStyle(fontSize: 17),
        textAlign: TextAlign.center,
        controller: saturadaController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Informe o valor da Amostra Saturada';
          }
          return null;
        },
      ),
    );
  }

  amostraVolume() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Volume Amostra",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        style: TextStyle(fontSize: 17),
        textAlign: TextAlign.center,
        controller: volumeController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Informe o valor do Volume Amostra';
          }
          return null;
        },
      ),
    );
  }

  buttonMGrauda() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          if (_formkey.currentState.validate()) {
            calculaReal();
            calculaAparente();
            calculaAbsorcao();
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text(
          "Calcular Massa Específica Grauda",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        color: Colors.black45,
      ),
    );
  }

  void calculaReal() {
    setState(() {
      double seca = double.parse(secaController.text);
      double volume = double.parse(volumeController.text);

      double cont1 = seca / (seca - volume);

      if (cont1 >= 0) {
        resutReal = "Real: ${cont1.toStringAsPrecision(4)}";
      } else {
        resutReal = "Valor inválido";
      }
    });
  }

  void calculaAparente() {
    setState(() {
      double seca = double.parse(secaController.text);
      double saturada = double.parse(saturadaController.text);
      double volume = double.parse(volumeController.text);

      double cont2 = seca / (saturada - volume);

      if (cont2 >= 0) {
        resutAparente = "Saturada: ${cont2.toStringAsPrecision(4)}";
      } else {
        resutAparente = "Valor inválido";
      }
    });
  }

  void calculaAbsorcao() {
    setState(() {
      double seca = double.parse(secaController.text);
      double saturada = double.parse(saturadaController.text);

      double cont3 = ((saturada - seca) / seca) * 100;

      if (cont3 >= 0) {
        resutAbsorcao = "Absorção: ${cont3.toStringAsPrecision(4)}";
      } else {
        resutAbsorcao = "Valor inválido";
      }
    });
  }

  resultadoMGrauda() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "\n$resutReal \n\n$resutAparente \n\n$resutAbsorcao",
            // "Peso: $_peso e Volume: $_volume",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.purple,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}

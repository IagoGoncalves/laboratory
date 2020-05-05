import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController taraController = TextEditingController(text: '7968.7');
  TextEditingController pesoAmostraController = TextEditingController();
  TextEditingController pesoAmostraAguaController = TextEditingController();
  String rice = "";
  double riceValor = 0;

  GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  TextEditingController pesoAAController = TextEditingController();
  TextEditingController pesoSSController = TextEditingController();
  TextEditingController pesoImersoController = TextEditingController();
  String densidadeA = "";
  double densidadeAValor = 0;

  GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  String vazio = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check"),
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
                Navigator.pushNamed(context, '/infocheck');
              }),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _reset();
              }),
        ],
      ),
      body: widgetCheckBody(),
    );
  }

  widgetCheckBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                tituloRice(),
                tara(),
                pesoAmostra(),
                pesoAmostraAgua(),
                riceButton(),
                resultadoRice(),
              ],
            ),
          ),
          Form(
            key: _formkey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                tituloDensidadeA(),
                pesoAA(),
                pesoSS(),
                pesoImerso(),
                densidadeAButton(),
                resultadoDensidadeA(),
              ],
            ),
          ),
          Form(
            key: _formkey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                vazioButton(),
                resultadoVazio(),
              ],
            ),
          )
        ],
      ),
    );
  }

  tituloRice() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "RICE",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _reset1();
              })
        ],
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
          fontSize: 15,
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
          fontSize: 15,
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
          fontSize: 15,
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

  void _reset() {
    setState(() {
      taraController.text = "";
      pesoAmostraController.text = "";
      pesoAmostraAguaController.text = "";
      rice = "";

      pesoAAController.text = "";
      pesoSSController.text = "";
      pesoImersoController.text = "";
      densidadeA = "";

      vazio = "";
    });
  }

  void _reset1() {
    setState(() {
      taraController.text = "";
      pesoAmostraController.text = "";
      pesoAmostraAguaController.text = "";
      rice = "";
      vazio = "";
    });
  }

  void _reset2() {
    setState(() {
      pesoAAController.text = "";
      pesoSSController.text = "";
      pesoImersoController.text = "";
      densidadeA = "";
      vazio = "";
    });
  }

  riceButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
      height: 30.0,
      child: RaisedButton(
        onPressed: () {
          if (_formkey.currentState.validate()) {
            calculaRice();
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text(
          "Calcular Check",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        color: Colors.black45,
      ),
    );
  }

  void calculaRice() {
    setState(() {
      double tara = double.parse(taraController.text);
      double amostra = double.parse(pesoAmostraController.text);
      double amostraAgua = double.parse(pesoAmostraAguaController.text);

      double contagem = (amostra / (amostra + tara - amostraAgua));
      riceValor = contagem;
      if (contagem > 0) {
        rice = "Rice (peso): ${contagem.toStringAsPrecision(5)}";
      } else {
        rice = "Valor inválido";
      }
    });
  }

  resultadoRice() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(
        rice,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  tituloDensidadeA() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "DENSIDADE APARENTE",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _reset2();
              })
        ],
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
          fontSize: 15,
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
          fontSize: 15,
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
          fontSize: 15,
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

  densidadeAButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
      height: 30.0,
      child: RaisedButton(
        onPressed: () {
          if (_formkey1.currentState.validate()) {
            calculaDensidadeA();
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text(
          "Calcular Densidade Aparente",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        color: Colors.black45,
      ),
    );
  }

  void calculaDensidadeA() {
    setState(() {
      double pesoAA = double.parse(pesoAAController.text);
      double pesoSS = double.parse(pesoSSController.text);
      double pesoImerso = double.parse(pesoImersoController.text);

      double contagem1 = (pesoAA / ((pesoSS - pesoImerso)));
      densidadeAValor = contagem1;
      if (contagem1 > 0) {
        densidadeA = "Densidade Aparente: ${contagem1.toStringAsPrecision(5)}";
      } else {
        densidadeA = "Valor inválido";
      }
    });
  }

  resultadoDensidadeA() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      child: Text(
        densidadeA,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  vazioButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      height: 30.0,
      child: RaisedButton(
        onPressed: () {
          if (_formkey.currentState.validate() &&
              _formkey1.currentState.validate()) {
            if (_formkey2.currentState.validate()) {
              calculaVazio();
              FocusScope.of(context).requestFocus(new FocusNode());
            }
          } else {
            return null;
          }
        },
        child: Text(
          "Calcular Vazios",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        color: Colors.black45,
      ),
    );
  }

  void calculaVazio() {
    setState(() {
      double contagem2 = ((riceValor - densidadeAValor) / (riceValor / 100));

      if (riceValor < 0 || densidadeAValor < 0) {
        vazio = "Impossível calcular";
      } else {
        vazio = "VAZIOS (%): ${contagem2.toStringAsPrecision(5)}";
      }
    });
  }

  resultadoVazio() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            vazio,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

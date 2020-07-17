import 'package:flutter/material.dart';

class MassaEMiuda extends StatefulWidget {
  @override
  _MassaEMiudaState createState() => _MassaEMiudaState();
}

class _MassaEMiudaState extends State<MassaEMiuda> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController picASecaController = TextEditingController();
  TextEditingController picASaturadaController = TextEditingController();
  TextEditingController picAAguaController = TextEditingController();
  String resutReal = "";
  String resutAparente = "";
  String resutAbsorcao = "";
  String resutMSeca = "";
  String resutMSaturada = "";

  double massaSeca = 0, massaSaturada = 0;

  dynamic _index;
  dynamic _picVazio;
  dynamic _picAgua;
  List<double> picnometro1 = [155.28, 653.89];
  List<double> picnometro2 = [162.36, 664.02];
  List<double> picnometro4 = [162.40, 662.67];
  List<double> picnometro5 = [154.47, 651.38];
  List<double> picnometro7 = [162.93, 650.87];
  List<double> picnometro8 = [163.56, 653.63];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Massa E. Miúda"),
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
                Navigator.pushNamed(context, '/infomiuda');
              }),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.pushNamed(context, '/massamiuda');
              }),
        ],
      ),
      body: widgetMassaEMiudaBody(),
    );
  }

  widgetMassaEMiudaBody() {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              dropdown(),
              picASeca(),
              picASaturada(),
              picAAgua(),
              buttonMMiuda(),
              resultadoMMiuda(),
            ],
          ),
        ),
      ),
    );
  }

  dropdown() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Center(
        child: DropdownButton<String>(
          items: [
            DropdownMenuItem<String>(
              child: Text('Picnômetro 1'),
              value: '$picnometro1',
            ),
            DropdownMenuItem<String>(
              child: Text('Picnômetro 2'),
              value: '$picnometro2',
            ),
            DropdownMenuItem<String>(
              child: Text('Picnômetro 4'),
              value: '$picnometro4',
            ),
            DropdownMenuItem<String>(
              child: Text('Picnômetro 5'),
              value: '$picnometro5',
            ),
            DropdownMenuItem<String>(
              child: Text('Picnômetro 7'),
              value: '$picnometro7',
            ),
            DropdownMenuItem<String>(
              child: Text('Picnômetro 8'),
              value: '$picnometro8',
            ),
          ],
          onChanged: (String value) {
            setState(() {
              if (value == '$picnometro4') {
                var vazio = value.substring(1, 6);
                var agua = value.substring(8, 14);
                _picVazio = double.parse(vazio);
                _picAgua = double.parse(agua);
              } else {
                // _picVazio = value.substring(1, 7);
                // _picAgua = value.substring(8, 15);
                var vazio = value.substring(1, 7);
                var agua = value.substring(8, 15);
                _picVazio = double.parse(vazio);
                _picAgua = double.parse(agua);
              }
              _index = value;
            });
          },
          hint: Text('Selecione o Picnômetro'),
          isExpanded: true,
          value: _index,
        ),
      ),
    );
  }

  picASeca() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Pic + Amostra Seca",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        style: TextStyle(fontSize: 17),
        textAlign: TextAlign.center,
        controller: picASecaController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Informe o valor do Pic + Amostra Seca';
          }
          return null;
        },
      ),
    );
  }

  picASaturada() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Pic + Amostra Saturada",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        style: TextStyle(fontSize: 17),
        textAlign: TextAlign.center,
        controller: picASaturadaController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Informe o valor do Pic + Amostra Saturada';
          }
          return null;
        },
      ),
    );
  }

  picAAgua() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Pic + Amostra + Água",
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        style: TextStyle(fontSize: 17),
        textAlign: TextAlign.center,
        controller: picAAguaController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Informe o valor do Pic + Amostra + Água';
          }
          return null;
        },
      ),
    );
  }

  buttonMMiuda() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          if (_formkey.currentState.validate()) {
            calculoMSeca();
            calculoMSaturada();
            calculoReal();
            calculoAparente();
            calculoAbsorcao();
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

  void calculoMSeca() {
    setState(() {
      double picASeca = double.parse(picASecaController.text);

      massaSeca = picASeca - _picVazio;

      if (massaSeca > 0) {
        resutMSeca = "Massa Seca: \n${massaSeca.toStringAsPrecision(6)}";
      } else {
        resutMSeca = "Valor inválido";
      }
    });
  }

  void calculoMSaturada() {
    setState(() {
      double picASaturada = double.parse(picASaturadaController.text);

      massaSaturada = picASaturada - _picVazio;

      if (massaSaturada > 0) {
        resutMSaturada =
            "Massa Saturada Superfície Seca: \n${massaSaturada.toStringAsPrecision(6)}";
      } else {
        resutMSaturada = "Valor inválido";
      }
    });
  }

  void calculoReal() {
    setState(() {
      double picAAgua = double.parse(picAAguaController.text);

      double cont1 = massaSeca / (massaSeca + _picAgua - picAAgua);
      if (cont1 > 0) {
        resutReal = "Real: \n${cont1.toStringAsPrecision(6)}";
      } else {
        resutReal = "Valor inválido";
      }
    });
  }

  void calculoAparente() {
    setState(() {
      double picAAgua = double.parse(picAAguaController.text);

      double cont2 = massaSeca / (massaSaturada + _picAgua - picAAgua);
      if (cont2 > 0) {
        resutAparente = "Aparente: \n${cont2.toStringAsPrecision(6)}";
      } else {
        resutAparente = "Valor inválido";
      }
    });
  }

  void calculoAbsorcao() {
    setState(() {
      double cont3 = ((massaSaturada - massaSeca) / massaSeca) * 100;
      if (cont3 > 0) {
        resutAbsorcao = "Absorção: \n${cont3.toStringAsPrecision(6)}%";
      } else {
        resutAbsorcao = "Valor inválido";
      }
    });
  }

  resultadoMMiuda() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "\n$resutReal \n\n$resutAparente \n\n$resutAbsorcao \n\n$resutMSeca \n\n$resutMSaturada",
            // "$_picVazio \n $_picAgua",
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

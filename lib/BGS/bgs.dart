import 'package:flutter/material.dart';

class Bgs extends StatefulWidget {
  @override
  _BgsState createState() => _BgsState();
}

class _BgsState extends State<Bgs> {
  GlobalKey<FormState> _formkey3 = GlobalKey<FormState>();
  TextEditingController padraoAController = TextEditingController();
  TextEditingController brita2Controller = TextEditingController();
  TextEditingController brita3_8Controller = TextEditingController();
  TextEditingController brita3_16Controller = TextEditingController();
  TextEditingController porcentagemAguaController = TextEditingController();
  TextEditingController pesoSMController = TextEditingController();
  // TextEditingController pesoMController = TextEditingController();
  TextEditingController pesoAUController = TextEditingController();
  // TextEditingController volumeMController = TextEditingController();
  TextEditingController massaEUController = TextEditingController();
  TextEditingController massaECController = TextEditingController();

  String amst1 = "", amst2 = "", amst3 = "";
  String _info = "";
  String b2 = "", b38 = "", b316 = "";
  String pesoau = "";
  double cont7 = 0, cont8 = 0;
  String massaeu = "", massaec = "";

  dynamic _index;
  dynamic _peso;
  dynamic _volume;

  //Map<int,int> = [[4145: 2100],[4405, 2085]];

  List<int> cilindro1 = [4145, 2100];
  List<int> cilindro2 = [4405, 2085];
  List<int> cilindro3 = [4140, 2095];
  List<int> cilindro4 = [4090, 2086];
  List<int> cilindro5 = [4195, 2089];
  List<int> cilindro6 = [4120, 2088];
  List<int> cilindro7 = [4170, 2075];
  List<int> cilindro8 = [4160, 2076];
  List<int> cilindro9 = [4100, 2092];
  List<int> cilindro10 = [4220, 2079];
  List<int> cilindro11 = [4100, 2094];
  List<int> cilindro12 = [4225, 2090];
  List<int> cilindro13 = [4150, 2100];
  List<int> cilindro14 = [4215, 2088];
  List<int> cilindro15 = [4100, 2090];
  List<int> cilindro16 = [4160, 2089];
  List<int> cilindro17 = [4105, 2089];
  List<int> cilindro18 = [4265, 2079];
  List<int> cilindro19 = [4365, 2076];
  List<int> cilindro20 = [4235, 2089];
  List<int> cilindro21 = [4155, 2096];
  List<int> cilindro22 = [4150, 2100];
  List<int> cilindro23 = [4115, 2098];
  List<int> cilindro24 = [4160, 2099];
  List<int> cilindro25 = [4285, 2109];
  List<int> cilindro26 = [4185, 2087];
  List<int> cilindro27 = [4490, 2075];
  List<int> cilindro28 = [4220, 2087];
  List<int> cilindro29 = [4120, 2114];
  List<int> cilindro30 = [4255, 2087];
  List<int> cilindro31 = [2255, 801];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BGS"),
        flexibleSpace: Opacity(
          opacity: 0.9,
          child: Image(
            image: AssetImage('images/yello1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.description),
              onPressed: () {
                Navigator.pushNamed(context, '/cilindros');
              }),
          IconButton(
              icon: Icon(Icons.report),
              onPressed: () {
                Navigator.pushNamed(context, '/infobgs');
              }),
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.pushNamed(context, '/bgs');
              }),
        ],
      ),
      body: widgetBGSBody(),
    );
  }

  widgetBGSBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formkey3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                padraoAgregados(),
                brita2(),
                brita3_8(),
                brita3_16(),
                porcentagemAgua(),
                dropdown(),
                obsDrop(),
                pesoSM(),
                resultButton(),
                resultados(),
                info(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  padraoAgregados() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Padrão de Agregados",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: padraoAController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe o valor do Padrão de Agregados';
        }
        return null;
      },
    );
  }

  brita2() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Brita 2 (%)",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: brita2Controller,
    );
  }

  void calculoBrita2() {
    setState(() {
      double padraoA = double.parse(padraoAController.text);
      double brita2 = double.parse(brita2Controller.text);

      double cont1 = (((brita2) / 100) * padraoA);

      if (cont1 >= 0) {
        b2 = "Brita 2: ${cont1.toStringAsPrecision(6)}";
      } else {
        b2 = "Valor inválido";
      }
    });
  }

  brita3_8() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Brita 3/8 (%)",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: brita3_8Controller,
    );
  }

  void calculoBrita3_8() {
    setState(() {
      double padraoA = double.parse(padraoAController.text);
      double brita38 = double.parse(brita3_8Controller.text);

      double cont2 = (((brita38) / 100) * padraoA);

      if (cont2 >= 0) {
        b38 = "Brita 3/8: ${cont2.toStringAsPrecision(6)}";
      } else {
        b38 = "Valor inválido";
      }
    });
  }

  brita3_16() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Brita 3/16 (%)",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: brita3_16Controller,
    );
  }

  void calculoBrita3_16() {
    setState(() {
      double padraoA = double.parse(padraoAController.text);
      double brita316 = double.parse(brita3_8Controller.text);

      double cont3 = (((brita316) / 100) * padraoA);

      if (cont3 >= 0) {
        b316 = "Brita 3/16: ${cont3.toStringAsPrecision(6)}";
      } else {
        b316 = "Valor inválido";
      }
    });
  }

  info() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _info,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }

  porcentagemAgua() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Porcentagem de Água (%)",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: porcentagemAguaController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe o valor da Porcentagem de Água';
        }
        return null;
      },
    );
  }

  void calculoAmostra1() {
    setState(() {
      double porcentagemA = double.parse(porcentagemAguaController.text);
      double padraoA = double.parse(padraoAController.text);

      double cont4 = (((porcentagemA - 2) / 100) * padraoA);

      if (cont4 > 0) {
        amst1 = "Amostra 1 (ml): ${cont4.toStringAsPrecision(5)}";
      } else {
        amst1 = "Valor inválido";
      }
    });
  }

  void calculoAmostra2() {
    setState(() {
      double porcentagemA = double.parse(porcentagemAguaController.text);
      double padraoA = double.parse(padraoAController.text);

      double cont5 = ((porcentagemA / 100) * padraoA);

      if (cont5 > 0) {
        amst2 = "Amostra 2 (ml): ${cont5.toStringAsPrecision(5)}";
      } else {
        amst2 = "Valor inválido";
      }
    });
  }

  void calculoAmostra3() {
    setState(() {
      double porcentagemA = double.parse(porcentagemAguaController.text);
      double padraoA = double.parse(padraoAController.text);

      double cont6 = (((2 + porcentagemA) / 100) * padraoA);

      if (cont6 > 0) {
        amst3 = "Amostra 3 (ml): ${cont6.toStringAsPrecision(5)}";
      } else {
        amst3 = "Valor inválido";
      }
    });
  }

  pesoSM() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Peso Solo + Molde (g)",
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.center,
      controller: pesoSMController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Informe o valor do Peso Solo + Molde';
        }
        return null;
      },
    );
  }

  void calculoPesoAU() {
    setState(() {
      double pesoSM = double.parse(pesoSMController.text);
      // double pesoM = double.parse(pesoMController.text);

      cont7 = (pesoSM - _peso);

      if (cont7 > 0) {
        pesoau = "Peso Amostra Úmida (g): \n${cont7.toStringAsPrecision(6)}";
      } else {
        pesoau = "Valor inválido";
      }
    });
  }

  void calculoMassaEU() {
    setState(() {
      // double volumeM = double.parse(volumeMController.text);
      // double pesoAU = double.parse(pesoAUController.text);

      double cont8 = (cont7 / _volume);

      if (cont8 >= 0) {
        massaeu =
            "Massa Específica Úmida (g/cm3): \n${cont8.toStringAsPrecision(5)}";
      } else {
        massaeu = "Valor inválido";
      }
    });
  }

  void calculoMassaEC() {
    setState(() {
      double porcentagemA = double.parse(porcentagemAguaController.text);
      // double massaEU = double.parse(massaEUController.text);

      double cont9 = (cont8 / ((porcentagemA + 100) / 100));

      if (cont9 >= 0) {
        massaec =
            "Massa Específica Convertida (g/cm3): \n${cont9.toStringAsPrecision(5)}";
      } else {
        massaec = "Valor inválido";
      }
    });
  }

  resultados() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$amst1 \n$amst2 \n$amst3 \n$b2 \n$b38 \n$b316 \n$pesoau \n$massaeu \n$massaec",
            // "Peso: $_peso e Volume: $_volume",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.purple,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  resultButton() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
      height: 30.0,
      child: RaisedButton(
        onPressed: () {
          if (_formkey3.currentState.validate()) {
            calculoAmostra1();
            calculoAmostra2();
            calculoAmostra3();
            calculoBrita2();
            calculoBrita3_8();
            calculoBrita3_16();
            calculoPesoAU();
            calculoMassaEU();
            calculoMassaEC();
            _info = "OBS: Os valores mudam de acordo com a concessionária\n";
            FocusScope.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text(
          "Calcular",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        color: Colors.black45,
      ),
    );
  }

  dropdown() {
    return Center(
      child: DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            child: Text('Cilindro 1'),
            value: '$cilindro1',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 2'),
            value: '$cilindro2',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 3'),
            value: '$cilindro3',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 4'),
            value: '$cilindro4',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 5'),
            value: '$cilindro5',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 6'),
            value: '$cilindro6',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 7'),
            value: '$cilindro7',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 8'),
            value: '$cilindro8',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 9'),
            value: '$cilindro9',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 10'),
            value: '$cilindro10',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 11'),
            value: '$cilindro11',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 12'),
            value: '$cilindro12',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 13'),
            value: '$cilindro13',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 14'),
            value: '$cilindro14',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 15'),
            value: '$cilindro15',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 16'),
            value: '$cilindro16',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 17'),
            value: '$cilindro17',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 18'),
            value: '$cilindro18',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 19'),
            value: '$cilindro19',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 20'),
            value: '$cilindro20',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 21'),
            value: '$cilindro21',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 22'),
            value: '$cilindro22',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 23'),
            value: '$cilindro23',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 24'),
            value: '$cilindro24',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 25'),
            value: '$cilindro25',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 26'),
            value: '$cilindro26',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 27'),
            value: '$cilindro27',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 28'),
            value: '$cilindro28',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 29'),
            value: '$cilindro29',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 30'),
            value: '$cilindro30',
          ),
          DropdownMenuItem<String>(
            child: Text('Cilindro 31'),
            value: '$cilindro31',
          ),
        ],
        onChanged: (String value) {
          setState(() {
            if (value == '$cilindro31') {
              var peso = value.substring(1, 5);
              var volume = value.substring(7, 10);
              _peso = int.parse(peso);
              _volume = int.parse(volume);
            } else {
              var peso = value.substring(1, 5);
              var volume = value.substring(7, 11);
              _peso = int.parse(peso);
              _volume = int.parse(volume);
            }
            _index = value;
          });
        },
        hint: Text('Selecione o Cilindro'),
        isExpanded: true,
        value: _index,
      ),
    );
  }

  obsDrop() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Text(
        "Obs. Cada amostra tem que ser realizada em moldes diferentes",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.red,
          fontSize: 10.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InfoMiuda extends StatefulWidget {
  @override
  _InfoMiudaState createState() => _InfoMiudaState();
}

class _InfoMiudaState extends State<InfoMiuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações sobre M. E. Miúda"),
        flexibleSpace: Opacity(
          opacity: 0.9,
          child: Image(
            image: AssetImage('images/yello1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: widgetBody(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 3),
          child: Text(
            "From Gonçalves, Iago.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 10.0),
          ),
        ),
      ),
    );
  }

  widgetBody() {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              tituloMSeca(),
              infoMSeca(),
              tituloMSaturada(),
              infoMSaturada(),
              tituloReal(),
              infoReal(),
              tituloAparente(),
              infoSaturado(),
              tituloAbs(),
              infoAbs(),
              obs(),
            ],
          ),
        ),
      ),
    );
  }

  obs() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Em caso de dúvidas com os resultados obtidos no aplicativo, é recomendável realizar os cálculos na calculadora.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red, fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  tituloMSeca() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo Massa Seca",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoMSeca() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "(Pic + Amostra Seca) - Pic Vazio",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloMSaturada() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo Massa Saturada",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoMSaturada() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "(Pic + Amostra Saturada) - Pic Vazio",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloReal() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo Real",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoReal() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Massa Seca / [Massa Seca + (Pic + Água) - (Pic + Amostra + Água)]",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloAparente() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo Aparente",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoSaturado() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Massa seca / [Massa Saturada + (Pic + água) - (Pic + Amostra + água)]",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloAbs() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo Absorção",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoAbs() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "[(Massa Saturada - Massa Seca) / Massa Seca] * 100",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InfoGrauda extends StatefulWidget {
  @override
  _InfoGraudaState createState() => _InfoGraudaState();
}

class _InfoGraudaState extends State<InfoGrauda> {
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

  tituloReal() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo Real",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoReal() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Amostra Seca / (Amostra Seca - Volume)",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
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
            color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoSaturado() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Amostra Seca / (Amostra Saturada - Volume)",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
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
            color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoAbs() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "[(Amostra Saturada - Amostra Seca) / Amostra Seca] * 100",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.0,
        ),
      ),
    );
  }
}

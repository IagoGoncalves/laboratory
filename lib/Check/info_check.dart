import 'package:flutter/material.dart';

class InfoCheck extends StatefulWidget {
  @override
  _InfoCheckState createState() => _InfoCheckState();
}

class _InfoCheckState extends State<InfoCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações sobre Check"),
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
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            tituloRice(),
            infoRice(),
            tituloDensidadeA(),
            infoDensidadeA(),
            tituloVazios(),
            infoVazios(),
            obs(),
          ],
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

  tituloRice() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Calculo do peso de Rice:",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoRice() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Peso da amostra / \n(Peso da amostra + Tara - Peso da amostra água)",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloDensidadeA() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo de Densidade Aparente",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoDensidadeA() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Peso ao Ar / \n(Peso Saturado - Peso Imerso)",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloVazios() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo de Vazios",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoVazios() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "(Peso Rice - Densidade Aparente) / \n (Peso Rice / 100 )",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }
}

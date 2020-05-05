import 'package:flutter/material.dart';

class InfoBgs extends StatefulWidget {
  @override
  _InfoBgsState createState() => _InfoBgsState();
}

class _InfoBgsState extends State<InfoBgs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações sobre BGS"),
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
            tituloBritas(),
            infoBritas(),
            obsBritas(),
            tituloAmostra1(),
            infoAmostra1(),
            tituloAmostra2(),
            infoAmostra2(),
            tituloAmostra3(),
            infoAmostra3(),
            obsAmostra(),
            tituloPesoAU(),
            infoPesoAU(),
            tituloMassaEU(),
            infoMassaEU(),
            tituloMassaEC(),
            infoMassaEC(),
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

  tituloBritas() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo de Britas",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoBritas() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "(Valor da Brita / 100) * Padrão de Agregados",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  obsBritas() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Text(
        "Obs. A conta é a mesma para as Britas 2, 3/8 e 3/16.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 10.0,
        ),
      ),
    );
  }

  tituloAmostra1() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo Amostra 1 (ml)",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoAmostra1() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "[(Porcentagem de Água - 2) / 100] * Padrão de Agregados",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloAmostra2() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo Amostra 2 (ml)",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoAmostra2() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "(Porcentagem de Água / 100) * Padrão de Agregados",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloAmostra3() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo Amostra 3 (ml)",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoAmostra3() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "[(Porcentagem de Água + 2) / 100] * Padrão de Agregados",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  obsAmostra() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Text(
        "Obs. Em caso de divergências na análise é necessário realizar mais amostras.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 10.0,
        ),
      ),
    );
  }

  tituloPesoAU() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Text(
        "Cálculo de Amostra Úmida",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoPesoAU() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Peso do Solo mais Molde - Peso do Molde",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloMassaEU() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo de Massa Específica Úmida",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoMassaEU() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Peso da Amostra Úmida / Volume do Molde",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }

  tituloMassaEC() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Cálculo de Massa Específica Convertida",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  infoMassaEC() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Text(
        "Massa Específica Úmida /\n [(Porcentagem de Água + 100) / 100]",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }
}

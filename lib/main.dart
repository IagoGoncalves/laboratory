import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'BGS/cilindros.dart';
import 'Check/check.dart';
import 'BGS/info_bgs.dart';
import 'Check/info_check.dart';
import 'BGS/bgs.dart';
// import 'Desabilitados/rice.dart';
// import 'Desabilitados/vazio.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Test1',
    initialRoute: '/',
    routes: {
      '/': (context) => IntroScrenn(),
      // '/rice': (context) => Rice(),
      // '/vazios': (context) => Vazios(),
      '/bgs': (context) => Bgs(),
      '/check': (context) => Check(),
      '/infocheck': (context) => InfoCheck(),
      '/infobgs': (context) => InfoBgs(),
      '/cilindros': (context) => Cilindros(),
    },
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Selecione o Ensaio"),
          flexibleSpace: stlAppBar(),
          backgroundColor: Colors.transparent,
        ),
        body: buildListView(context),
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
      ),
    );
  }

  Opacity stlAppBar() {
    return Opacity(
      opacity: 0.9,
      child: Image(
        image: AssetImage('images/yello1.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  buildListView(context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.chevron_right),
          title: Text("Check"),
          subtitle: Text("Cálculo de Rice/Vazios"),
          selected: false,
          enabled: true,
          onTap: () {
            Navigator.pushNamed(context, '/check');
          },
        ),
        ListTile(
          leading: Icon(Icons.chevron_right),
          title: Text("Bgs"),
          subtitle: Text("Calculo de BGS"),
          selected: false,
          enabled: true,
          onTap: () {
            Navigator.pushNamed(context, '/bgs');
          },
        ),

        // ListTile(
        //   leading: Icon(Icons.chevron_right),
        //   title: Text("Rice"),
        //   subtitle: Text("Cálculo de Rice"),
        //   selected: false,
        //   enabled: false,
        //   onTap: () {
        //     Navigator.pushNamed(context, '/rice');
        //   },
        // ),
        // ListTile(
        //   leading: Icon(Icons.chevron_right),
        //   title: Text("Vazios"),
        //   subtitle: Text("Cálculo de Vazios"),
        //   selected: false,
        //   enabled: false,
        //   onTap: () {
        //     Navigator.pushNamed(context, '/vazios');
        //   },
        // ),
      ],
    );
  }
}

class IntroScrenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 2,
          navigateAfterSeconds: Home(),
          loaderColor: Colors.green,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/logo.jpeg"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

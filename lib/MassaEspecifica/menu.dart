import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        flexibleSpace: Opacity(
          opacity: 0.9,
          child: Image(
            image: AssetImage('images/yello1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: widgetMenuBody(),
    );
  }

  widgetMenuBody() {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            massaMiuda(),
            massaGrauda(),
          ],
        ),
      ),
    );
  }

  massaMiuda() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 3, 0, 20),
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {},
        child: Text(
          "Massa Especifica Miúda",
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        color: Colors.black45,
      ),
    );
  }

  massaGrauda() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 3, 0, 0),
      height: 50.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/massagrauda');
        },
        child: Text(
          "Massa Especifica Graúda",
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        color: Colors.black45,
      ),
    );
  }
}

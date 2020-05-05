import 'package:flutter/material.dart';

class Cilindros extends StatefulWidget {
  @override
  _CilindrosState createState() => _CilindrosState();
}

class _CilindrosState extends State<Cilindros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cilindros"),
        flexibleSpace: Opacity(
          opacity: 0.9,
          child: Image(
            image: AssetImage('images/yello1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: infos(),
      ),
    );
  }

  infos() {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(
            label: Text(
              'Cilindro',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Peso',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Volume',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('4145')),
            DataCell(Text('2100')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('4405')),
            DataCell(Text('2085')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('4140')),
            DataCell(Text('2095')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('4090')),
            DataCell(Text('2086')),
          ]),
          DataRow(cells: [
            DataCell(Text('5')),
            DataCell(Text('4195')),
            DataCell(Text('2089')),
          ]),
          DataRow(cells: [
            DataCell(Text('6')),
            DataCell(Text('4120')),
            DataCell(Text('2088')),
          ]),
          DataRow(cells: [
            DataCell(Text('7')),
            DataCell(Text('4170')),
            DataCell(Text('2075')),
          ]),
          DataRow(cells: [
            DataCell(Text('8')),
            DataCell(Text('4160')),
            DataCell(Text('2076')),
          ]),
          DataRow(cells: [
            DataCell(Text('9')),
            DataCell(Text('4100')),
            DataCell(Text('2092')),
          ]),
          DataRow(cells: [
            DataCell(Text('10')),
            DataCell(Text('4220')),
            DataCell(Text('2079')),
          ]),
          DataRow(cells: [
            DataCell(Text('11')),
            DataCell(Text('4100')),
            DataCell(Text('2094')),
          ]),
          DataRow(cells: [
            DataCell(Text('12')),
            DataCell(Text('4225')),
            DataCell(Text('2090')),
          ]),
          DataRow(cells: [
            DataCell(Text('13')),
            DataCell(Text('4150')),
            DataCell(Text('2100')),
          ]),
          DataRow(cells: [
            DataCell(Text('14')),
            DataCell(Text('4215')),
            DataCell(Text('2088')),
          ]),
          DataRow(cells: [
            DataCell(Text('15')),
            DataCell(Text('4100')),
            DataCell(Text('2090')),
          ]),
          DataRow(cells: [
            DataCell(Text('16')),
            DataCell(Text('4160')),
            DataCell(Text('2089')),
          ]),
          DataRow(cells: [
            DataCell(Text('17')),
            DataCell(Text('4105')),
            DataCell(Text('2089')),
          ]),
          DataRow(cells: [
            DataCell(Text('18')),
            DataCell(Text('4265')),
            DataCell(Text('2079')),
          ]),
          DataRow(cells: [
            DataCell(Text('19')),
            DataCell(Text('4365')),
            DataCell(Text('2076')),
          ]),
          DataRow(cells: [
            DataCell(Text('20')),
            DataCell(Text('4235')),
            DataCell(Text('2089')),
          ]),
          DataRow(cells: [
            DataCell(Text('21')),
            DataCell(Text('4155')),
            DataCell(Text('2096')),
          ]),
          DataRow(cells: [
            DataCell(Text('22')),
            DataCell(Text('4150')),
            DataCell(Text('2100')),
          ]),
          DataRow(cells: [
            DataCell(Text('23')),
            DataCell(Text('4115')),
            DataCell(Text('2098')),
          ]),
          DataRow(cells: [
            DataCell(Text('24')),
            DataCell(Text('4160')),
            DataCell(Text('2099')),
          ]),
          DataRow(cells: [
            DataCell(Text('25')),
            DataCell(Text('4285')),
            DataCell(Text('2109')),
          ]),
          DataRow(cells: [
            DataCell(Text('26')),
            DataCell(Text('4185')),
            DataCell(Text('2087')),
          ]),
          DataRow(cells: [
            DataCell(Text('27')),
            DataCell(Text('4490')),
            DataCell(Text('2075')),
          ]),
          DataRow(cells: [
            DataCell(Text('28')),
            DataCell(Text('4220')),
            DataCell(Text('2087')),
          ]),
          DataRow(cells: [
            DataCell(Text('29')),
            DataCell(Text('4120')),
            DataCell(Text('2114')),
          ]),
          DataRow(cells: [
            DataCell(Text('30')),
            DataCell(Text('4255')),
            DataCell(Text('2087')),
          ]),
          DataRow(cells: [
            DataCell(Text('31')),
            DataCell(Text('2255')),
            DataCell(Text('801')),
          ]),
        ],
      ),
    );
  }
}

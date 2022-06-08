import 'package:flutter/material.dart';
import 'package:vagos_app/page/inicio.dart';


class Carta extends StatefulWidget {
  const Carta({Key key}) : super(key: key);

  @override
  _CartaState createState() => _CartaState();
}

class _CartaState extends State<Carta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carta 1'),

      ),
      body: Center(child: Text('Carta 1')),
    );
  }
}


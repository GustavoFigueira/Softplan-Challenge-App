import 'package:flutter/material.dart';

class TaxaJurosPage extends StatefulWidget {
  TaxaJurosPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TaxaJurosPageState createState() => _TaxaJurosPageState();
}

class _TaxaJurosPageState extends State<TaxaJurosPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 18),
            children: <TextSpan>[
              TextSpan(
                  text: widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: '\nTaxa de Juros'),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

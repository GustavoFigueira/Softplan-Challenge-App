import 'package:flutter/material.dart';

class TaxaJurosPage extends StatefulWidget {
  TaxaJurosPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TaxaJurosPageState createState() => _TaxaJurosPageState();
}

class _TaxaJurosPageState extends State<TaxaJurosPage> {
  var _scrollViewController =
      new ScrollController(initialScrollOffset: 0, keepScrollOffset: false);

  @override
  void initState() {
    super.initState();
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
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
            controller: _scrollViewController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fitWidth,
                  )),
                ),
                Center(
                    child: Divider(
                  color: Colors.black.withOpacity(0.1),
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Text('Primeira API',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Buscar Taxa de Juro'),
                      Icon(Icons.search)
                    ],
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () => {},
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Text('Segunda API',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                RaisedButton(
                  child: Text('Buscar Taxa de Juro'),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () => {},
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 40),
                    child: Text('Versão 0.0.1',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])))
              ],
            )));
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:softplan_desafio_tecnico/src/services/constants.dart';

class TaxaJurosPage extends StatefulWidget {
  TaxaJurosPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TaxaJurosPageState createState() => _TaxaJurosPageState();
}

class _TaxaJurosPageState extends State<TaxaJurosPage> {
  var _scrollViewController =
      new ScrollController(initialScrollOffset: 0, keepScrollOffset: false);

  double interestRate;
  double compoundInterest;

  @override
  void initState() {
    super.initState();
  }

  final dio = new Dio(BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  Future<void> getInterestRate() async {
    final response = await dio.get('InterestRate/GetDefault');
    var _interestRate = response.data;

    if (response == null || _interestRate == 0) {
      _interestRate = 0.01;
    }

    setState(() {
      interestRate = _interestRate;
    });
  }

  Future<void> calculateCompoundInterest(
      double _initialValue, int _period) async {
    final response = await dio.get('CompoundInterest/Calculate',
        queryParameters: {"initialValues": _initialValue, "period": _period});
    var _compoundInterest = response.data;

    if (response == null || _compoundInterest == 0) {
      _compoundInterest = 0.01;
    }

    setState(() {
      compoundInterest = _compoundInterest;
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
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            controller: _scrollViewController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.center)),
                ),
                Center(
                    child: Divider(
                  color: Colors.black.withOpacity(0.1),
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                )),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Primeira API',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                RaisedButton(
                  child: Text(interestRate == null
                      ? 'Buscar Taxa de Juro...'
                      : interestRate.toString()),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () => getInterestRate(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 20),
                  child: Text('Segunda API',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: <Widget>[
                //     Expanded(
                //       // wrap your Column in Expanded
                //       child: Column(
                //         children: <Widget>[
                //           Text('item 1'),
                //           Container(child: TextField()),
                //         ],
                //       ),
                //     ),
                //     Expanded(
                //       // wrap your Column in Expanded
                //       child: Column(
                //         children: <Widget>[
                //           Text('item 2'),
                //           Container(child: TextField()),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                RaisedButton(
                  child: Text(interestRate == null
                      ? 'Calcular Juros Compostos (100, 5)...'
                      : interestRate.toString()),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  onPressed: () => calculateCompoundInterest(100, 5),
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

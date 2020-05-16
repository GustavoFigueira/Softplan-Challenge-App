import 'package:flutter/material.dart';
import 'package:softplan_desafio_tecnico/src/pages/taxa_juros_page.dart';

import 'utils/theme.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Softplan Desafio Técnico - Taxa de Juros',
      theme: getAppTheme(context),
      home: TaxaJurosPage(title: 'Softplan Desafio Técnico'),
      initialRoute: '/',
    );
  }
}
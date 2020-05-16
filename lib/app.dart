import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'src/main.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR', null);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MainPage());
}
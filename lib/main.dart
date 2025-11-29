import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/app.dart';
import 'package:spark_hire_app/providers/api_provider.dart';
import 'package:spark_hire_app/providers/locale_provider.dart';
import 'package:spark_hire_app/theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ApiProvider()),
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
      ],
      child: const App(),
    ),
  );
}

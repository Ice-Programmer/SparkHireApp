import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/app.dart';
import 'package:spark_hire_app/providers/locale_provider.dart';
import 'package:spark_hire_app/theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProxyProvider(
          create: (context) => ThemeProvider(),
          update: (context, settingsProvider, themeProvider) {
            return ThemeProvider();
          },
        ),

        ChangeNotifierProxyProvider(
          create: (context) => LocaleProvider(),
          update: (context, settingProvider, localeProvider) {
            return LocaleProvider();
          },
        ),
      ],
      child: const App(),
    ),
  );
}

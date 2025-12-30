import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/providers/locale_provider.dart';
import 'package:spark_hire_app/route/routes.dart';
import 'package:spark_hire_app/theme/dark_theme.dart';
import 'package:spark_hire_app/theme/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Size get designSize {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  // 逻辑短边
  final logicalShortestSize =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  // 逻辑长边
  final logicalLongestSize =
      firstView.physicalSize.longestSide / firstView.devicePixelRatio;
  // 缩放比例
  const scaleFactor = 0.95;
  return Size(
    logicalShortestSize * scaleFactor,
    logicalLongestSize * scaleFactor,
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    DioInstance.instance().initDio();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: supportedLocales,
          locale: Provider.of<LocaleProvider>(context, listen: true).locale,
          theme: Provider.of<ThemeProvider>(context, listen: true).themeData,
          darkTheme: darkMode,
        );
      },
    );
  }
}

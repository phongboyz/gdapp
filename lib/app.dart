import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gd/core/provider/provider_rigeter.dart';
import 'package:gd/core/routes/route_path.dart';
import 'package:gd/core/routes/router.dart';
import 'package:gd/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';


import 'core/navigator/app_navigator.dart';
import 'core/utils/theme_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerMain, 
      child: MaterialApp(
        title: LocaleKeys.kAppName,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: AppRoute.generateRoute,
        initialRoute: RoutePath.initRoute,
        theme: buildTheme(),
      ),
    );
  }
}

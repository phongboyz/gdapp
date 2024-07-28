import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gd/core/models/cart.dart';
// import 'package:gd/core/models/cart_get.dart';
import 'package:gd/core/models/product_items.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:gd/core/DI/service_locator.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProductItemsAdapter());
  Hive.registerAdapter(CartAdapter());
  // Hive.registerAdapter(CartGetAdapter());

  AppNavigator();
  getIt.init();
  // await getIt.init();
}

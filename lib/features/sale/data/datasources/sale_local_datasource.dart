import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/cart.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:injectable/injectable.dart';

abstract class SaleLocalDataSource {
  Future<List<Cart>> getProductItems();
}

@LazySingleton(as: SaleLocalDataSource)
class SaleLocalDatasourceImpl implements SaleLocalDataSource {
  @override
  Future<List<Cart>> getProductItems() async {
    try {
      List<Cart>? data =
          await DatabaseService().getData<Cart>(key: DatabaseKey.cartKey);
      return data;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/product.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/network/network_call.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:injectable/injectable.dart';

abstract class ItemRemoteDataSource {
  Future<Product> searchProduct({required String productData});
}

@LazySingleton(as: ItemRemoteDataSource)
class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final NetworkCall networkCall;
  final DatabaseService _databaseService;

  ItemRemoteDataSourceImpl(
    this.networkCall,
    this._databaseService,
  );

  @override
  Future<Product> searchProduct({required String productData}) async {
    try {
      final user =
          await _databaseService.findOne<User>(key: DatabaseKey.userKey);
      final response = await networkCall
          .searchProduct('Bearer ${user?.token}', {"search": productData});
      // print(response);
      return response;
    } on DioException catch (er) {
      throw ServerException(er.toString());
    }
  }
}

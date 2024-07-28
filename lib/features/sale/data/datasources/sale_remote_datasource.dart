import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/bill.dart';
import 'package:gd/core/models/member.dart';
import 'package:gd/core/models/sell_product.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/network/network_call.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:injectable/injectable.dart';

abstract class SaleRemoteDataSource {
  Future<Member> searchMember({required String memberData});
  Future<Bill> sellProduct({required SellProduct sellProduct});
}

@LazySingleton(as: SaleRemoteDataSource)
class SaleRemoteDataSourceImpl implements SaleRemoteDataSource {
  final NetworkCall networkCall;
  final DatabaseService _databaseService;

  SaleRemoteDataSourceImpl(
    this.networkCall,
    this._databaseService,
  );

  @override
  Future<Member> searchMember({required String memberData}) async {
    try {
      final user =
          await _databaseService.findOne<User>(key: DatabaseKey.userKey);
      final response = await networkCall
          .member('Bearer ${user?.token}', {"search": memberData});
      // print(response);
      return response;
    } on DioException catch (er) {
      throw ServerException(er.toString());
    }
  }

  @override
  Future<Bill> sellProduct({required SellProduct sellProduct}) async {
    try {
      final user =
          await _databaseService.findOne<User>(key: DatabaseKey.userKey);
      final dataSell = jsonEncode(sellProduct);

      print(dataSell);

      final response =
          await networkCall.sellProduct('Bearer ${user?.token}', dataSell);
      var data = jsonDecode(response);
      final billData = await networkCall.getBill(
          'Bearer ${user?.token}', "${data['transaction_id']}");
      print("${data['transaction_id']}");
      return billData;
    } on DioException catch (er) {
      throw ServerException(er.toString());
    }
  }
}

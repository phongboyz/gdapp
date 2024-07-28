import 'package:dartz/dartz.dart';
import 'package:gd/core/models/bill.dart';
import 'package:gd/core/models/cart.dart';
import 'package:gd/core/models/member.dart';
import 'package:gd/core/models/sell_product.dart';
import '../../../../core/error/failures.dart';

abstract class SaleRepository {
  Future<Either<Failure,List<Cart>>>getProductItems();
  Future<Either<Failure,Member>>getMember({required String memberData});
  Future<Either<Failure,Bill>>sellProduct({required SellProduct sellProduct});
}

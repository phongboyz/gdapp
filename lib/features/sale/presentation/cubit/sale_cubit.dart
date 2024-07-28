import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/extensions/either_extension.dart';
import 'package:gd/core/models/bill.dart';
import 'package:gd/core/models/cart.dart';
import 'package:gd/core/models/member.dart';
import 'package:gd/core/models/sell_product.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:gd/core/usecases/no_params.dart';
import 'package:gd/core/utils/print_bill.dart';
import 'package:gd/features/sale/domain/usecases/get_product_items_usecase.dart';
import 'package:gd/features/sale/domain/usecases/memer_usecase.dart';
import 'package:gd/features/sale/domain/usecases/sell_product_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:printing/printing.dart';
part 'sale_cubit.freezed.dart';
part 'sale_state.dart';

@injectable
class SaleCubit extends Cubit<SaleState> {
  final GetProductItemsUsecase _productItemsUsecase;
  final GetMemberListUsecase _getMemberListUsecase;
  final SellProductUsecase _sellProductUsecase;
  SaleCubit(
    this._productItemsUsecase,
    this._getMemberListUsecase,
    this._sellProductUsecase,
  ) : super(const SaleState());

  Future<void> getProductItem() async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      final result = await _productItemsUsecase(NoParams());
      var total = await DatabaseService().getSumTotal(key: DatabaseKey.cartKey);
      var indexData =
          await DatabaseService().getLength(key: DatabaseKey.cartKey);

      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        emit(state.copyWith(
            status: DataStatus.success,
            product: result.getRight(),
            total: total,
            length: indexData));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteItem({required int index}) async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      await DatabaseService().deleteOne(
        key: DatabaseKey.cartKey,
        index: index,
      );
      var indexData =
          await DatabaseService().getLength(key: DatabaseKey.cartKey);
      var total = await DatabaseService().getSumTotal(key: DatabaseKey.cartKey);
      final result = await _productItemsUsecase(NoParams());
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        emit(state.copyWith(
            status: DataStatus.success,
            product: result.getRight(),
            total: total,
            length: indexData));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateItem({required Cart cart, required String itemKey}) async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      await DatabaseService().updateJson(
        key: DatabaseKey.cartKey,
        data: cart,
        itemKey: itemKey,
      );
      var total = await DatabaseService().getSumTotal(key: DatabaseKey.cartKey);
      final result = await _productItemsUsecase(NoParams());
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        emit(state.copyWith(
            status: DataStatus.success,
            product: result.getRight(),
            total: total));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getMember(String data) async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      final result = await _getMemberListUsecase(data);

      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        emit(state.copyWith(
            status: DataStatus.success, member: result.getRight()));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> printBill({
    String? seller,
    Bill? bill,
    List<Cart>? product,
    double? total,
  }) async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      Uint8List pdf = await generatePdf(
          bill: bill, product: product, seller: seller, total: total);
      Printing.layoutPdf(onLayout: (format) => pdf);
      emit(state.copyWith(
        status: DataStatus.success,
      ));
      // AppNavigator.pushAndRemoveUntil(RoutePath.homeRoute);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> sellProduct(SellProduct data) async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      final result = await _sellProductUsecase(data);
      final resultProduct = await _productItemsUsecase(NoParams());
      var total = await DatabaseService().getSumTotal(key: DatabaseKey.cartKey);
      User? user =
          await DatabaseService().findOne<User>(key: DatabaseKey.userKey);
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        emit(state.copyWith(
            status: DataStatus.success,
            bill: result.getRight(),
            product: resultProduct.getRight(),
            total: total,
            seller: user?.firstname));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

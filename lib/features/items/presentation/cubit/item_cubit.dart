import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/extensions/either_extension.dart';
import 'package:gd/core/models/product.dart';
import 'package:gd/features/items/domain/usecases/get_profile_usecase.dart';
import 'package:injectable/injectable.dart';
part 'item_cubit.freezed.dart';
part 'item_state.dart';

@injectable
class ItemCubit extends Cubit<ItemState> {
  final GetProductUsecase _productUsecase;
  ItemCubit(
    this._productUsecase,
  ) : super(const ItemState());

  Future<void> getProduct() async {
    try {
      emit(state.copyWith(status: DataStatus.loading));
      final result = await _productUsecase('');
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        emit(state.copyWith(
            status: DataStatus.success, product: result.getRight()));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getProductBySearch({required String search}) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      final result = await _productUsecase(search);
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        emit(state.copyWith(
            status: DataStatus.success, product: result.getRight()));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

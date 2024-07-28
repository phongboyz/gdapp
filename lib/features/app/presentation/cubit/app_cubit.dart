import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/extensions/either_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/usecases/get_user_usecase.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final GetUserUsecase _getUserUsecase;
  AppCubit(
    this._getUserUsecase,
  ) : super(const AppState());
  Future<void> getCurrentUserData(
      {required String doc,
      // bool isGoogle = false,
      Map<String, dynamic>? data}) async {
    emit(state.copyWith(status: DataStatus.loading));
    final currentUser = await _getUserUsecase(doc);
    if (currentUser.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: currentUser.getLeft()?.msg));
    } else {
      final userData = currentUser.getRight();
      emit(state.copyWith(status: DataStatus.success, currentUsers: userData));
    }
  }
}

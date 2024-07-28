import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:injectable/injectable.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  // final GetCurrentUserDataUsecase _getCurrentUserDataUsecase;

  HomeCubit() : super(const HomeState());
  void onChangedTab(int index) {
    emit(state.copyWith(currentTab: index));
  }
  // Future<void> getCurrentUser() async {
  //   emit(state.copyWith(status: DataStatus.loading));
  //   final user = await _getCurrentUserDataUsecase(NoParams());
  //   if (user.isLeft()) {
  //     emit(state.copyWith(
  //         status: DataStatus.failure, error: user.getLeft()?.msg));
  //   } else {
  //     emit(state.copyWith(
  //         status: DataStatus.success, currentUser: user.getRight()));
  //   }
  // }
}

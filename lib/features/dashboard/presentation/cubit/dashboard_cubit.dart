import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/extensions/either_extension.dart';
import 'package:gd/core/models/dashboard.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:gd/core/usecases/no_params.dart';
import 'package:gd/features/dashboard/domain/usecases/get_dashboard_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'dashboard_cubit.freezed.dart';
part 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final GetDashboardUsecase _dashboardUsecase;
  DashboardCubit(this._dashboardUsecase) : super(const DashboardState());

  Future<void> getDashboard() async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      final result = await _dashboardUsecase(NoParams());
      var indexData =
          await DatabaseService().getLength(key: DatabaseKey.cartKey);
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        emit(state.copyWith(
            status: DataStatus.success,
            dashboard: result.getRight(),
            length: indexData));
      }
    } catch (e) {
      print(e.toString());
      // emit(state.copyWith(status: DataStatus.failure, error: e.toString()));
    }
  }
}

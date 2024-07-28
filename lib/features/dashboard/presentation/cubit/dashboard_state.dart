
part of 'dashboard_cubit.dart';


@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final Dashboard? dashboard,
    final String? error,
    final int? length,
  }) = _Initial;
}

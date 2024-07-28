import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

@freezed
class Dashboard with _$Dashboard {
  const factory Dashboard({
    int? data_purchase,
    int? data_sell,
  }) = _Dashboard;

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
}

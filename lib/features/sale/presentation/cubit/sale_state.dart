part of 'sale_cubit.dart';

@freezed
class SaleState with _$SaleState {
  const factory SaleState({
    @Default(DataStatus.initial) final DataStatus status,
    final List<Cart>? product,
    final Member? member,
    final String? error,
    final double? total,
    final int? length,
    final String? message,
    final String? seller,
    final Bill? bill,
  }) = _Initial;
}

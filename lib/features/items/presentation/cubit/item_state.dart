part of 'item_cubit.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final Product? product,
    final String? error,
  }) = _Initial;
}

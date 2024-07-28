part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final User? user,
    final String? error,
  }) = _Initial;
}

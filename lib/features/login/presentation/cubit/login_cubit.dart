import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/extensions/either_extension.dart';
import 'package:gd/core/models/login.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/routes/route_path.dart';
import 'package:gd/core/usecases/no_params.dart';
import 'package:gd/features/login/domain/usecases/get_login_usecase.dart';
import 'package:gd/features/login/domain/usecases/get_profile_usecase.dart';
import 'package:injectable/injectable.dart';
part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final GetLoginUsecase _loginUsecase;
  final GetProfileLoginUsecase _getProfileUsecase;
  LoginCubit(this._loginUsecase, this._getProfileUsecase)
      : super(const LoginState());
  GlobalKey<FormBuilderState> loginForm = GlobalKey<FormBuilderState>();

  Future<void> login() async {
    try {
      if (loginForm.currentState!.saveAndValidate()) {
        emit(state.copyWith(status: DataStatus.loading));
        Map<String, dynamic> formValue = loginForm.currentState?.value ?? {};
        final userData = await _loginUsecase(Login(
            username: formValue['username'], password: formValue['password']));
        if (userData.isLeft()) {
          emit(state.copyWith(
              status: DataStatus.failure, error: userData.getLeft()?.msg));
        } else {
          final data = userData.getRight();
          emit(state.copyWith(status: DataStatus.success, user: data));
          AppNavigator.pushAndRemoveUntil(RoutePath.homeRoute);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getProfile() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getProfileUsecase(NoParams());
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      emit(state.copyWith(status: DataStatus.success, user: result.getRight()));
    }
  }
}

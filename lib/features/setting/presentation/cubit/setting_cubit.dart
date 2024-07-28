import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/extensions/either_extension.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/params/password_param.dart';
import 'package:gd/core/params/profile_param.dart';
import 'package:gd/features/setting/domain/usecases/change_password_usecase.dart';
import 'package:gd/features/setting/domain/usecases/get_profile_usecase.dart';
import 'package:gd/features/setting/domain/usecases/update_profile_usecase.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/usecases/no_params.dart';
import '../../domain/usecases/get_language_usecase.dart';
import '../../domain/usecases/set_language_usecase.dart';

part 'setting_cubit.freezed.dart';
part 'setting_state.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  // final SignOutUsecase _signOutUsecase;
  final GetLanguageUsecase _getLanguageUsecase;
  final SetLanguageUsecase _setLanguageUsecase;
  final GetProfileUsecase _getProfileUsecase;
  final UpdateProfileUsecase _updateProfileUsecase;
  final ChangePasswordUsecase _changePasswordUsecase;
  SettingCubit(
    this._updateProfileUsecase,
    this._changePasswordUsecase,
    this._getLanguageUsecase,
    this._setLanguageUsecase,
    this._getProfileUsecase,
  ) : super(const SettingState());

  // Future<void> signOut() async {
  //   final result = await _signOutUsecase(NoParams());
  //   if (result.isLeft()) {
  //     emit(state.copyWith(status: DataStatus.failure));
  //   } else {
  //     AppNavigator.pushAndRemoveUntil(RoutePath.initRoute);
  //   }
  // }
  GlobalKey<FormBuilderState> changePasswordForm =
      GlobalKey<FormBuilderState>();
  Future<void> getLanguage() async {
    emit(state.copyWith(status: DataStatus.loading));
    final langCode = _getLanguageUsecase(NoParams());
    emit(
        state.copyWith(status: DataStatus.success, language: langCode ?? 'en'));
  }

  Future<void> setLanguage({String? code}) async {
    emit(state.copyWith(status: DataStatus.loading, isSetlang: false));
    final result = await _setLanguageUsecase(code);
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      emit(state.copyWith(
          status: DataStatus.success, language: code ?? 'en', isSetlang: true));
    }
  }

  Future<void> getProfile() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getProfileUsecase(NoParams());
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      emit(state.copyWith(
          status: DataStatus.success, userProfile: result.getRight()));
    }
  }

  Future<void> changePassword() async {
    if (changePasswordForm.currentState!.saveAndValidate()) {
      Map<String, dynamic> formValue =
          changePasswordForm.currentState?.value ?? {};
      PasswordParams passwordParams = PasswordParams(
          oldPassword: formValue['oldPassword'],
          newPassword: formValue['newPassword']);
      emit(state.copyWith(
        status: DataStatus.loading,
      ));
      final result = await _changePasswordUsecase(passwordParams);
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        AppNavigator.goBack();
        emit(state.copyWith(
            status: DataStatus.success, message: result.getRight()));
      }
    }
  }

  Future<void> updateProfile(ProfileParams profileParams) async {
    emit(state.copyWith(
      status: DataStatus.loading,
    ));
    final result = await _updateProfileUsecase(profileParams);
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      // AppNavigator.goBack();
      emit(state.copyWith(
          status: DataStatus.success, message: result.getRight()));
         
    
    }
  }
}

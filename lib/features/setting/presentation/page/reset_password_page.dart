import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/constants/app_images.dart';
import 'package:gd/core/widgets/custom_textfield.dart';
import 'package:gd/core/widgets/loading_widget_docs.dart';
import 'package:gd/features/setting/presentation/cubit/setting_cubit.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../generated/locale_keys.g.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameControl = TextEditingController();
    TextEditingController passwordControl = TextEditingController();
    return BlocConsumer<SettingCubit, SettingState>(listener: (context, state) {
      if (state.status == DataStatus.failure) {
        Fluttertoast.showToast(msg: state.error ?? '');
      }
      if (state.status == DataStatus.success) {
        Fluttertoast.showToast(msg: state.message.toString());
      }
    }, builder: (context, state) {
      if (state.status == DataStatus.loading) {
        return const LoadingDocsWidget();
      }

      return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.secondaryColor,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: FormBuilder(
              key: context.read<SettingCubit>().changePasswordForm,
              child: Column(
                children: [
                  // Image.asset(AppImages.appLogo),
                  // const SizedBox(height: 20),
                  Text(
                    LocaleKeys.kChangePassword.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: usernameControl,
                    color: AppColors.whiteGreyColor,
                    name: "oldPassword",
                    icon: AppImages.lock,
                    obscureText: true,
                    // controller: ,
                    hintText: LocaleKeys.kOldPassword.tr(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required<String>(
                        errorText: LocaleKeys.kRequiredField.tr(),
                      ),
                      FormBuilderValidators.minLength(6,
                          errorText: LocaleKeys.kPasswordValidateText.tr())
                    ]),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: passwordControl,
                    color: AppColors.whiteGreyColor,
                    name: "newPassword",
                    obscureText: true,
                    icon: AppImages.lock,
                    hintText: LocaleKeys.kNewPassword.tr(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required<String>(
                        errorText: LocaleKeys.kRequiredField.tr(),
                      ),
                      FormBuilderValidators.minLength(6,
                          errorText: LocaleKeys.kPasswordValidateText.tr())
                    ]),
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
                      await context.read<SettingCubit>().changePassword();
                    },
                    child: Text(
                      LocaleKeys.kOk.tr(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(LocaleKeys.kDontHaveAnAccount.tr(),
                  //         style: Theme.of(context).textTheme.bodyMedium),
                  //     TextButton(
                  //       onPressed: () {
                  //         AppNavigator.goBack();
                  //         AppNavigator.navigateTo(RoutePath.signUpRoute);
                  //       },
                  //       child: Text(LocaleKeys.kSignUp.tr()),
                  //     )
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

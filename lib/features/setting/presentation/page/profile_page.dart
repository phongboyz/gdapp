// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/constants/app_images.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/params/profile_param.dart';
import 'package:gd/core/widgets/app_alert.dart';
import 'package:gd/core/widgets/custom_textfield.dart';
import 'package:gd/core/widgets/loading_widget_docs.dart';
import 'package:gd/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:gd/generated/locale_keys.g.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstName = TextEditingController();
    TextEditingController lastName = TextEditingController();
    // TextEditingController mailName = TextEditingController();
    return BlocConsumer<SettingCubit, SettingState>(listener: (context, state) {
      if (state.status == DataStatus.failure) {
        Fluttertoast.showToast(msg: state.error ?? '');
      }
      // if (state.status == DataStatus.success) {

      // }
    }, builder: (context, state) {
      if (state.status == DataStatus.loading) {
        return const LoadingDocsWidget();
      }
      firstName.text = "${state.userProfile?.firstname}";
      lastName.text = "${state.userProfile?.lastname}";
      // mailName.text = "${state.userProfile?.}";
      return Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.kProfile.tr())),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(LocaleKeys.kFirstName.tr()),
                CustomTextField(
                  controller: firstName,
                  color: AppColors.whiteGreyColor,
                  name: "name",
                  icon: AppImages.user,
                  hintText: LocaleKeys.kFirstName.tr(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(LocaleKeys.kLastName.tr()),
                CustomTextField(
                  controller: lastName,
                  color: AppColors.whiteGreyColor,
                  name: "lastName",
                  icon: AppImages.user,
                  hintText: LocaleKeys.kLastName.tr(),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: ElevatedButton(
                      onPressed: () async {
                        ProfileParams dataProfile = ProfileParams(
                            firstname: firstName.text, lastname: lastName.text);
                        await context
                            .read<SettingCubit>()
                            .updateProfile(dataProfile);
                        AppAlerts().showAlertDialog(
                            // onPressCancel: AppNavigator.goBack,
                            onPressed: AppNavigator.goBack,
                            context: context,
                            title: LocaleKeys.kAlert.tr(),
                            detail:
                                'ອັບເດດສຳເລັດ ອອກລະບົບແລ້ວເຂົ້າລະບົບໃຫ່ມຈະເຫັນການປຽນແປ່ງ');
                      },
                      child: Text(LocaleKeys.kSave.tr())),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

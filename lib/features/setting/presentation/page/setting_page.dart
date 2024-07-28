import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/routes/route_path.dart';
import 'package:gd/core/widgets/loading_widget_docs.dart';
import 'package:gd/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:gd/features/setting/presentation/widget/list_menu.dart';
import 'package:gd/features/setting/presentation/widget/profile_box.dart';
import 'package:gd/generated/locale_keys.g.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<SettingCubit>()..getProfile();
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocConsumer<SettingCubit, SettingState>(
            listener: (context, state) {
          // if (state.status == DataStatus.failure) {
          //   Fluttertoast.showToast(msg: state.error ?? '');
          // }
        }, builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingDocsWidget();
          }
          final user = state.userProfile;
          // var image = jsonDecode("${user?.profile}");  // error
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileBox(
                      title: '${user?.business}',
                      code: '${user?.firstname}',
                      profile: '',
                      press: () {
                        AppNavigator.navigateTo(RoutePath.profile);
                      }),
                  ListMenuBox(
                    iconWidget: const Icon(Icons.password_sharp),
                    title: LocaleKeys.kChangePassword.tr(),
                    press: () {
                      AppNavigator.navigateTo(RoutePath.changePasswordRoute);
                    },
                    widget: null,
                  ),
                  ListMenuBox(
                    iconWidget: const Icon(Icons.language),
                    title: LocaleKeys.kChangeLanguage.tr(),
                    press: () {
                      AppNavigator.navigateTo(RoutePath.languageRoute);
                    },
                    widget: null,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        AppNavigator.pushAndRemoveUntil(RoutePath.initRoute);
                      },
                      child: Text(
                        LocaleKeys.kLogout.tr(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // ListMenuBox(
                  //   iconWidget: const Icon(Icons.check_box),
                  //   title: LocaleKeys.kOk.tr(),
                  //   press: () async {
                  // print('==== test start ====');
                  //  final NetworkCall _networkCall;
                  // User? user = await DatabaseService()
                  //     .findOne<User>(key: DatabaseKey.userKey);
                  // print(user?.token);
                  // var total = await DatabaseService()
                  //     .getSumTotal(key: DatabaseKey.cartKey);
                  // print(total);
                  //     AppNavigator.navigateTo(RoutePath.scanItemProduct,
                  //         params: 'ttt');
                  // AppNavigator.navigateTo(RoutePath.testPage);
                  //   },
                  //   widget: const Text("Test  "),
                  // ),
                ],
              ),
            ),
          );
        }));
  }
}

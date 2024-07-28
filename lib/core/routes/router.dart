import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/DI/service_locator.dart';
import 'package:gd/core/models/sell_product.dart';
import 'package:gd/core/routes/route_path.dart';
import 'package:gd/core/widgets/not_found_page.dart';
import 'package:gd/features/app/presentation/cubit/app_cubit.dart';
import 'package:gd/features/app/presentation/pages/app_page.dart';
import 'package:gd/features/home/presentation/cubit/home_cubit.dart';
import 'package:gd/features/home/presentation/pages/tabs_page.dart';
import 'package:gd/features/items/presentation/cubit/item_cubit.dart';
import 'package:gd/features/items/presentation/page/item_scan_page.dart';
import 'package:gd/features/login/presentation/cubit/login_cubit.dart';
import 'package:gd/features/login/presentation/pages/login_page.dart';
import 'package:gd/features/sale/presentation/cubit/sale_cubit.dart';
import 'package:gd/features/sale/presentation/page/member_page.dart';
import 'package:gd/features/sale/presentation/page/payment.dart';
import 'package:gd/features/sale/presentation/page/payment_success.dart';
import 'package:gd/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:gd/features/setting/presentation/page/language_page.dart';
import 'package:gd/core/widgets/print_bill_widget.dart';
import 'package:gd/features/setting/presentation/page/profile_page.dart';
import 'package:gd/features/setting/presentation/page/reset_password_page.dart';
class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.initRoute:
        return _materialRoute(
          providers: [
            BlocProvider<AppCubit>(
              create: (context) =>
                  getIt<AppCubit>()..getCurrentUserData(doc: ''),
            ),
          ],
          child: const AppPage(),
        );
      case RoutePath.login:
        return _materialRoute(
          providers: [
            BlocProvider<LoginCubit>(
              create: (context) => getIt<LoginCubit>()..getProfile(),
            )
          ],
          child: const LoginPage(),
        );
      case RoutePath.homeRoute:
        var params = settings.arguments as int?;
        return _materialRoute(
          providers: [
            BlocProvider<HomeCubit>(
              create: (context) => getIt<HomeCubit>(),
            ),
          ],
          child: TabsPage(
            index: params,
          ),
        );
      case RoutePath.languageRoute:
        return _materialRoute(
          providers: [
            BlocProvider<SettingCubit>(
              create: (context) => getIt<SettingCubit>()..getLanguage(),
            ),
          ],
          child: const LanguagePage(),
        );
      case RoutePath.changePasswordRoute:
        return _materialRoute(
          providers: [
            BlocProvider<SettingCubit>(
              create: (context) => getIt<SettingCubit>(),
            ),
          ],
          child: const ChangePasswordPage(),
        );
      case RoutePath.profile:
        return _materialRoute(
          providers: [
            BlocProvider<SettingCubit>(
              create: (context) => getIt<SettingCubit>()..getProfile(),
            ),
          ],
          child: const ProfilePage(),
        );
      case RoutePath.payment:
        return _materialRoute(
          providers: [
            BlocProvider<SaleCubit>(
              create: (context) => getIt<SaleCubit>()..getProductItem(),
            ),
          ],
          child: const PaymentPage(),
        );
      case RoutePath.members:
        return _materialRoute(
          providers: [
            BlocProvider<SaleCubit>(
              create: (context) => getIt<SaleCubit>()..getMember(''),
            ),
          ],
          child: const MemberPage(),
        );
      case RoutePath.scanItemProduct:
        var params = settings.arguments as String;
        return _materialRoute(
          providers: [
            BlocProvider<ItemCubit>(
              create: (context) => getIt<ItemCubit>(),
            ),
          ],
          child: ScanItemsPage(
            search: params,
          ),
        );
      case RoutePath.paymentSuccessScreen:
        var params = settings.arguments as SellProduct;
        return _materialRoute(
          providers: [
            BlocProvider<SaleCubit>(
              create: (context) => getIt<SaleCubit>(),
            ),
          ],
          child: PaymentSuccessScreen(sellProduct: params),
        );
      case RoutePath.testPage:
        return _materialRoute(
          child: const PrintBillWidget(),
          // child:const TestPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotFound(),
        );
    }
  }

  static Route<dynamic> _materialRoute(
      {required Widget child, List<BlocProvider> providers = const []}) {
    return MaterialPageRoute(
        builder: (context) => providers.isNotEmpty
            ? MultiBlocProvider(providers: providers, child: child)
            : child);
  }
}

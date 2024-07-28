import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/DI/service_locator.dart';
import 'package:gd/core/widgets/not_found_page.dart';
import 'package:gd/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:gd/features/dashboard/presentation/page/dashboard_page.dart';
import 'package:gd/features/home/presentation/cubit/home_cubit.dart';
import 'package:gd/features/items/presentation/cubit/item_cubit.dart';
import 'package:gd/features/items/presentation/page/item_page.dart';
import 'package:gd/features/items/presentation/page/scanner_page.dart';
import 'package:gd/features/sale/presentation/cubit/sale_cubit.dart';
import 'package:gd/features/sale/presentation/page/sale_page.dart';
import 'package:gd/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:gd/features/setting/presentation/page/setting_page.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../generated/locale_keys.g.dart';
import '../widgets/tab_item.dart';

class TabsPage extends StatelessWidget {
  final int? index;
  const TabsPage({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    // int? test;
    index == null || index == 0
        ? 0 + 0
        : context.read<HomeCubit>().onChangedTab(index!);
    // bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
              body: Builder(
                builder: (context) {
                  switch (state.currentTab) {
                    case 0:
                      return MultiProvider(
                        providers: [
                          BlocProvider<DashboardCubit>(
                            create: (context) =>
                                getIt<DashboardCubit>()..getDashboard(),
                          )
                        ],
                        child: const DashboardPage(),
                      );
                    case 1:
                      return MultiProvider(
                        providers: [
                          BlocProvider<SaleCubit>(
                            create: (context) =>
                                getIt<SaleCubit>()..getProductItem(),
                          )
                        ],
                        child: const SalePage(),
                      );
                    case 2:
                      return MultiProvider(
                        providers: [
                          BlocProvider<ItemCubit>(
                            create: (context) =>
                                getIt<ItemCubit>()..getProduct(),
                          )
                        ],
                        child: const ItemsPage(),
                      );
                    case 3:
                      return MultiProvider(
                        providers: [
                          BlocProvider<SettingCubit>(
                            create: (context) =>
                                getIt<SettingCubit>()..getProfile(),
                          )
                        ],
                        child: const SettingPage(),
                      );
                    case 4:
                      return const ScanPage();
                    default:
                      return const PageNotFound();
                  }
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  context.read<HomeCubit>().onChangedTab(4);
                },
                child: const Icon(Icons.qr_code_scanner),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                child: SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0, left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TabItem(
                          onPressed: () {
                            context.read<HomeCubit>().onChangedTab(0);
                          },
                          active: state.currentTab == 0,
                          icon: Image.asset(
                            AppImages.dashboard,
                            width: 25,
                            height: 25,
                          ),
                          activeIcon: Image.asset(
                            AppImages.dashboardActive,
                            width: 25,
                            height: 25,
                          ),
                          title: LocaleKeys.kDashboard.tr(),
                        ),
                        TabItem(
                          onPressed: () {
                            context.read<HomeCubit>().onChangedTab(1);
                          },
                          active: state.currentTab == 1,
                          icon: Image.asset(
                            AppImages.sale,
                            width: 25,
                            height: 25,
                          ),
                          activeIcon: Image.asset(
                            AppImages.saleActive,
                            width: 25,
                            height: 25,
                          ),
                          title: LocaleKeys.kSale.tr(),
                        ),
                        Container(
                          // margin: const EdgeInsets.only(left: 20),
                          width: 30,
                        ),
                        TabItem(
                          onPressed: () {
                            context.read<HomeCubit>().onChangedTab(2);
                          },
                          active: state.currentTab == 2,
                          icon: Image.asset(
                            AppImages.item,
                            width: 25,
                            height: 25,
                          ),
                          activeIcon: Image.asset(
                            AppImages.itemActive,
                            width: 25,
                            height: 25,
                          ),
                          title: LocaleKeys.kItem.tr(),
                        ),
                        SizedBox(
                          width: 60,
                          child: TabItem(
                            onPressed: () {
                              context.read<HomeCubit>().onChangedTab(3);
                            },
                            active: state.currentTab == 3,
                            icon: Image.asset(
                              AppImages.setting,
                              width: 25,
                              height: 25,
                            ),
                            activeIcon: Image.asset(
                              AppImages.settingActive,
                              width: 25,
                              height: 25,
                            ),
                            title: LocaleKeys.kSettings.tr(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}

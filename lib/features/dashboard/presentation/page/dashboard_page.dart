import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/provider/provider.dart';
import 'package:gd/core/services/money_service.dart';
import 'package:gd/core/widgets/loading_widget_docs.dart';
import 'package:gd/core/widgets/widget_error.dart';
import 'package:gd/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:gd/features/dashboard/presentation/widget/dashboard_box.dart';
import 'package:gd/features/home/presentation/cubit/home_cubit.dart';
import 'package:gd/generated/locale_keys.g.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            LocaleKeys.kAppName.tr(),
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  context.read<HomeCubit>().onChangedTab(1);
                },
                child: badges.Badge(
                    badgeContent:
                        Consumer<DataProvider>(builder: (context, data, child) {
                      return Text('${data.length}',
                          style: const TextStyle(color: Colors.white));
                    }),
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.primaryColor,
                      size: 30,
                    )),
              ),
            )
          ],
        ),
        body: BlocConsumer<DashboardCubit, DashboardState>(
            listener: (context, state) {
          if (state.status == DataStatus.failure) {
            // Fluttertoast.showToast(msg: state.error ?? '');
          }
          if (state.status == DataStatus.success) {
            final prefUser = Provider.of<DataProvider>(context, listen: false);
            prefUser.changeLength(state.length);
          }
        }, builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingDocsWidget();
          }
          if (state.status == DataStatus.failure) {
            return ErrorPage(txt: state.error);
          }
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DashboardBox(
                          title: LocaleKeys.kTotalBuy.tr(),
                          darkColor: Colors.blue,
                          lightColors: Colors.blueAccent,
                          txtMoney: FixMoney.formateMoneyKIB(double.parse(
                              '${state.dashboard?.data_purchase}')),
                        ),
                      ),
                      Expanded(
                        child: DashboardBox(
                          title: LocaleKeys.kTotalSell.tr(),
                          darkColor: Colors.green,
                          lightColors: Colors.greenAccent,
                          txtMoney: FixMoney.formateMoneyKIB(
                              double.parse('${state.dashboard?.data_sell}')),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }
}

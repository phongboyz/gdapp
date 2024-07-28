import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/models/sell_detail.dart';
import 'package:gd/core/models/sell_product.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/params/member_param.dart';
import 'package:gd/core/provider/provider.dart';
import 'package:gd/core/routes/route_path.dart';
import 'package:gd/core/services/money_service.dart';
import 'package:gd/core/widgets/app_alert.dart';
import 'package:gd/core/widgets/loading_widget.dart';
import 'package:gd/features/sale/presentation/cubit/sale_cubit.dart';
import 'package:gd/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<SaleCubit, SaleState>(listener: (context, state) {
      if (state.status == DataStatus.failure) {
        print(state.error.toString());
        // Fluttertoast.showToast(msg: state.error ?? '');
      }
      if (state.status == DataStatus.success) {}
    }, builder: (context, state) {
      if (state.status == DataStatus.loading) {
        return const LoadingDocsWidgetNoteBody();
      }
      if (state.status == DataStatus.failure) {
        return Text(state.error.toString());
      }
      return SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  LocaleKeys.kPayment.tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Consumer<DataProvider>(builder: (context, data, child) {
                  bool memberExist = data.getMemberParams?.members ?? false;
                  return memberExist
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                    '${LocaleKeys.kCustomer.tr()} : ${data.getMemberParams?.name}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                IconButton(
                                    onPressed: () {
                                      MemberParams memberParams = MemberParams(
                                        members: false,
                                      );
                                      final prefUser =
                                          Provider.of<DataProvider>(context,
                                              listen: false);
                                      prefUser.changeMemberParams(memberParams);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 14,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                            Text('ID : ${data.getMemberParams?.contactId}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ],
                        )
                      : Container();
                }),
                const Divider(height: 2),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.product?.length,
                  itemBuilder: (context, index) {
                    var data = state.product?[index];
                    int length = index + 1;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$length. ${data?.name}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                                FixMoney.formateMoneyKIB(
                                    double.parse('${data?.total}')),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ],
                        ),
                        Text(
                            '    ${LocaleKeys.kPrice.tr()} : ${FixMoney.formateMoneyKIB(double.parse('${data?.default_sell_price}'))} * ${data?.amount}'),
                      ],
                    );
                  },
                ),
                const Divider(height: 2),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.kTotal.tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                        FixMoney.formateMoneyKIB(
                            double.parse('${state.total}')),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ],
                ),
                // const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    TextButton(
                        onPressed: () {
                          AppNavigator.navigateTo(RoutePath.members);
                        },
                        child: Text(LocaleKeys.kAddCustomer.tr())),
                  ],
                ),
                // const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        final member =
                            Provider.of<DataProvider>(context, listen: false)
                                .memberParams;
                        if (member?.members == true) {
                          String id =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          // String detail = jsonEncode(state.product);
                          // detail
                          List<SellDetail> detailGen = [];
                          state.product?.forEach(
                            (element) => detailGen.add(SellDetail(
                                product_id: element.id,
                                price: double.parse(
                                    '${element.default_sell_price}'),
                                qty: element.amount,
                                discount: 0)),
                          );
                          String detail = jsonEncode(detailGen);
                          print(detail);
                          //
                          SellProduct data = SellProduct(
                              contact_id: member?.contactId,
                              billno: id,
                              amount: "${state.total}",
                              details: detail);
                          AppNavigator.pushAndRemoveUntil(
                              RoutePath.paymentSuccessScreen,
                              params: data);
                        } else {
                          AppAlerts().waring(
                              context: context,
                              onPressed: () => AppNavigator.goBack(),
                              title: LocaleKeys.kPleaseAddCustomer.tr());
                        }
                        print("${member?.members} =======");
                      },
                      child: Text(LocaleKeys.kConfirm.tr())),
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}

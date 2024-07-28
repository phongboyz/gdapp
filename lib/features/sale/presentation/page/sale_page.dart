// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/models/cart.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/params/global_key.dart';
import 'package:gd/core/provider/provider.dart';
import 'package:gd/core/routes/route_path.dart';
import 'package:gd/core/services/money_service.dart';
import 'package:gd/core/widgets/emty_widget.dart';
import 'package:gd/core/widgets/loading_widget.dart';
import 'package:gd/features/sale/presentation/cubit/sale_cubit.dart';
import 'package:gd/features/sale/presentation/widget/cart_item.dart';
import 'package:gd/generated/locale_keys.g.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    // int count = 0;
    return Scaffold(
      key: PageCusKeys.sale,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          LocaleKeys.kCart.tr(),
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {},
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
      body: SingleChildScrollView(
        controller: scrollController,
        child: BlocConsumer<SaleCubit, SaleState>(listener: (context, state) {
          if (state.status == DataStatus.failure) {
            print(state.error.toString());
            // Fluttertoast.showToast(msg: state.error ?? '');
          }
          if (state.status == DataStatus.success) {
            final prefUser = Provider.of<DataProvider>(context, listen: false);
            prefUser.changeLength(state.length);
          }
        }, builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingDocsWidgetNoteBody();
          }
          if (state.product!.isEmpty) {
            return const EmptyWidgetNoteBody();
          }
          if (state.status == DataStatus.failure) {
            return Text(state.error.toString());
          }
          print(
            state.product?.length,
          );
          return Column(children: [
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              controller: scrollController,
              itemCount: state.product?.length,
              itemBuilder: (context, index) {
                var data = state.product?[index];
                return CartItem(
                  img: data?.image,
                  name: data?.name,
                  price:
                      FixMoney.formateMoneyKIB(double.parse('${data?.total}')),
                  amount: data?.amount,
                  onDelete: () async {
                    await context.read<SaleCubit>().deleteItem(index: index);
                    // await getCart(context);
                  },
                  onPlus: () async {
                    int? amount = int.parse('${data?.amount}') + 1;
                    double total =
                        amount * double.parse('${data?.default_sell_price}');
                    Cart cart = Cart(
                        key: data?.key,
                        id: data?.id,
                        name: data?.name,
                        image: data?.image,
                        alert_quantity: data?.alert_quantity,
                        sku: data?.sku,
                        default_sell_price: data?.default_sell_price,
                        image_url: data?.image_url,
                        amount: amount,
                        total: total.toString());
                    await context
                        .read<SaleCubit>()
                        .updateItem(itemKey: '${data?.key}', cart: cart);
                    // await getCart(context);
                  },
                  onMinus: () async {
                    int? amountData = int.parse('${data?.amount}');
                    if (amountData <= 1) {
                      // Fluttertoast.showToast(msg: 'Minimum least 1');
                    } else {
                      int? amount = int.parse('${data?.amount}') - 1;
                      double total =
                          amount * double.parse('${data?.default_sell_price}');
                      Cart cart = Cart(
                          key: data?.key,
                          id: data?.id,
                          name: data?.name,
                          image: data?.image,
                          alert_quantity: data?.alert_quantity,
                          sku: data?.sku,
                          default_sell_price: data?.default_sell_price,
                          image_url: data?.image_url,
                          amount: amount,
                          total: total.toString());
                      await context
                          .read<SaleCubit>()
                          .updateItem(itemKey: '${data?.key}', cart: cart);
                      // await getCart(context);
                    }
                  },
                );
              },
            ),
            state.total == 0 || state.total == null
                ? Container()
                : Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        FixMoney.formateMoneyKIB(
                            double.parse(state.total.toString())),
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              AppNavigator.navigateTo(RoutePath.payment);
                            },
                            child: Text(LocaleKeys.kPayment.tr())),
                      )
                    ],
                  ),
            const SizedBox(height: 80),
          ]);
        }),
      ),
      // )
    );
  }

  // _home() async {
  //   final box = Hive.openBox(DatabaseKey.cartKey);
  //   // final data = box.keys.map((key) => {
  //   //   final item = box.get('key'),
  //   // }).toList();
  //   print(box.keys.toString());
  //   return box.keys.toString();
  // }
}

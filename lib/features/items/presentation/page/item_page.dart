// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/constants/app_images.dart';
import 'package:gd/core/models/cart.dart';
import 'package:gd/core/provider/provider.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:gd/core/services/money_service.dart';
import 'package:gd/core/widgets/custom_textfield.dart';
import 'package:gd/core/widgets/loading_widget.dart';
import 'package:gd/core/widgets/widget_error.dart';
import 'package:gd/features/home/presentation/cubit/home_cubit.dart';
import 'package:gd/features/items/presentation/cubit/item_cubit.dart';
import 'package:gd/generated/locale_keys.g.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // getCart(context);
    final double itemSize = MediaQuery.of(context).size.height;
    TextEditingController searchController = TextEditingController();
    ScrollController scrollController = ScrollController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              LocaleKeys.kItem.tr(),
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
                      badgeContent: Consumer<DataProvider>(
                          builder: (context, data, child) {
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
            child: Column(
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        // width: 200,
                        child: CustomTextField(
                          onSummit: (value) {
                            context.read<ItemCubit>().getProductBySearch(
                                search: searchController.text);
                            return null;
                          },
                          controller: searchController,
                          color: AppColors.whiteGreyColor,
                          name: "search",
                          icon: AppImages.search,
                          // controller: ,
                          textInputAction: TextInputAction.search,
                          hintText: LocaleKeys.kSearch.tr(),
                        ),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: 80,
                        child: ElevatedButton(
                          onPressed: () async {
                            context.read<ItemCubit>().getProductBySearch(
                                search: searchController.text);
                          },
                          child: Text(
                            LocaleKeys.kSearch.tr(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocConsumer<ItemCubit, ItemState>(listener: (context, state) {
                  if (state.status == DataStatus.failure) {
                    print(state.error.toString());
                    // print(state.error ?? '');
                  }
                }, builder: (context, state) {
                  if (state.status == DataStatus.loading) {
                    return const LoadingDocsWidgetNoteBody();
                  }
                  if (state.status == DataStatus.failure) {
                    return const ErrorPage();
                  }
                  print(state.product?.data?.length);
                  // print(state.product!.data);
                  return Column(
                    children: [
                      SizedBox(
                        child: GridView.builder(
                            itemCount: state.product?.data?.length,
                            controller: scrollController,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 1,
                              crossAxisCount: 2,
                              childAspectRatio: itemSize / (itemSize + 200),
                            ),
                            itemBuilder: (context, index) {
                              String img = json.decode(json.encode(
                                  '${state.product?.data?[index].image}'));
                              return InkWell(
                                  onTap: () {},
                                  child: Card(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: img.contains('https')
                                                    ? Image.network(
                                                        img.toString())
                                                    : Container(
                                                        margin: const EdgeInsets
                                                            .all(20),
                                                        child: Image.asset(
                                                            AppImages.appLogo),
                                                      )),
                                            Wrap(
                                              children: [
                                                Text(
                                                  '${state.product?.data?[index].name}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FixMoney.formateMoneyKIB(
                                                      double.parse(
                                                          '${state.product?.data?[index].default_sell_price}')),
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 16),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    var productData = state
                                                        .product?.data?[index];
                                                    var keyGen = DateTime.now()
                                                        .millisecondsSinceEpoch;
                                                    print(keyGen);
                                                    Cart cart = Cart(
                                                        key: keyGen.toString(),
                                                        id: productData?.id,
                                                        name: productData?.name,
                                                        image:
                                                            productData?.image,
                                                        alert_quantity:
                                                            productData
                                                                ?.alert_quantity,
                                                        sku: productData?.sku.toString(),
                                                        default_sell_price:
                                                            productData
                                                                ?.default_sell_price,
                                                        image_url: productData
                                                            ?.image_url,
                                                        amount: 1,
                                                        total: productData
                                                            ?.default_sell_price);
                                                    await DatabaseService()
                                                        .addJson<Cart>(
                                                      key: DatabaseKey.cartKey
                                                          .toString(),
                                                      data: cart,
                                                      itemKey:
                                                          keyGen.toString(),
                                                    );
                                                    var indexData =
                                                        await DatabaseService()
                                                            .getLength(
                                                                key: DatabaseKey
                                                                    .cartKey);
                                                    final prefUser = Provider
                                                        .of<DataProvider>(
                                                            context,
                                                            listen: false);
                                                    prefUser.changeLength(
                                                        indexData);
                                                    Fluttertoast.showToast(
                                                        msg: LocaleKeys
                                                            .kAddToCart
                                                            .tr());
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    // margin: const EdgeInsets.all(value),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: AppColors
                                                            .primaryColor),
                                                    child: Text(
                                                      LocaleKeys.kAddToCart
                                                          .tr(),
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                    ],
                  );
                }),
              ],
            ),
          )),
    );
  }
}

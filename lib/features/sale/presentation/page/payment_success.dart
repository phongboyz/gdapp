
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/extensions/date_time_extension.dart';
import 'package:gd/core/models/sell_product.dart';
import 'package:gd/core/navigator/app_navigator.dart';
import 'package:gd/core/params/member_param.dart';
import 'package:gd/core/provider/provider.dart';
import 'package:gd/core/routes/route_path.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:gd/core/services/money_service.dart';
import 'package:gd/core/widgets/loading_widget.dart';
import 'package:gd/core/widgets/widget_error.dart';
import 'package:gd/features/sale/presentation/cubit/sale_cubit.dart';
import 'package:gd/generated/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class PaymentSuccessScreen extends StatefulWidget {
  final SellProduct sellProduct;
  const PaymentSuccessScreen({super.key, required this.sellProduct});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    //Create an instance of ScreenshotController
    ScreenshotController screenshotController = ScreenshotController();
    context.read<SaleCubit>().sellProduct(widget.sellProduct);
    ScrollController scrollController = ScrollController();
    DateTime now = DateTime.now();
    return Scaffold(
        body: BlocConsumer<SaleCubit, SaleState>(listener: (context, state) {
      if (state.status == DataStatus.failure) {
        print(state.error.toString());
        // Fluttertoast.showToast(msg: state.error ?? '');
      }
      if (state.status == DataStatus.success) {
        DatabaseService().delete(key: DatabaseKey.cartKey);
        MemberParams memberParams = MemberParams(members: false, name: null);
        final prefUser = Provider.of<DataProvider>(context, listen: false);
        prefUser.changeMemberParams(memberParams);
      }
    }, builder: (context, state) {
      if (state.status == DataStatus.loading) {
        return const LoadingDocsWidgetNoteBody();
      }
      if (state.status == DataStatus.failure) {
        return ErrorPage(txt: state.error.toString());
      }
      return Scaffold(
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Screenshot(
                controller: screenshotController,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      child: Text('${'ເວລາຊຳລະ:'} ${now.longDate()}',
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      // height: 500,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),

                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('GD ກວາງຕັງ 021214734'),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  'ໃບສັງເຄື່ອງ ${state.bill?.transaction_date}'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ເລກບີນ :  ${state.bill?.invoice_no}'),
                              Text('ວັນທີ: ${now.shortDate()}'),
                            ],
                          ),
                          Text('ຜູ້ຂາຍ: ${state.seller ?? ""}'),
                          Text('ລະຫັດລູກຄ້າ: ${state.bill?.customer}'),
                          Text('ທີຢູ່ລູກຄ້າ: ${state.bill?.address ?? ""}'),
                          const Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                          const Text('ລາຍການສີນຄ້າ'),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ຊື່ສີນຄ້າ'),
                              Text('ຈຳນວນ'),
                              Text('ລວມ'),
                            ],
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                          ListView.builder(
                            controller: scrollController,
                            shrinkWrap: true,
                            // itemCount: 10,
                            itemCount: state.product?.length,
                            itemBuilder: (context, index) {
                              var data = state.product?[index];
                              // int length = index + 1;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${data?.name}',
                                      ),
                                      Text(
                                        '${data?.amount}',
                                      ),
                                      Text(
                                        FixMoney.formateMoneyKIB(
                                            double.parse('${data?.total}')),
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            height: 2,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              'ລວມເງີນທີຕ້ອງຈ່າຍ : ${FixMoney.formateMoneyKIB(double.parse('${state.total}'))}'),
                          const SizedBox(
                            height: 20,
                          ),
                          // Text('ປະເພດຈ່າຍ : ເງີນສົດ'),
                          // Text(''),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // Image.asset(
                    //   AppImages.completed,
                    //   height: 130,
                    //   color: AppColors.primaryColor,
                    // ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(
                  //   height: 45,
                  //   width: 140,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: AppColors.primaryColor,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(30.0),
                  //         ),
                  //       ),
                  //       onPressed: () async {
                  //         // path = '$directory';
                  //         // screenshotController.capture().then((value) => {
                  //         //       print('===== image done========='),
                  //         //       Fluttertoast.showToast(msg: 'image saved')
                  //         //     });
                  //         final directory =
                  //             (await getApplicationDocumentsDirectory())
                  //                 .path; //from path_provide package
                  //         String fileNameImage =
                  //             'GD ${DateTime.now().microsecondsSinceEpoch}';
                  //         String path = directory;
                  //         screenshotController.captureAndSave(
                  //             path //set path where screenshot will be saved
                  //             ,
                  //             fileName: fileNameImage);
                  //         // AppAlerts()
                  //         // AppAlerts().showAlertDialog(
                  //         //     context: context,
                  //         //     onPressed: () => AppNavigator.goBack(),
                  //         //     title: LocaleKeys.kAlert.tr(),
                  //         //     detail: 'coming soon');
                  //       },
                  //       child: Text(
                  //         LocaleKeys.kSave.tr(),
                  //         style: const TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.bold),
                  //       )),
                  // ),
                  SizedBox(
                    height: 45,
                    width: 130,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () async {
                          context.read<SaleCubit>().printBill(
                              bill: state.bill,
                              product: state.product,
                              seller: state.seller,
                              total: state.total);
                          // await generatePdf(
                          //     bill: state.bill,
                          //     product: state.product,
                          //     seller: state.seller,
                          //     total: state.total);
                        },
                        child: Text(
                          LocaleKeys.kBill.tr(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 45,
                    width: 130,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          AppNavigator.pushAndRemoveUntil(RoutePath.homeRoute);
                        },
                        child: Text(
                          LocaleKeys.kBackHome.tr(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }));
  }
}

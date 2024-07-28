import 'package:flutter/material.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_images.dart';

class CartItem extends StatelessWidget {
  final String? name;
  final String? price;
  final String? img;
  final VoidCallback? onDelete;
  final VoidCallback? onPlus;
  final VoidCallback? onMinus;
  final int? amount;
  const CartItem(
      {super.key,
      this.name,
      this.price,
      this.img,
      this.onDelete,
      this.onPlus,
      this.onMinus,
      this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                          height: 90,
                          width: 90,
                          child: '$img'.contains('https')
                              ? Image.network("$img")
                              : Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Image.asset(AppImages.appLogo),
                                )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Stack(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    name ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                GestureDetector(
                                    onTap: onDelete,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                            Text(price ?? '',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            // Text('${LocaleKeys.kPrice.tr()} : }',
                            //     style: const TextStyle()),
                            // Text('${LocaleKeys.kSubTotal.tr()} : }',
                            //     // 'sub total : ${FixDouble.money(totalPrice)}',
                            //     style: const TextStyle()),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: onMinus,
                                                  child: const Icon(
                                                      Icons.remove,
                                                      color: Colors.white)),
                                              Text(amount.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                              InkWell(
                                                  onTap: onPlus,
                                                  child: const Icon(Icons.add,
                                                      color: Colors.white))
                                            ]))),
                              ],
                            ),
                          ],
                        ),
                      ]))
                    ])
              ]))
    ]));
  }
}

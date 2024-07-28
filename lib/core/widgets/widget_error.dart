import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gd/core/constants/lotties_path.dart';
import 'package:gd/generated/locale_keys.g.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  final String? txt;
  const ErrorPage({super.key, this.txt});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(LottiesPath.wrong, width: 100, height: 100),
          Text(txt ?? LocaleKeys.kSomethingWentWrong.tr())
        ],
      ),
    );
  }
}

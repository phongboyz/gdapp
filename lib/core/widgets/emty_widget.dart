import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gd/core/constants/app_images.dart';
import 'package:gd/generated/locale_keys.g.dart';

// import '../constants/app_colors.dart';

class EmptyWidgetNoteBody extends StatelessWidget {
  const EmptyWidgetNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const  SizedBox(height: 10),
          // Lottie.asset(LottiesPath.loadingDocs, width: 100, height: 100),
          Image.asset(AppImages.appLogo, width: 80, height: 80),
          SizedBox(child: Text(LocaleKeys.kEmpty.tr())),
        ],
      ),
    );
  }
}

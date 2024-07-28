import 'package:flutter/material.dart';
import 'package:gd/core/constants/app_colors.dart';
import 'package:gd/core/constants/app_images.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
    required this.title,
    required this.code,
    required this.profile,
    required this.press,
  });
  final String title;
  final String code;
  final String profile;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.white,
                ),
                shape: BoxShape.circle,
                image:
                    // profile != 'null' || profile == ''
                    //     ? DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: NetworkImage('${ShopUrl.profilePath}$profile')):
                    const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppImages.userWhite)),
              ),
            ),
          ),
          Positioned(
            left: 90,
            top: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 5),
                Text(
                  code,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

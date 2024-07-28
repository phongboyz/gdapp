import 'package:flutter/material.dart';
import 'package:gd/core/constants/app_colors.dart';

class TabItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool active;
  final Widget activeIcon;
  final VoidCallback? onPressed;
  const TabItem(
      {super.key,
      required this.title,
      required this.activeIcon,
      required this.icon,
      this.active = false,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          active ? activeIcon : icon,
          const SizedBox(height: 2),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: active ? AppColors.primaryColor : Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}

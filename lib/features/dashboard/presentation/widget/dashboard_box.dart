import 'package:flutter/material.dart';

class DashboardBox extends StatelessWidget {
  const DashboardBox(
      {super.key,
      required this.txtMoney,
      required this.title,
      required this.darkColor,
      required this.lightColors});
  final String txtMoney;
  final String title;
  final Color darkColor;
  final Color lightColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 10),
      height: 130,
      // width: 165,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [darkColor, lightColors],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp),
          color: Colors.green,
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 10, top: 10),
              child: const Icon(
                Icons.monetization_on_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  txtMoney,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

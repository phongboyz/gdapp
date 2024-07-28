
import 'package:flutter/material.dart';

class ListMenuBox extends StatelessWidget {
  const ListMenuBox({
    super.key,
     this.title,
     this.press,
     this.widget, this.iconWidget,
  });
  final String? title;
  final Widget? widget;
  final Widget? iconWidget;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
        height: 55,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              height: 30,
              width: 30,
              child: iconWidget ?? Container(),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.only(left: 60),
                child: Text(
                  title??'',
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: widget ?? Container(),
          ),
        ]),
      ),
    );
  }
}

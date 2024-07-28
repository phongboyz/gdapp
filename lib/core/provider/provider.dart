import 'package:flutter/material.dart';
import 'package:gd/core/params/member_param.dart';

class DataProvider with ChangeNotifier {
  int length = 0;
  int get getLength => length;
  void changeLength(value) async {
    length = value;
    notifyListeners();
  }

  MemberParams? memberParams;
  MemberParams? get getMemberParams => memberParams;
  void changeMemberParams(value) async {
    memberParams = value;
    notifyListeners();
  }
}

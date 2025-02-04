import 'package:costbridge/singleton/MemberViewModel.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/cupertino.dart';

class MemberProvider extends ChangeNotifier {
  late Member member;

  void updateMember(Member member){
    this.member = member;
    notifyListeners();
  }
}

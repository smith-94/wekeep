
import 'dart:async';
import 'dart:convert';


import 'package:costbridge/ui/login/api/login_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:costbridge/localstorage/local_storage.dart';


class LoginViewModel extends ChangeNotifier {
  static Member? member;

  Future doLogin(String userId,String userPw) async {
    await LoginApi.login(userId: userId, userPw: userPw).then((value) => {
      member = value
    });
    }

  void setAutoLogin(Member? member) {
    LocalStorage.setUser(jsonEncode(member!.toJson()));
  }
  Member? getStatic(){
    return member;
  }
  Member? getMember(){
    return member;
  }
}


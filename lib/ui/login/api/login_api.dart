import 'package:dio/src/response.dart';
import 'package:costbridge/api/dio_service.dart';
import 'package:costbridge/vo/member/member.dart';

class LoginApi {
  // 이벤트 참여 조회
  static Future<Member?> login({
    required String userId,
    required String userPw,
  }) async {
    try {
      var response = await DioService().post('/member/login', data: {
        'userId': userId,
        'userPw': userPw,
      });
      if (response.data == "") {
        return null;
      }
      return Member.fromJson(response.data);
    }
    catch(e){
      return null;
    }
  }

}

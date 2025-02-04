

import 'package:wekeep/api/dio_service.dart';

class CommonApi{

  static Future<String> authPhone(String phone) async {
    Map<String, dynamic> queryParameters = {
      'phone': phone,
    };
    var response =  await DioService().get('/member/phone/auth', queryParameters: queryParameters);
    return await response.data;
  }
}

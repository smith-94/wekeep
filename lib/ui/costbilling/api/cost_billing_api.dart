import 'dart:io';

import 'package:costbridge/common/const/common_host.dart';
import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:dio/src/response.dart';
import 'package:costbridge/api/dio_service.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:http/http.dart' as http;

class CostBillingApi {

  static Future<List<CostBilling>> getList({
    required int memberId,
    required String? status,
    required DateTime? startDate,
    required DateTime? endDate,
    required bool? adminYn,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {
        'memberId': memberId,
        'status': status,
        'startDate': startDate?.toIso8601String().substring(0,10),
        'endDate': endDate?.toIso8601String().substring(0,10),
        'adminYn': adminYn,
      };
      var response = await DioService().get('/cost-billing/list', queryParameters: queryParameters);
      if (response.data == "") {
        return List.empty();
      }
      return CostBilling.fromJsonList(response.data);
    }
    catch(e){
      print(e);
      return List.empty();
    }
  }

  static Future<List<CostBilling>> mockList({
    required int memberId,
    required DateTime? startDate,
    required DateTime? endDate,
  }) async {
    try {
      Map<String, dynamic> queryParameters = {
        'memberId': 1
      };
      var response = await DioService().get('/cost-billing/mock-list', queryParameters: queryParameters);
      if (response.data == "") {
        return List.empty();
      }
      return CostBilling.fromJsonList(response.data);
    }
    catch(e){
        print(e);
        return List.empty();
    }
  }


  static Future<CostBilling?> uploadCostBillings({
    required CostBilling costBilling
  }) async {
    try {
      var response = await DioService().post('/cost-billing', data: {
        'companyName': costBilling.companyName,
        'memberId': costBilling.memberId,
        'productCategory': costBilling.productCategory,
        'brand': costBilling.brand,
        'imgUrl': costBilling.imgUrl,
        'price': costBilling.price,
        'deadType': costBilling.deadType,
        'reqProcessTime': DateTime.parse(costBilling.reqProcessTime+" 00:00:10.000").toIso8601String(),
      });
      if (response.data == "") {
        return null;
      }
      return CostBilling.fromJson(response.data);
    }
    catch(e){
      return null;
    }
  }

  static Future<String> costBillingImageUpload(List<File> images) async{
    var request = http.MultipartRequest("POST", Uri.parse(imgApiUrl));
    for(int i =0;i<images.length;i++){
      request.files.add(await http.MultipartFile.fromPath('images', images[i].path));
    }

    var response = await request.send();

    print(':: 결과 ${response}');
    return response.stream.bytesToString();
  }

  static delete({required int id}) async{
    try {
      var response = await DioService().post('/cost-billing/delete', data: {
        'id': id
      });
      if (response.data == "") {
        return null;
      }
      return CostBilling.fromJson(response.data);
    }
    catch(e){
      return null;
    }
  }

  static excelExport(int memberId, DateTime startDate, DateTime endDate) async{
    try {
      Map<String, dynamic> queryParameters = {
        'memberId': memberId,
        'startDate': startDate.toString().substring(0,10),
        'endDate': endDate.toString().substring(0,10),
      };
      var response = await DioService().get('/cost-billing/excel', queryParameters: queryParameters);

      if (response.data == "") {
        return null;
      }
      return CostBilling.fromJson(response.data);
    }
    catch(e){
      return null;
    }
  }

  static finish({required int id}) async{
    try {
      var response = await DioService().post('/cost-billing/finish', data: {
        'id': id
      });
      if (response.data == "") {
        return null;
      }
      return CostBilling.fromJson(response.data);
    }
    catch(e){
      return null;
    }
  }
}



import 'package:costbridge/api/dio_service.dart';
import 'package:costbridge/vo/company/company.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CompanyProvider extends ChangeNotifier{
  static List<String>? _companyNames =[];
  String deadType = "정상";

  CompanyProvider(){
    DioService().get('/company/list',).then((response) => {
      _companyNames = Company.fromJsonListCompanyName(response.data)
    });
    notifyListeners();
  }
  List<String>? get companyNames => _companyNames;

   List<String>? getCompanyList(String companyName){
    return _companyNames?.where((element) => element.contains(companyName)).toList();
  }
   List<String> getAllCompanyNames(){
    return companyNames!;
  }
}

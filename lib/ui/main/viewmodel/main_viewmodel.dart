
import 'dart:async';


import 'package:costbridge/provider/costbilling_provider.dart';
import 'package:costbridge/provider/member_provider.dart';
import 'package:costbridge/repository/cost_billing_repository.dart';
import 'package:costbridge/repository/cost_billing_repository.dart';
import 'package:costbridge/repository/cost_billing_repository.dart';

import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../repository/cost_billing_repository.dart';


class MainViewModel with ChangeNotifier {
  late final CostBillingProvider _costBillingProvider;
  late final MemberProvider _memberProvider;

  List<CostBilling> billings = [];
  String selectStatus = '';
  DateTime startDate = DateTime.now().subtract(Duration(days:1));
  DateTime endDate = DateTime.now();

  MainViewModel(CostBillingProvider costBillingProvider, MemberProvider memberProvider){
    _costBillingProvider = costBillingProvider;
    _memberProvider = memberProvider;
    refreshCostBilling();
  }

  Future refreshCostBilling() async {
    _costBillingProvider.refreshCostBilling(_memberProvider.member.id!,selectStatus,startDate,endDate,getAdminYn()).then((value) => {
      billings = value,
      notifyListeners()
    });
  }
  void settingStartDate(int memberId,DateTime startDate){
    this.startDate = startDate;
    refreshCostBilling();
  }
  void settingEndDate(int memberId,DateTime endDate){
    this.endDate = endDate;
    refreshCostBilling();
  }
  void settingStatus(String status){
    selectStatus = status;
    refreshCostBilling();
  }
  Member? getMember(){
    return _memberProvider.member;
  }
  bool getAdminYn(){
    return _memberProvider!.member!.adminYn ?? false;
  }
  Future excelExport() async{
    _costBillingProvider.excelExport(_memberProvider.member!.id!, startDate, endDate);
  }
}

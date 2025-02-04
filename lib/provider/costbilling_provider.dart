import 'package:costbridge/repository/cost_billing_repository.dart';
import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/cupertino.dart';

class CostBillingProvider extends ChangeNotifier {
  List<CostBilling> billings = [];
  late CostBillingRepository repository;

  CostBillingProvider(){
    repository = CostBillingRepository();
  }
  Future finishCostBilling(int id) async {
    await repository.finishBilling(id);
  }

  Future deleteCostBilling(int id) async {
    await repository.deleteBilling(id);
  }
  Future<List<CostBilling>> refreshCostBilling(int memberId,String selectStatus,DateTime startDate,DateTime endDate,bool adminYn) async {
     return await repository.getBillings(memberId,selectStatus,startDate,endDate,adminYn);
  }
  Future excelExport(int memberId,DateTime startDate,DateTime endDate) async {
    return await repository.excelExport(memberId,startDate,endDate);
  }
}


import 'package:costbridge/provider/member_provider.dart';
import 'package:costbridge/ui/costbilling/api/cost_billing_api.dart';
import 'package:costbridge/ui/costbilling/dto/costbilling.dart';

class CostBillingRepository{

  Future<List<CostBilling>> getBillings(int memberId,String status,DateTime startDate,DateTime endDate,bool adminYn) async {
    return await CostBillingApi.getList(memberId: memberId, status: status,startDate: startDate,endDate: endDate,adminYn: adminYn);
  }

  Future finishBilling(int id) async{
    return await CostBillingApi.finish(id: id);
  }

  Future deleteBilling(int id) async {
    return await CostBillingApi.delete(id: id);
  }

  Future excelExport(int memberId, DateTime startDate, DateTime endDate) async{
    return await CostBillingApi.excelExport(memberId,startDate,endDate);
  }
}

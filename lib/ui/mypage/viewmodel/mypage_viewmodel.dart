import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:stacked/stacked.dart';

class MyPageViewModel extends BaseViewModel{
  Member member;
  List<CostBilling> billingList;
  MyPageViewModel({required this.member,required this.billingList});

}

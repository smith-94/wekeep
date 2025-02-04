import 'package:costbridge/provider/member_provider.dart';

import 'package:costbridge/ui/mypage/viewmodel/mypage_viewmodel.dart';
import 'package:costbridge/ui/mypage/widget/mypage_widget.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class MyPageView extends StackedView<MyPageViewModel> {
  const MyPageView({super.key});

  @override
  Widget builder(BuildContext context, MyPageViewModel viewModel, Widget? child) {
    return Scaffold(
      body: MypageWidget(member: viewModel.member,billings: viewModel.billingList,),
    );
  }

  @override
  MyPageViewModel viewModelBuilder(BuildContext context) {
    final memberProvider = context.read<MemberProvider>();
    // final costBillingProvider = context.read<CostBillingProvider>();
    // costBillingProvider.refreshCostBillings(memberProvider.member.id!,null,null);
    return MyPageViewModel(member: memberProvider!.member!,billingList: List.empty());
  }
}

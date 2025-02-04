import 'package:costbridge/provider/costbilling_provider.dart';
import 'package:costbridge/provider/member_provider.dart';

import 'package:costbridge/ui/main/viewmodel/main_viewmodel.dart';
import 'package:costbridge/ui/main/widget/main_widget.dart';
import 'package:costbridge/ui/mypage/viewmodel/mypage_viewmodel.dart';
import 'package:costbridge/ui/mypage/widget/mypage_widget.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final memberProvider = Provider.of<MemberProvider>(context);
    final costBillingProvider = Provider.of<CostBillingProvider>(context);
    return ChangeNotifierProvider<MainViewModel>(
        create: (_) => MainViewModel(costBillingProvider,memberProvider),
        child: MainWidget());
  }
}

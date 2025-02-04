
import 'package:costbridge/common/const/font.dart';
import 'package:costbridge/core/app_export.dart';
import 'package:costbridge/core/utils/size_utils.dart';
import 'package:costbridge/provider/costbilling_provider.dart';
import 'package:costbridge/provider/member_provider.dart';
import 'package:costbridge/ui/common/toast/toast_util.dart';
import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:costbridge/ui/costbilling/page/cost_billing_detail_page.dart';
import 'package:costbridge/ui/main/viewmodel/main_viewmodel.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CostBillingListItem extends StatelessWidget {
  final CostBilling billing;
  final Member member;
  const CostBillingListItem(this.billing, {super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    final costBillingProvider = Provider.of<CostBillingProvider>(context);
    return SafeArea(
      child: Column(
        children: [
              const SizedBox(height: 10,),
              InkWell(
                onTap: ((){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CostBillingDetailPage(billing: billing,member: mainViewModel.getMember()!,)))
                  .then((value) => {
                    mainViewModel.refreshCostBilling()
                  });
                }),
                child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white70,
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 20.v,),
                    Column(
                      children: [
                        if(billing.costBillingStatus == "REQUEST")
                        Container(
                          width: mediaQueryData.size.width * 0.19,
                          height: mediaQueryData.size.height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            color: Colors.green,
                          ),
                          child: Center(
                              child:
                              member.adminYn == true ?
                              InkWell(
                                onTap: ((){
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      // 바깥 영역 터치시 닫을지 여부
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: 400.h,
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 34.h),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(height: 5.v),
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 400.h,
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: 82.h,
                                                      vertical: 33.v,
                                                    ),
                                                    decoration:
                                                    AppDecoration.white.copyWith(
                                                      borderRadius: BorderRadiusStyle
                                                          .customBorderTL20,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: [
                                                        SizedBox(height: 10.v),
                                                        Text(
                                                          "결재 처리 \n 하시겠습니까?",
                                                          textAlign: TextAlign.center,
                                                          style: CustomTextStyles.titleMediumPretendardBlack900,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Card(
                                                    clipBehavior: Clip.antiAlias,
                                                    elevation: 0,
                                                    margin: EdgeInsets.all(0),
                                                    color: appTheme.whiteA700,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadiusStyle
                                                          .customBorderBL20,
                                                    ),
                                                    child: Container(
                                                      height: 60.v,
                                                      width: 400.h,
                                                      decoration:
                                                      AppDecoration.white.copyWith(
                                                        borderRadius: BorderRadiusStyle
                                                            .customBorderBL20,
                                                      ),
                                                      child: Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment.center,
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsets.symmetric(
                                                                  horizontal: 73.h,
                                                                  vertical: 20.v),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  GestureDetector(
                                                                      onTap: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: Text(
                                                                        "닫기",
                                                                      style: CustomTextStyles.titleMediumBluegray400,
                                                                      )),
                                                                  GestureDetector(
                                                                    onTap: () async{
                                                                      costBillingProvider.finishCostBilling(billing.id!).then((value) => {
                                                                        showToast(context,"처리가 완료 되었습니다."),
                                                                          WidgetsBinding.instance.addPostFrameCallback((_) async {
                                                                            Navigator.pop(context);
                                                                            mainViewModel.refreshCostBilling();
                                                                          })
                                                                      });
                                                                    },
                                                                    child: Text(
                                                                      "결재",
                                                                        style: CustomTextStyles.titleMediumBlack900_1,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.center,
                                                            child: SizedBox(
                                                              height: 60.v,
                                                              width: 352.h,
                                                              child: Stack(
                                                                alignment:
                                                                Alignment.center,
                                                                children: [
                                                                  Align(
                                                                    alignment: Alignment
                                                                        .topCenter,
                                                                    child: SizedBox(
                                                                      width: 352.h,
                                                                      child: Divider(
                                                                        color: appTheme
                                                                            .gray40001,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment
                                                                        .center,
                                                                    child: SizedBox(
                                                                      height: 60.v,
                                                                      child:
                                                                      VerticalDivider(
                                                                        width: 10.h,
                                                                        thickness: 1.v,
                                                                        color: appTheme
                                                                            .gray40001,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      });

                                }),
                                  child: Text("결재대기",style: CustomTextStyles.titleMediumwhite700)
                              ) :
                              Text("결재대기",style: CustomTextStyles.titleMediumwhite700)
                              ),
                        ),

                        if(billing.costBillingStatus == "FIN")
                          Container(
                            width: mediaQueryData.size.width * 0.19,
                            height: mediaQueryData.size.height * 0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60.0),
                              color: Colors.grey,
                            ),
                            child: Center(
                                child:
                                Text("결재완료",style: CustomTextStyles.titleMediumwhite700)
                            ),
                          ),
                        if(billing.finProcessTime != null)
                        Text(
                          billing!.finProcessTime.toString().substring(0,10),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black45,fontSize: 12
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.v,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              Text(
                                "${billing.reqProcessTime.toString().substring(0,10)}",
                                textAlign: TextAlign.start,
                                style: CustomText.body10
                              ),
                              if(billing.companyName!.length > 5)
                              Text(
                                "${billing.companyName?.substring(0,5).toString()}"+"..",
                                textAlign: TextAlign.start,
                                  style: CustomText.body10
                              ),
                              if(billing.companyName!.length < 6)
                              Text(
                                "${billing.companyName}",
                                textAlign: TextAlign.start,
                                  style: CustomText.body9
                              ),
                              SizedBox(
                                width: mediaQueryData.size.width * 0.1,
                                child: Text(
                                    "${billing.memberName}",
                                    textAlign: TextAlign.start,
                                    style: CustomText.body9
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.v,),
                        if(billing.productCategory!.length > 4)
                        SizedBox(
                          width: mediaQueryData.size.width * 0.11,
                          child: Text(
                              "${billing.productCategory?.substring(0,4).toString()}"+"..",
                            textAlign: TextAlign.start,
                              style: CustomText.body9
                          ),
                        ),
                        if(billing.productCategory!.length <= 4)
                          SizedBox(
                            width: mediaQueryData.size.width * 0.1,
                            child: Text(
                                "${billing.productCategory}",
                                textAlign: TextAlign.start,
                                style: CustomText.body9
                            ),
                          ),
                        SizedBox(
                          width: mediaQueryData.size.width * 0.3,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(2.v),
                                child: Text(
                                  "${billing.price}원",
                                  textAlign: TextAlign.start,
                                    style: CustomText.blackBody5
                                ),
                              ),
                               Padding(
                                padding: EdgeInsets.all(2.v),
                                child: Text(
                                    "${billing.brand}",
                                    textAlign: TextAlign.start,
                                    style: CustomText.blackBody5
                                ),
                              ),
                              if(billing.deadType == "긴급")
                              Container(
                                height: 30.v,
                                width: 60.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60.0),
                                  color: Colors.black54,
                                ),
                                child: Center(child: Text("${billing.deadType}",style: CustomTextStyles.bodyMediumWithe900)),
                              ),
                              if(billing.deadType == "정상")
                                Container(
                                  height: 30.v,
                                  width: 60.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60.0),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Center(child: Text("${billing.deadType}",style: CustomTextStyles.bodyMediumBlack900,)),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.v,),
                  ],
                )),
              ),
            ],
      ),
    );
  }
}

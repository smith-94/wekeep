
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:costbridge/provider/costbilling_provider.dart';
import 'package:costbridge/theme/app_decoration.dart';
import 'package:costbridge/ui/common/view/pop_up_view.dart';
import 'package:costbridge/ui/common/widgets/custom_drop_down.dart';
import 'package:costbridge/provider/company_provider.dart';
import 'package:costbridge/ui/costbilling/api/cost_billing_api.dart';
import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:costbridge/ui/main/viewmodel/main_viewmodel.dart';
import 'package:costbridge/vo/member/member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:costbridge/core/utils/image_constant.dart';
import 'package:costbridge/core/utils/size_utils.dart';
import 'package:costbridge/singleton/MemberViewModel.dart';
import 'package:costbridge/theme/custom_button_style.dart';
import 'package:costbridge/theme/custom_text_style.dart';
import 'package:costbridge/theme/theme_helper.dart';
import 'package:costbridge/ui/common/toast/toast_util.dart';
import 'package:costbridge/ui/common/widgets/custom_elevated_button.dart';
import 'package:costbridge/ui/common/widgets/custom_image_view.dart';
import 'package:costbridge/ui/common/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';


bool authOk = false;
bool passwordHide = true;
bool requestedAuth = false;
String verificationCode = '';
bool showLoading = false;

bool isDateValid = true;
bool isCompanyValid = true;
bool isPriceValid = true;

class CostBillingDetailPage extends StatefulWidget {

  late CostBilling billing;
  late Member member;
  CostBillingDetailPage({super.key, required this.billing,required this.member});

  @override
  State<CostBillingDetailPage> createState() => _CostBillingDetailPageState();
}

class _CostBillingDetailPageState extends State<CostBillingDetailPage> {
  final viewTransformationController = TransformationController();

  @override
  void initState() {
    final zoomFactor = 1.0;
    viewTransformationController.value.setEntry(0, 0, zoomFactor);
    viewTransformationController.value.setEntry(1, 1, zoomFactor);
    viewTransformationController.value.setEntry(2, 2, zoomFactor);
    super.initState();
  }

  @override
  void dispose() {
    viewTransformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final costBillingProvider = Provider.of<CostBillingProvider>(context);
    return Scaffold(
          resizeToAvoidBottomInset : true,
          body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.v,),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgArrowleft,
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            margin: EdgeInsets.only(left: 24.h, top: 39.v),
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        Padding(
                            padding: EdgeInsets.only(left: 24.h, top: 37.v),
                            child: Text("거래 명세서 상세",
                                style: CustomTextStyles
                                    .headlineMediumBlack900)),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.h),
                            child: Column(
                              children: [
                                _buildDisableInputField("날짜", isDateValid,widget.billing.reqProcessTime.toString()!.substring(0,10)!, isDate : true, isOnlyNumber: true),
                                SizedBox(height: 16.v),
                                _buildDisableInputField("업체",  isCompanyValid,widget.billing.companyName.toString()!),
                                SizedBox(height: 16.v),
                                _buildDisableInputField("금액",  isPriceValid, widget.billing.price.toString()!,isOnlyNumber: true, isPrice: true),
                                SizedBox(height: 16.v),
                                _buildDisableInputField("품목",  true,widget.billing.productCategory.toString()!),
                                SizedBox(height: 16.v),
                                _buildDisableInputField("적요",  true, widget.billing.brand.toString()!,hintText: "브랜드 / 작업지시서#"),
                                SizedBox(height: 16.v),
                                _buildDisableInputField("결제 기한", true, widget.billing.deadType.toString()!,hintText: "정상 / 긴급"),

                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20.v,),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.h, top: 5.v, right: 5.h),
                          child: Text(
                            "이미지 첨부(${widget.billing.imgUrl!.split(",").length.toString()}/3)".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(height: 15.v),
                              Row(
                                children: [
                                  SizedBox(
                                    width: mediaQueryData.size.width * 0.03,
                                    height: mediaQueryData.size.height * 0.1,
                                    child: Container(),
                                  ),
                                  for (int i = 0; i < widget.billing.imgUrl!.split(",").length; i++)
                                  Padding(
                                    padding: EdgeInsets.all(3.h),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: CustomImageView(
                                        onTap: ((){
                                          showDialog(
                                              context: context,
                                              barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                                              builder: (BuildContext context) {
                                                return Center(
                                                child: Container(
                                                  width: mediaQueryData.size.width * 0.9,
                                                  height: mediaQueryData.size.height * 0.8,
                                                  child: InteractiveViewer(
                                                  constrained: true,
                                                  transformationController: viewTransformationController,
                                                  boundaryMargin: const EdgeInsets.all(0.0),
                                                  child: CachedNetworkImage(
                                                    imageUrl: widget.billing.imgUrl!.split(",")[i],
                                                    imageBuilder: (context, imageProvider) =>
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: imageProvider, fit: BoxFit.fill),
                                                          ),
                                                        ),
                                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                        CircularProgressIndicator(value: downloadProgress.progress),
                                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                                  ),
                                                  ),
                                                ),
                                                );
                                              }
                                          );
                                        }),
                                        url: widget.billing.imgUrl!.split(",")[i],
                                        height: mediaQueryData.size.height * 0.1,
                                        width: mediaQueryData.size.width * 0.3,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                  const SizedBox(height: 30,),
                  if(widget.member.adminYn == true && widget.billing.costBillingStatus == "REQUEST")
                  CustomElevatedButton(
                    buttonStyle: CustomButtonStyles.fillBlack,
                    width: mediaQueryData.size.width * 0.4,
                    text: "결재 완료",
                    onTap: (() {
                      costBillingProvider.finishCostBilling(widget.billing.id!).then((value) => {
                        showToast(context,"처리가 완료 되었습니다."),
                        Navigator.pop(context)
                      });
                    }),),
                  if(widget.member.adminYn != true && widget.billing.costBillingStatus == "REQUEST")
                  CustomElevatedButton(
                    buttonStyle: CustomButtonStyles.fillBlack,
                    width: mediaQueryData.size.width * 0.4,
                    text: "상신 내역 삭제하기",
                    onTap: (() {
                      costBillingProvider.deleteCostBilling(widget.billing.id!).then((value) => {
                        showToast(context,"처리가 완료 되었습니다."),
                        Navigator.pop(context)
                      });
                    }),)]
                    ),
                  ),
          );
  }

  Widget _buildDisableInputField(
      String label,
      bool isValid,
      String text,
      { String? hintText,
        bool isDate = false,
        bool isOnlyNumber = false,
        bool isPrice = false,
      }) {
    return Row(
      children: [
        SizedBox(
          width: 80.h,
          child: Text(
            label,
            style: CustomTextStyles.titleMediumGray700,
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            controller: TextEditingController(text: text),
            focusNode: FocusNode(),
            hintText: hintText ?? "$label을(를) 입력해주세요",
            borderDecoration: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.h),
              borderSide: BorderSide(
                color: isValid ? Colors.black : Colors.redAccent,
                width: 1,
              ),
            ),
            textInputAction: TextInputAction.next,
            isDate : isDate,
            isOnlyNumber: isOnlyNumber,
            isPrice: isPrice,
            readOnly: true,
            // theme.textTheme.bodyLarge!,
          ),
        ),
      ],
    );
  }
}

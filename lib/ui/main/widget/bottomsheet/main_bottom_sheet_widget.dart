
import 'package:costbridge/provider/company_provider.dart';
import 'package:costbridge/provider/costbilling_provider.dart';
import 'package:costbridge/provider/member_provider.dart';
import 'package:costbridge/routes/routes.dart';
import 'package:costbridge/ui/common/toast/toast_util.dart';
import 'package:costbridge/ui/common/widgets/app_bar/appbar_image.dart';
import 'package:costbridge/ui/common/widgets/app_bar/appbar_subtitle.dart';
import 'package:costbridge/ui/common/widgets/app_bar/custom_app_bar.dart';
import 'package:costbridge/ui/common/widgets/custom_drop_down.dart';
import 'package:costbridge/ui/common/widgets/custom_image_view.dart';
import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:costbridge/ui/costbilling/page/cost_billing_new_page.dart';
import 'package:costbridge/ui/main/viewmodel/main_viewmodel.dart';
import 'package:costbridge/ui/costbilling/widget/cost_billing_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:costbridge/core/app_export.dart';
import 'package:costbridge/main.dart';
import 'package:costbridge/ui/common/view/pop_up_view.dart';
import 'package:costbridge/ui/common/widgets/custom_elevated_button.dart';
import 'package:costbridge/vo/member/member.dart';


class MainBottomSheetWidget extends StatefulWidget {
  @override
  State<MainBottomSheetWidget> createState() => _MainBottomSheetWidgetState();
}

class _MainBottomSheetWidgetState extends State<MainBottomSheetWidget> {
  late MainViewModel mainViewModel;

  @override
  Widget build(BuildContext context) {
    mainViewModel = Provider.of<MainViewModel>(context);
    CompanyProvider companyProvider = Provider.of<CompanyProvider>(context);
    Member? member = mainViewModel.getMember();
    DateTime initialDay = DateTime.now();
  return  GestureDetector(
          onTap: () {
        FocusScope.of(context).unfocus();
        },
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Theme.of(context).primaryColor,
          height: 170.v,
          title: Padding(
            padding: EdgeInsets.only(top:50.v),
            child: Row(
              children: [
                AppbarSubtitle(
                  text: "${member!.name}",
                  margin: EdgeInsets.only(left: 24.h),
                ),
                const SizedBox(width:10),
                Container(
                  width: 50.h,
                  height: 50.v,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: appTheme.whiteA700,
                  ),
                  child: Center(
                    child: IconButton(onPressed: ((){
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => CostBillingNewPage(companyList: companyProvider.getAllCompanyNames(),))).then((value) => {
                                    mainViewModel.refreshCostBilling(),
                              });
                    }),
                      icon: Icon(Icons.add,),
                      color: Colors.black,),
                  ),
                )
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                mainViewModel.getAdminYn() == true ? Padding(
                  padding: EdgeInsets.only(top:50.v),
                  child: IconButton(
                    icon: Icon(Icons.download,color: Colors.white,), onPressed: () {
                      mainViewModel.excelExport().then((value) => {
                        showToast(context,"엑셀 내보내기 요청이 완료가 되었습니다")
                      });
                  },
                  )
                ) : SizedBox(width: 0,),
                Padding(
                  padding: EdgeInsets.only(top:50.v),
                  child: AppbarImage(
                    svgPath: ImageConstant.imgGroup6351,
                    margin: EdgeInsets.symmetric(horizontal: 24.h),
                    onTap: (() {
                    }),
                  ),
                ),
              ],
            ),
          ],

        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20.v,left: 15.v,right: 15.v),
          child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color.fromRGBO(100, 100, 100, 0.1)),
                  left: BorderSide(color: Color.fromRGBO(100, 100, 100, 0.1)),
                  right: BorderSide(color: Color.fromRGBO(100, 100, 100, 0.1))
                ),
                  color: Color.fromRGBO(255, 255, 255, 0.97),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24), topLeft: Radius.circular(24))),
              //width: mediaQueryData.size.width * 0.98,
              height: 1000.v,
              width: mediaQueryData.size.width,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 70.v,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          border: Border.all(
                            color: appTheme.blueGray100,
                            width: 1.h,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap:() async{
                                final DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: mainViewModel.startDate,
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2100),
                                  locale: const Locale('ko'),
                                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: ColorScheme.dark(
                                          primary: Colors.black,
                                          onPrimary: Colors.white,
                                          surface: Colors.white,
                                          onSurface: Colors.black,
                                        ),
                                        dialogBackgroundColor:Colors.blue[900],
                                      ),
                                      child: child!,
                                    );
                                  },);
                                if (dateTime != null) {
                                  mainViewModel.settingStartDate(member.id!,dateTime);
                                }
                              },
                              child: Container(
                                width: mediaQueryData.size.width * 0.45,
                                child: Row(
                                  children: [
                                        SizedBox(width: 15,),
                                        const Icon(Icons.calendar_month),
                                        SizedBox(width: 15,),
                                        Text(mainViewModel.startDate.toString().substring(0,10),style: CustomTextStyles.bodyLargeBlueA700,)
                                      ],
                                ),
                              ),
                            ),
                            const VerticalDivider(thickness: 0.3,color: Colors.grey,),
                            InkWell(
                              onTap: () async{
                                final DateTime? dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: mainViewModel.endDate,
                                  firstDate: DateTime(2024),
                                  lastDate: DateTime(2100),
                                  locale: const Locale('ko'),
                                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: const ColorScheme.dark(
                                          primary: Colors.black,
                                          onPrimary: Colors.white,
                                          surface: Colors.white,
                                          onSurface: Colors.black,
                                        ),
                                        dialogBackgroundColor:Colors.blue[900],
                                      ),
                                      child: child!,
                                    );
                                  },);
                                if (dateTime != null) {
                                  mainViewModel.settingEndDate(member.id!,dateTime);
                                }
                              },
                              child: Container(
                                width: mediaQueryData.size.width * 0.45,
                                child: Row(
                                  children: [
                                        SizedBox(width: 15,),
                                        const Icon(Icons.calendar_month),
                                        SizedBox(width: 15,),
                                        Text(mainViewModel.endDate.toString().substring(0,10),style: CustomTextStyles.bodyLargeBlueA700,),
                                      ],
                                ),
                              ),
                            ),
                              ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            child: FormBuilderRadioGroup<String>(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              //maxChips: 3,
                              wrapSpacing : 3,
                              initialValue: "전체",
                              decoration: const InputDecoration(
                                  labelText: '결재 상태',
                              ),
                              name: 'introduce_tag',
                              activeColor: Colors.black,
                              options: const [
                                FormBuilderChipOption(
                                  value: '전체',
                                ),
                                FormBuilderChipOption(
                                  value: '결재대기',
                                ),
                                FormBuilderChipOption(
                                  value: '결재완료',
                                ),
                              ],
                              onChanged: ((value){
                                  mainViewModel.settingStatus(value??"전체");
                              }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: mediaQueryData.size.width,
                        height: mediaQueryData.size.height * 0.5,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: mainViewModel.billings.length,
                            itemBuilder: (_, index) {
                              return Row(
                                children: <Widget>[
                                  CostBillingListItem(
                                    mainViewModel.billings[index],member: member,
                                  ),
                                  //SizedBox(height: 13,)
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ],
              )
            ),
        ),
      )
  );
  }
}

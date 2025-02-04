
import 'dart:io';

import 'package:costbridge/provider/member_provider.dart';
import 'package:costbridge/theme/app_decoration.dart';
import 'package:costbridge/ui/common/view/pop_up_view.dart';
import 'package:costbridge/ui/common/widgets/custom_drop_down.dart';
import 'package:costbridge/provider/company_provider.dart';
import 'package:costbridge/ui/costbilling/api/cost_billing_api.dart';
import 'package:costbridge/ui/costbilling/dto/costbilling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
import 'package:image/image.dart' as img;

bool authOk = false;
bool passwordHide = true;
bool requestedAuth = false;
String verificationCode = '';
bool showLoading = false;

bool isDateValid = true;
bool isCompanyValid = true;
bool isPriceValid = true;

class CostBillingNewPage extends StatefulWidget {
  final List<String> companyList;

  CostBillingNewPage({required this.companyList});

  @override
  State<CostBillingNewPage> createState() => _CostBillingNewPageState();
}

class _CostBillingNewPageState extends State<CostBillingNewPage> {

  TextEditingController dateController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController productFieldController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController deadLineProcessSTimeController = TextEditingController();

  //인증번호 받기 버튼 활성화
  bool phoneAuthTryPermission = false;
  bool authInputFlag = false;
  bool authCodeBtnDisplay = false;
  bool authTryInoutFlag = false;
  bool nameFlag = false;
  List<File> _selectedFiles = [];
  File? _photo = null;
  List<String> deadType = ["정상","긴급"];
  String deadTypeString = "정상";
  final ImagePicker _picker = ImagePicker();
  bool createReqFlag = false;
  @override
  void dispose() {
    dateController.dispose();
    companyController.dispose();
    priceController.dispose();
    productFieldController.dispose();
    brandController.dispose();
    deadLineProcessSTimeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    dateController.text = DateTime.now().toIso8601String().substring(0,10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width *0.5;
    String selectCompany;
    MemberProvider memberProvider = Provider.of<MemberProvider>(context);
    int memberId = memberProvider.member!.id!;
    FocusNode dateNode = FocusNode();
    FocusNode priceNode = FocusNode();
    FocusNode productFieldNode = FocusNode();
    FocusNode brandNode = FocusNode();
    FocusNode companyNode = FocusNode();
    return Expanded(
        child: Scaffold(
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
                              child: Text("신규 거래명세서 작성",
                                  style: CustomTextStyles
                                      .headlineMediumBlack900)),
                          Padding(
                              padding: EdgeInsets.only(left: 24.h, top: 26.v),
                              child: Text("거래명세서 내용을 입력해주세요",
                                  style: CustomTextStyles.bodyLargeBlack900)),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.h),
                              child: Column(
                                children: [
                                  _buildInputField("날짜", dateController, dateNode, isDateValid, isDate : true, isOnlyNumber: true),
                                  SizedBox(height: 16.v),
                                  SizedBox(height: 16.v),
                                  DropdownMenu<String>(
                                    controller: companyController,
                                    width: width,
                                    menuHeight: 250,
                                    hintText: "업체를 선택해주세요",
                                    requestFocusOnTap: true,
                                    enableSearch: true,
                                    textStyle: CustomTextStyles.dropdownBlack,
                                    onSelected: (value) {
                                      print(value);
                                      selectCompany = value!;
                                    },
                                    dropdownMenuEntries:
                                    widget.companyList.map<DropdownMenuEntry<String>>((String companyName) {
                                      return DropdownMenuEntry<String>(
                                          value: companyName,
                                          label: companyName);
                                    }).toList(),
                                  ),
                                  SizedBox(height: 16.v),
                                  _buildInputField("금액", priceController, priceNode, isPriceValid, isOnlyNumber: true, isPrice: true),
                                  SizedBox(height: 16.v),
                                  _buildInputField("품목", productFieldController, productFieldNode, true),
                                  SizedBox(height: 16.v),
                                  _buildInputField("적요", brandController, brandNode, true, hintText: "브랜드 / 작업지시서#"),
                                  SizedBox(height: 16.v),
                                  _buildDropdownField(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.v,),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.h, top: 5.v, right: 5.h),
                            child: Text(
                              "이미지 첨부(${_selectedFiles.length.toString()}/3)".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          SizedBox(height: 15.v),
                          Row(
                            children: [
                              SizedBox(width: 30.h),
                              InkWell(
                                onTap: (() {
                                  _showPicker(context);
                                }),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 25.h,
                                    vertical: 10.v,
                                  ),
                                  decoration: _selectedFiles.length == 3
                                      ? const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)))
                                      : AppDecoration.outlinePrimary.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder10,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 3.v),
                                      //이미지 첨부
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: (() {
                                              _showPicker(context);
                                            }),
                                            child: Column(
                                              children: [
                                                CustomImageView(
                                                  color: _selectedFiles.length == 3
                                                      ? Colors.white
                                                      : null,
                                                  svgPath: ImageConstant.imgFramePrimary,
                                                  height: 28.adaptSize,
                                                  width: 28.adaptSize,
                                                ),
                                                Text(
                                                  _selectedFiles.length.toString() +
                                                      "/3".tr,
                                                  style: _selectedFiles.length == 3
                                                      ? CustomTextStyles
                                                      .titleMediumWhiteA700
                                                      : CustomTextStyles
                                                      .titleMediumPrimary_1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 6.v),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.v),
                              for (int i = 0; i < _selectedFiles.length; i++)
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: mediaQueryData.size.width * 0.2,
                                      height: mediaQueryData.size.height * 0.1,
                                      child: Container(),
                                    ),
                                    Positioned(
                                      top: 10,
                                      child: SizedBox(
                                        width: mediaQueryData.size.width * 0.17,
                                        height: mediaQueryData.size.height * 0.075,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: CustomImageView(
                                            file: _selectedFiles[i],
                                            height: mediaQueryData.size.height * 0.075,
                                            width: mediaQueryData.size.width * 0.17,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 2,
                                      child: InkWell(
                                        onTap: (() {
                                          setState(() {
                                            _selectedFiles.removeAt(i);
                                          });
                                        }),
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.grey,
                                          ),
                                          child: const Icon(
                                            Icons.close,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ]),
                    SizedBox(height: 30,),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.h, top: 5.v, right: 5.h),
                      child: CustomElevatedButton(
                        text: "결재 요청",
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.h),
                        alignment: Alignment.center,
                        onTap: ((){
                          setState(() {
                            isDateValid = dateController.text.isNotEmpty;
                            isCompanyValid = companyController.text.isNotEmpty;
                            isPriceValid = priceController.text.isNotEmpty;
                          });

                          if(!widget.companyList!.contains(companyController.text)){
                            showToast(context, '올바른 업체를 선택해주세요');
                            return;
                          }
                          if(_selectedFiles.isEmpty){
                            showToast(context, '증빙 서류 1장 이상을 첨부해주세요');
                            return;
                          }

                          if (isDateValid && isCompanyValid && isPriceValid) {
                            //popupViewWidget(context, "gd", "cancel", "ok");
                            createCostBilling(memberId);
                            createReqFlag = true;
                          } else {
                            if (!isDateValid) {
                              showToast(context, "날짜를 입력해주세요");
                            } else if (!isCompanyValid) {
                              showToast(context, "업체를 입력해주세요");
                            } else if (!isPriceValid) {
                              showToast(context, "금액을 입력해주세요");
                            }
                          }
                        }),
                      ),
                    ),
                    SizedBox(height: 30,),
                  ],
                )
            )
        ),
      );
  }

  void createCostBilling(int memberId) {
    if(createReqFlag == false){
    CostBillingApi.costBillingImageUpload(this._selectedFiles).then((imgUrl) => {
      CostBillingApi.uploadCostBillings(
          costBilling: CostBilling.create(
            memberId,
            productFieldController.text,
            brandController.text,
            priceController.text,
            imgUrl,
            companyController.text,
            deadTypeString,
            dateController.text
          )
        ).then((value) => {
          showToast(context, '결재 요청을 완료했습니다'),
          Navigator.pop(context)
      })
    });
    }
  }
  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    File file = File(pickedFile!.path);
    img.Image image = img.decodeImage(file.readAsBytesSync())!;
    img.Image resizedImage = img.copyResize(image, width: 1024, height: 1024);
    List<int> compressedBytes = img.encodeJpg(resizedImage, quality: 30);
    File compressedFile = File(file.path.replaceFirst('.jpg', '_compressed.jpg'));
    compressedFile.writeAsBytesSync(compressedBytes);
    setState(() {
      if (pickedFile != null) {
        _photo = compressedFile;
        //uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromGallery() async {
    try {
      final List<XFile>? selectedImages = await _picker.pickMultiImage(maxWidth: 1024, maxHeight: 1024, imageQuality: 30);
      setState(() {
        if (selectedImages!.isNotEmpty) {
          for (int i = 0; i < selectedImages.length; i++) {
            if (_selectedFiles.length < 4) {
              File file = File(selectedImages![i].path);
              img.Image image = img.decodeImage(file.readAsBytesSync())!;
              img.Image resizedImage = img.copyResize(image, width: 1024, height: 1024);
              List<int> compressedBytes = img.encodeJpg(resizedImage, quality: 30);
              File compressedFile = File(file.path.replaceFirst('.jpg', '_compressed.jpg'));
              compressedFile.writeAsBytesSync(compressedBytes);
              _selectedFiles.add(compressedFile);
            }
            if (_selectedFiles.length == 4 || _selectedFiles.length > 3) {
              showToast(context, "이미지는 최대 3장까지 첨부가 가능합니다.");
              continue;
            }
          }
        } else {
          print('no image select');
        }
      });
    } catch (e) {
      print(e);
    }

    print("Image List length: ${_selectedFiles.length.toString()}");
    //TODO 하단 위젯에 추가하고, setState
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      title: Center(child: Text('카메라')),
                      onTap: () {
                        imgFromCamera();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    title: Center(child: Text('사진 앨범')),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                    title: Center(child: Text('취소')),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  void onTapImgArrowleftone(BuildContext context) {
    setState(() {
      isDateValid = true;
      isCompanyValid = true;
      isPriceValid = true;
    });
    Navigator.pop(context);
  }

  Widget _buildInputField(
      String label,
      TextEditingController controller,
      FocusNode focusNode,
      bool isValid,
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
            controller: controller,
            focusNode: focusNode,
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
            // theme.textTheme.bodyLarge!,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField() {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
                flex: 1,
                child: Text(
                  "결재 기한",
                  style: CustomTextStyles.titleMediumGray700,
                ),
              ),
          Flexible(
              flex: 4,
              child: FormBuilderRadioGroup<String>(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              //maxChips: 3,
              wrapSpacing : 4,
              initialValue: "정상",
              name: 'introduce_tag',
              activeColor: Colors.black,
              options: const [
                FormBuilderChipOption(
                  value: '정상',
                ),
                FormBuilderChipOption(
                  value: '긴급',
                ),
              ],
              onChanged: ((value){
                deadTypeString = value!;
              }),
              ),
              ),
            ],
      );
  }
}

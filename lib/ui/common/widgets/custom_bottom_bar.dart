import 'package:flutter/material.dart';
import 'package:wekeep/constant/bottom_menu.dart';
import 'package:wekeep/core/app_export.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wekeep/routes/routes.dart';
import 'package:wekeep/ui/common/widgets/custom_image_view.dart';


class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged, this.activeMenu});

  Function(BottomBarEnum)? onChanged;
  int? activeMenu;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  void handleTab(int index) async {
    final SharedPreferences globalStore = await SharedPreferences.getInstance();
    String name = globalStore.getString('name') ?? '';
  }

    List<BottomMenuModel> bottomMenuList = [
      BottomMenuModel(
        icon: ImageConstant.imgNavGray900,
        activeIcon: ImageConstant.imgNavGray900,
        title: "홈",
        type: BottomBarEnum.main,
      ),
      BottomMenuModel(
        icon: ImageConstant.imgNav,
        activeIcon: ImageConstant.imgNav,
        title: "예약",
        type: BottomBarEnum.reservation,
      ),
      BottomMenuModel(
        icon: ImageConstant.imgNavGray400,
        activeIcon: ImageConstant.imgNavGray400,
        title: "내 기록",
        type: BottomBarEnum.post,
      ),
      BottomMenuModel(
        icon: ImageConstant.imgNavGray40032x32,
        activeIcon: ImageConstant.imgNavGray40032x32,
        title: "채팅",
        type: BottomBarEnum.chat,
      ),
      BottomMenuModel(
        icon: ImageConstant.imgNav32x32,
        activeIcon: ImageConstant.imgNav32x32,
        title: "마이페이지",
        type: BottomBarEnum.my,
      )
    ];

    @override
    void initState() {
      if (widget.activeMenu != null) {
        print('active menu::: ' + widget.activeMenu.toString());

        setState(() {
          selectedIndex = widget.activeMenu!;
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: mediaQueryData.size.width,
            child: Divider(),
          ),
          Container(
            height: 90.v,
            decoration: BoxDecoration(
              color: appTheme.whiteA700,
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0,
              elevation: 0,
              currentIndex: selectedIndex,
              type: BottomNavigationBarType.fixed,
              items: List.generate(bottomMenuList.length, (index) {
                return BottomNavigationBarItem(
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        svgPath: bottomMenuList[index].icon,
                        height: 32.adaptSize,
                        width: 32.adaptSize,
                        color: appTheme.gray400,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.v),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          style: CustomTextStyles.labelLargeOnError.copyWith(
                            color: theme.colorScheme.onError,
                          ),
                        ),
                      ),
                    ],
                  ),
                  activeIcon: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        svgPath: bottomMenuList[index].activeIcon,
                        height: 32.adaptSize,
                        width: 32.adaptSize,
                        color: appTheme.gray900,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7.v),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          style: CustomTextStyles.labelLargeOnPrimary.copyWith(
                            color: theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: '',
                );
              }),
              onTap: (index) {
                widget.onChanged?.call(bottomMenuList[index].type);
                handleTab(index);
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ],
      );
    }
}


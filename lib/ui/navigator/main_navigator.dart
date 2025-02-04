import 'package:wekeep/ui/common/widgets/app_bar/custom_app_bar.dart';
import 'package:wekeep/ui/common/widgets/custom_image_view.dart';
import 'package:wekeep/ui/home/view/home_view.dart';
import 'package:wekeep/ui/home/view/home_view.dart';
import 'package:wekeep/ui/log/view/log_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wekeep/core/app_export.dart';

class MainNavigatorScreen extends StatefulWidget {
  @override
  State<MainNavigatorScreen> createState() => _MainNavigatorScreenState();
}

class _MainNavigatorScreenState extends State<MainNavigatorScreen> {
  PageController _pageController = PageController(initialPage: 1);
  int _selectedIndex = 0;
  int _page = 0;
  int? activeMenu;
  PageController get pageController => _pageController;
  int get selectedIndex => _selectedIndex;
  int get page => _page;

  @override
  Widget build(BuildContext context) {

    List<BottomMenuModel> bottomMenuList = [
      BottomMenuModel(
        imagePath: ImageConstant.nav_log_icon,
        activeImagePath: ImageConstant.nav_log_icon,
        type: BottomBarEnum.tf,
      ),
      BottomMenuModel(
        imagePath: ImageConstant.nav_home_icon,
        activeImagePath: ImageConstant.nav_home_icon,
        type: BottomBarEnum.tf,
      ),
      BottomMenuModel(
        imagePath: ImageConstant.nav_profile_icon2,
        activeImagePath: ImageConstant.nav_profile_icon2,
        type: BottomBarEnum.tf,
      )
    ];
    return Scaffold(
          appBar: CustomAppBar(
            backgroundColor: Color(0xFF233B6E),
            height: 99.v,
            title: Padding(
              padding: EdgeInsets.only(bottom: 20.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    fit: BoxFit.contain,
                    imagePath: ImageConstant.logo,
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: MediaQuery.of(context).size.height * 0.1,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: onPageChanged,
            children: <Widget>[
              LogView(),
              HomeView(),
              HomeView(),
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
          canvasColor: Colors.black,
          primaryColor: Colors.white60,
          textTheme: Theme.of(context).textTheme.copyWith(
            bodySmall: TextStyle(color: Colors.grey[500]),
          ),
          ),
          child: Container(
            height: 160.v,
            decoration: BoxDecoration(
                color: Color(0xFF6F6F6),
                border: Border(top: BorderSide(color: Color.fromRGBO(100, 100, 100, 0.1), width: 1.0))),
            child: BottomNavigationBar(
              backgroundColor: Color(0xFFF6F6F6),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              items: List.generate(bottomMenuList.length, (index) {
                return BottomNavigationBarItem(
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(imagePath: bottomMenuList[index].imagePath,width: 40.h),
                      Padding(
                        padding: EdgeInsets.only(top: 8.v),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          style: CustomTextStyles.labelLargeOnError.copyWith(
                            color: Colors.black,
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
                        imagePath: bottomMenuList[index].imagePath,
                        width: 40.h,),
                      Padding(
                        padding: EdgeInsets.only(top: 7.v),
                        child: Text(
                          bottomMenuList[index].title ?? "",
                          style: CustomTextStyles.labelLargeOnPrimary.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  label: '',
                );
              }),
              onTap: ((int page){
                navigationTapped(page);
              }),
              currentIndex: page,
            ),
          ),
        ),
          resizeToAvoidBottomInset: false,
        );
  }

void navigationTapped(int page) {
  setState(() {
    pageController.jumpToPage(page);
  });
}

void onPageChanged(int page) {
  setState(() {
    _page = page;
  });
}
}
enum BottomBarEnum { home, reservation, myrecord, mypage, chat, tf }

class BottomMenuModel {
  BottomMenuModel({
    required this.imagePath,
    required this.activeImagePath,
    this.title,
    required this.type,
  });

  String imagePath;
  String activeImagePath;

  String? title;

  BottomBarEnum type;
}

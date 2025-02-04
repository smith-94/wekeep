import 'dart:convert';
import 'dart:io';

import 'package:costbridge/ui/main/view/main_view.dart';
import 'package:costbridge/ui/mypage/view/mypage_view.dart';
import 'package:costbridge/ui/main/widget/main_widget.dart';
import 'package:costbridge/ui/main/viewmodel/main_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:costbridge/core/app_export.dart';

class MainNavigatorScreen extends StatefulWidget {
  @override
  State<MainNavigatorScreen> createState() => _MainNavigatorScreenState();
}

class _MainNavigatorScreenState extends State<MainNavigatorScreen> {
  //const MainNavigatorScreen({super.key});
  PageController _pageController = PageController(initialPage: 0);

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
        icon: Icons.home,
        activeIcon: Icons.home,
        title: "홈",
        type: BottomBarEnum.tf,
      ),
      BottomMenuModel(
        icon: Icons.person,
        activeIcon: Icons.person,
        title: "마이페이지",
        type: BottomBarEnum.tf,
      )
    ];


    return Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: onPageChanged,
            children: <Widget>[
              MainView(),
              const MyPageView(),
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
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color.fromRGBO(100, 100, 100, 0.1), width: 1.0))),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
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
                      Icon(bottomMenuList[index].activeIcon),
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
                      Icon(bottomMenuList[index].activeIcon,color: Colors.black,),
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
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  IconData icon;

  IconData activeIcon;

  String? title;

  BottomBarEnum type;
}

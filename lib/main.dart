import 'dart:convert';
import 'dart:io';

import 'package:costbridge/provider/costbilling_provider.dart';
import 'package:costbridge/provider/member_provider.dart';
import 'package:costbridge/provider/company_provider.dart';
import 'package:costbridge/singleton/MemberViewModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:costbridge/localstorage/local_storage.dart';
import 'package:costbridge/routes/routes.dart';
import 'package:costbridge/user/user_info.dart';
import 'package:costbridge/vo/member/member.dart';
import 'core/app_export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Member? member;
  MemberProvider memberProvider = MemberProvider();
  Map<String,dynamic> memberMap;
  //초기 회원 프로바이더 호출
  LocalStorage.init().then((value) => {
    if(LocalStorage.getUser() != '' && LocalStorage.getUser() != null){
      memberMap = json.decode(LocalStorage.getUser()),
      member = Member.fromJson(memberMap),
      memberProvider.updateMember(member!),
      MemberStore.instance.id = member?.id,
      MemberStore.instance.companyId = member?.companyId,
      MemberStore.instance.adminYn = member?.adminYn,
      MemberStore.instance.userId = member?.userId,
      MemberStore.instance.userPw = member?.userPw,
      MemberStore.instance.imgUrl = member?.imgUrl,
      MemberStore.instance.nickname = member?.nickname,
      MemberStore.instance.name = member?.name,
      MemberStore.instance.gender = member?.gender,
      MemberStore.instance.birth = member?.birth,
      MemberStore.instance.phone = member?.phone,
      MemberStore.instance.address = member?.address,
      MemberStore.instance.email = member?.email,
      MemberStore.instance.authCode = member?.authCode,
      MemberStore.instance.status = member?.status
    },
  });

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ThemeHelper().changeTheme('primary');
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => memberProvider),
        ChangeNotifierProvider(create: (_) => CompanyProvider()),
        ChangeNotifierProvider(create: (_) => CostBillingProvider()),
      ],
    child: MyApp(),
    ));
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko','KR'),
      ],
      theme: theme,
      title: 'costbridge',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigatorService.navigatorKey,
      routes: Routes.routes,
      initialRoute: Routes.splash_screen,
      builder: FToastBuilder(),
    );
  }
}

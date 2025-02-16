import 'package:wekeep/ui/log/view/log_view.dart';
import 'package:wekeep/ui/login/login_screen.dart';
import 'package:wekeep/ui/map/map_screen.dart';
import 'package:wekeep/ui/navigator/main_navigator.dart';
import 'package:flutter/material.dart';
import 'package:wekeep/ui/splash/splash_screen.dart';
import 'package:wekeep/ui/todo/todo_list.dart';


class Routes {

  static const String splash_screen = '/splash';
  static const String login = '/login';
  static const String register_auth_screen = '/register-auth';
  static const String register_profile_screen = '/register-profile';
  static const String find_id_screen = '/find_id';
  static const String find_id_result_screen = '/find_id_result';
  static const String find_pw_screen = '/find_password';
  static const String find_pw_result_screen = '/find_password_result';
  static const String main = '/main';
  static const String mypage_edit = '/mypage_edit';
  static const String notice_list = '/notice_list';
  static const String point_list = '/point_list';
  static const String change_pw = '/change_pw';
  static const String setting = '/setting';
  static const String log = '/log';



  static Map<String, WidgetBuilder> routes = {
    splash_screen: (context) => Splash(),
    main: (context) => TodoScreen(),
    login: (context) => LoginScreen(),
  };
}

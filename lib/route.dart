import 'package:flutter/material.dart';
import 'package:projet_iai/log/theme_bloc.dart';
import 'package:projet_iai/loginpage.dart';
import 'package:projet_iai/homepage.dart';
import 'package:projet_iai/main.dart';

class Routes {
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => Loginpage(
          themeBloc: (ThemeBloc()),
        ),
    home: (BuildContext context) => Homepage(),
  };
}

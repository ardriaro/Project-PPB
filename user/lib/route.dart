import 'package:flutter/material.dart';
import 'package:ppbfinal/ui/learning_app.dart';
import 'package:ppbfinal/ui/level1/level1_indonesia.dart';
import 'package:ppbfinal/ui/level1/level1_inggris.dart';
import 'package:ppbfinal/ui/level1/level1_matematika.dart';
import 'package:ppbfinal/ui/level2/level2_indonesia.dart';
import 'package:ppbfinal/ui/level2/level2_inggris.dart';
import 'package:ppbfinal/ui/level2/level2_matematika.dart';
import 'package:ppbfinal/ui/login.dart';
import 'package:ppbfinal/ui/register.dart';
import 'package:ppbfinal/ui/splash.dart';
import 'package:ppbfinal/ui/profile/profile_page.dart';
import 'package:ppbfinal/ui/profile/update_profile_page.dart';
import 'package:ppbfinal/ui/level1/quest_indo/quiz_screenlv1 Q1.dart';
import 'package:ppbfinal/ui/level1/quest_mtk/quiz_screenlv1 Q1.dart';
import 'package:ppbfinal/ui/level1/quest_engl/quiz_screenlv1 Q1.dart';
import 'package:ppbfinal/ui/level2/quest_indo/quiz_screenlv2 Q1.dart';
import 'package:ppbfinal/ui/level2/quest_mtk/quiz_screenlv2 Q1.dart';
import 'package:ppbfinal/ui/level2/quest_engl/quiz_screenlv2 Q1.dart';

MaterialPageRoute _pageRoute(
        {required Widget body, required RouteSettings settings}) =>
    MaterialPageRoute(builder: (_) => body, settings: settings);

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case rSplash:
      return _pageRoute(body: SplashScreen(), settings: settings);
    case rLogin:
      return _pageRoute(body: LoginScreen(), settings: settings);
    case rRegister:
      return _pageRoute(body: RegisterScreen(), settings: settings);
    case rHome:
      return _pageRoute(body: LearningApp(), settings: settings);
    case LevelScreen_indonesia1.routeName:
      return _pageRoute(body: LevelScreen_indonesia1(), settings: settings);
    case LevelScreen_inggris1.routeName:
      return _pageRoute(body: LevelScreen_inggris1(), settings: settings);
    case LevelScreen_matematika1.routeName:
      return _pageRoute(body: LevelScreen_matematika1(), settings: settings);
    case LevelScreen_indonesia2.routeName:
      return _pageRoute(body: LevelScreen_indonesia2(), settings: settings);
    case LevelScreen_inggris2.routeName:
      return _pageRoute(body: LevelScreen_inggris2(), settings: settings);
    case LevelScreen_matematika2.routeName:
      return _pageRoute(body: LevelScreen_matematika2(), settings: settings);
    case ProfilePage.routeName:
      return _pageRoute(body: ProfilePage(), settings: settings);
    case UpdateProfilePage.routeName:
      return _pageRoute(
          body: UpdateProfilePage(
              nameController: TextEditingController(),
              dobController: TextEditingController(),
              emailController: TextEditingController(),
              phoneController: TextEditingController()),
          settings: settings);
    case QuestionPageIndonesian1.routeName:
      return _pageRoute(body: QuestionPageIndonesian1(), settings: settings);
    case QuestionPageMatematika1.routeName:
      return _pageRoute(body: QuestionPageMatematika1(), settings: settings);
    case QuestionPageInggris1.routeName:
      return _pageRoute(body: QuestionPageInggris1(), settings: settings);
    case QuestionPageIndonesian11.routeName:
      return _pageRoute(body: QuestionPageIndonesian11(), settings: settings);
    case QuestionPageMatematika11.routeName:
      return _pageRoute(body: QuestionPageMatematika11(), settings: settings);
    case QuestionPageInggris11.routeName:
      return _pageRoute(body: QuestionPageInggris11(), settings: settings);
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

final NAV_KEY = GlobalKey<NavigatorState>();
const String rSplash = '/';
const String rLogin = '/login';
const String rRegister = '/register';
const String rHome = '/learning_app';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    rSplash: (context) => SplashScreen(),
    rLogin: (context) => LoginScreen(),
    rRegister: (context) => RegisterScreen(),
    rHome: (context) => LearningApp(),
  };
}

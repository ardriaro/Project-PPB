import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:appfirebase/ui/home/learning_app.dart';
import 'package:appfirebase/ui/level1/level1_bindo.dart';
import 'package:appfirebase/ui/level1/level1_ingg.dart';
import 'package:appfirebase/ui/level1/level1_mtk.dart';
import 'package:appfirebase/ui/level2/level2_bindo.dart';
import 'package:appfirebase/ui/level2/level2_ingg.dart';
import 'package:appfirebase/ui/level2/level2_mtk.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    //level
    '/level1_indonesia': (context) => Level1_bindo(),
    '/level1_english':(context) => Level1_ingg(),
    '/level1_math':(context) => Level1_mtk(),
    '/level2_indonesia':(context) => Level_bindo(),
    '/level2_english':(context) => Level2Ingg(),
    '/level2_math':(context) => Level2_mtk(),
    //button menu
    '/home' :(context) => LearningApp(),

  };
}


import 'package:flutter/material.dart';
import 'package:ppbfinal/ui/level1/level1_indonesia.dart';
import 'package:ppbfinal/ui/level1/level1_inggris.dart';
import 'package:ppbfinal/ui/level1/level1_matematika.dart';
import 'package:ppbfinal/ui/level2/level2_indonesia.dart';
import 'package:ppbfinal/ui/level2/level2_inggris.dart';
import 'package:ppbfinal/ui/level2/level2_matematika.dart';
import 'package:ppbfinal/ui/profile/profile_page.dart';
import 'package:ppbfinal/ui/profile/update_profile_page.dart';
// Quiz Indonesian Level 1
import 'package:ppbfinal/ui/level1/quest_indo/quiz_screenlv1 Q1.dart';
// Quiz Mathematics Level 1
import 'package:ppbfinal/ui/level1/quest_mtk/quiz_screenlv1 Q1.dart';
// Quiz English Level 1
import 'package:ppbfinal/ui/level1/quest_engl/quiz_screenlv1 Q1.dart';
// Quiz Indonesian Level 2
import 'package:ppbfinal/ui/level2/quest_indo/quiz_screenlv2 Q1.dart';
// Quiz Mathematics Level 2
import 'package:ppbfinal/ui/level2/quest_mtk/quiz_screenlv2 Q1.dart';
// Quiz English Level 2
import 'package:ppbfinal/ui/level2/quest_engl/quiz_screenlv2 Q1.dart';

class LearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LevelScreen_indonesia1.routeName: (context) => LevelScreen_indonesia1(),
        LevelScreen_inggris1.routeName: (context) => LevelScreen_inggris1(),
        LevelScreen_matematika1.routeName: (context) =>
            LevelScreen_matematika1(),
        LevelScreen_indonesia2.routeName: (context) => LevelScreen_indonesia2(),
        LevelScreen_inggris2.routeName: (context) => LevelScreen_inggris2(),
        LevelScreen_matematika2.routeName: (context) =>
            LevelScreen_matematika2(),
        ProfilePage.routeName: (context) => ProfilePage(),
        UpdateProfilePage.routeName: (context) => UpdateProfilePage(
              nameController: TextEditingController(),
              dobController: TextEditingController(),
              emailController: TextEditingController(),
              phoneController: TextEditingController(),
            ),
        QuestionPageIndonesian1.routeName: (context) =>
            QuestionPageIndonesian1(),
        QuestionPageMatematika1.routeName: (context) =>
            QuestionPageMatematika1(),
        QuestionPageInggris1.routeName: (context) => QuestionPageInggris1(),
        QuestionPageIndonesian11.routeName: (context) =>
            QuestionPageIndonesian11(),
        QuestionPageMatematika11.routeName: (context) =>
            QuestionPageMatematika11(),
        QuestionPageInggris11.routeName: (context) => QuestionPageInggris11(),
      },
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF9F7FFF), Color(0xFF8055FE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          SubjectCard(
                            imagePath: 'assets/indonesia.png',
                            subjectName: 'Bahasa Indonesia',
                            onLevelPressed: (level) {
                              if (level == 1) {
                                Navigator.of(context).pushNamed(
                                    LevelScreen_indonesia1.routeName);
                              } else if (level == 2) {
                                Navigator.of(context).pushNamed(
                                    LevelScreen_indonesia2.routeName);
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    appBar: AppBar(
                                      title: Text('Coming Soon'),
                                    ),
                                    body: Center(
                                      child: Text('This level is coming soon!'),
                                    ),
                                  ),
                                ));
                              }
                            },
                          ),
                          SubjectCard(
                            imagePath: 'assets/mathematics.png',
                            subjectName: 'Matematika',
                            onLevelPressed: (level) {
                              if (level == 1) {
                                Navigator.of(context).pushNamed(
                                    LevelScreen_matematika1.routeName);
                              } else if (level == 2) {
                                Navigator.of(context).pushNamed(
                                    LevelScreen_matematika2.routeName);
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    appBar: AppBar(
                                      title: Text('Coming Soon'),
                                    ),
                                    body: Center(
                                      child: Text('This level is coming soon!'),
                                    ),
                                  ),
                                ));
                              }
                            },
                          ),
                          SubjectCard(
                            imagePath: 'assets/english.png',
                            subjectName: 'Bahasa Inggris',
                            onLevelPressed: (level) {
                              if (level == 1) {
                                Navigator.of(context)
                                    .pushNamed(LevelScreen_inggris1.routeName);
                              } else if (level == 2) {
                                Navigator.of(context)
                                    .pushNamed(LevelScreen_inggris2.routeName);
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    appBar: AppBar(
                                      title: Text('Coming Soon'),
                                    ),
                                    body: Center(
                                      child: Text('This level is coming soon!'),
                                    ),
                                  ),
                                ));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF9F7FFF), Color(0xFF8055FE)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon:
                              Icon(Icons.home, color: Colors.orange, size: 30),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/learning_app',
                                (Route<dynamic> route) => false);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.person,
                              color: Colors.orange, size: 30),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                ProfilePage.routeName,
                                (Route<dynamic> route) => false);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String imagePath;
  final String subjectName;
  final Function(int) onLevelPressed;

  SubjectCard(
      {required this.imagePath,
      required this.subjectName,
      required this.onLevelPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  subjectName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double buttonWidth = (constraints.maxWidth - 20) / 3;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LevelButton(
                            level: 1,
                            width: buttonWidth,
                            onPressed: onLevelPressed),
                        LevelButton(
                            level: 2,
                            width: buttonWidth,
                            onPressed: onLevelPressed),
                        LevelButton(
                            level: 3,
                            width: buttonWidth,
                            onPressed: onLevelPressed),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final int level;
  final double width;
  final Function(int) onPressed;

  LevelButton(
      {required this.level, required this.width, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: () => onPressed(level),
        child: Text(
          'Level $level',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }
}

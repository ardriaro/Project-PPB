import 'package:flutter/material.dart';
import 'route.dart'; // Import the routes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LearningApp(),
      routes: Routes.routes, // Use the routes defined in routes.dart
    );
  }
}

class LearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              Navigator.of(context).pushNamed('/level1_indonesia');
                            } 
                            else if (level == 2) {
                              Navigator.of(context).pushNamed('/level2_indonesia');
                            }
                            else {
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
                              Navigator.of(context).pushNamed('/level1_math');
                            }
                            else if (level == 2) {
                              Navigator.of(context).pushNamed('/level2_math');
                            } 
                            else {
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
                              Navigator.of(context).pushNamed('/level1_english');
                            }
                            else if (level == 2) {
                              Navigator.of(context).pushNamed('/level2_english');
                            } 
                            else {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.orange, size: 30),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
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
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String imagePath;
  final String subjectName;
  final Function(int) onLevelPressed;

  SubjectCard({required this.imagePath, required this.subjectName, required this.onLevelPressed});

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
                        LevelButton(level: 1, width: buttonWidth, onPressed: onLevelPressed),
                        LevelButton(level: 2, width: buttonWidth, onPressed: onLevelPressed),
                        LevelButton(level: 3, width: buttonWidth, onPressed: onLevelPressed),
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

  LevelButton({required this.level, required this.width, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: () => onPressed(level),
        child: Text(
          'Level $level',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple, // Use backgroundColor instead of primary
        ),
      ),
    );
  }
}
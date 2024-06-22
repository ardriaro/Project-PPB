import 'package:flutter/material.dart';
import 'ques2_bindo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LevelScreen_indonesia2 extends StatefulWidget {
  static const String routeName = '/level2_indonesia';

  @override
  _LevelScreen_indonesia2State createState() => _LevelScreen_indonesia2State();
}

class _LevelScreen_indonesia2State extends State<LevelScreen_indonesia2> {
  List<int> levels = List.generate(1, (index) => index + 1);

  void navigateToDetailPage(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  void navigateToLevelPage(BuildContext context, int level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Ques2Bindo(level: level),
      ),
    ).then((shouldUpdate) {
      if (shouldUpdate == true) {
        _fetchLevelsFromFirestore();
      }
    });
  }

  Future<void> _fetchLevelsFromFirestore() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('questions2')
        .orderBy('question_text')
        .get();
    setState(() {
      levels = List.generate(querySnapshot.docs.length, (index) => index + 1);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchLevelsFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9F7FFF), // Color stop 0%
              Color(0xFF8055FE), // Color stop 100%
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text(
                      'Bahasa Indonesia',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    ...levels.map((level) => LevelButton(
                          level: level,
                          onTap: () => navigateToLevelPage(context, level),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.orange, size: 30),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', (Route<dynamic> route) => false);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.person, color: Colors.orange, size: 30),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/profile', (Route<dynamic> route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final int level;
  final VoidCallback? onTap;

  LevelButton({required this.level, this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isLocked = level > 7;
    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isLocked ? Colors.grey : Colors.orange,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: isLocked
              ? Icon(Icons.lock, color: Colors.white)
              : Text(
                  level.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'ques2_mtk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Level2Mtk extends StatefulWidget {
  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<Level2Mtk> {
  List<int> levels = List.generate(1, (index) => index + 1);

  void navigateToLevelPage(BuildContext context, int level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Quest2mtk(level: level),
      ),
    ).then((shouldUpdate) {
      if (shouldUpdate == true) {
        _fetchLevelsFromFirestore();
      }
    });
  }

  Future<void> _fetchLevelsFromFirestore() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('questions2_mtk')
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
                      'Matematika Level 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    ...levels.map((level) => LevelButton(
                      level: level,
                      onPressed: () => navigateToLevelPage(context, level),
                    )),
                  ],
                ),
              ),
              SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.orange,
                child: Icon(Icons.home, color: Colors.white),
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
  final VoidCallback onPressed;

  LevelButton({required this.level, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          level.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

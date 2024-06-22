import 'package:flutter/material.dart';
import 'ques1_bindo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Level1_bindo extends StatefulWidget {
  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<Level1_bindo> {
  List<int> levels = List.generate(1, (index) => index + 1);

  void navigateToLevelPage(BuildContext context, int level) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Ques1Bindo(level: level),
      ),
    ).then((shouldUpdate) {
      if (shouldUpdate == true) {
        _fetchLevelsFromFirestore();
      }
    });
  }

  void addNewLevel() async {
    final bool? shouldAdd = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Ques1Bindo(level: levels.length + 1)),
    );

    if (shouldAdd == true) {
      setState(() {
        levels.add(levels.length + 1);
      });
    }
  }

  Future<void> _fetchLevelsFromFirestore() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('questions')
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
                      'Bahasa Indonesia Level 1',
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
                    AddButton(
                      onPressed: addNewLevel,
                    ),
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
        backgroundColor: Colors.grey,
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

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;

  AddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.white, width: 2),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

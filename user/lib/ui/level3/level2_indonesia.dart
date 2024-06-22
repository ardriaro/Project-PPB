import 'package:flutter/material.dart';

class LevelScreen extends StatelessWidget {
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
                  children: List.generate(12, (index) {
                    return LevelButton(level: index + 1);
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(Icons.home, color: Colors.orange, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.star, color: Colors.orange, size: 30),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.person, color: Colors.orange, size: 30),
                      onPressed: () {},
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
  LevelButton({required this.level});

  @override
  Widget build(BuildContext context) {
    bool isLocked = level > 7;
    return Container(
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
    );
  }
}

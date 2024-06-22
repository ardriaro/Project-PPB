import 'package:flutter/material.dart';

class QuestionPageInggris1 extends StatefulWidget {
  static const routeName = '/quest1_inggris';

  @override
  _QuestionPageInggris1State createState() => _QuestionPageInggris1State();
}

class _QuestionPageInggris1State extends State<QuestionPageInggris1> {
  int selectedOption = -1;

  void selectOption(int index) {
    setState(() {
      selectedOption = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Pertanyaan 1',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF9F7FFF), Color(0xFF8055FE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Apakah Nama Benda Ini?',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  height: 60), // Increased space between question and answers
              buildAnswerButton('Buku', 0),
              buildAnswerButton('Pensil', 1),
              buildAnswerButton('Penghapus', 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnswerButton(String text, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => selectOption(index),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              selectedOption == index ? Color(0xFFFF9051) : Colors.white,
          foregroundColor:
              selectedOption == index ? Colors.white : Colors.black,
          minimumSize:
              Size(double.infinity, 50), // Ensures button is full width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: selectedOption == index
                  ? Colors.transparent
                  : Color(0xFFFF9051),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedOption == index ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

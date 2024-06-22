import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ques1Ingg extends StatefulWidget {
  final int level;
  Ques1Ingg({required this.level});

  @override
  _Ques1BindoState createState() => _Ques1BindoState();
}

class _Ques1BindoState extends State<Ques1Ingg> {
  final TextEditingController _textController = TextEditingController();
  final List<TextEditingController> _fieldControllers = List.generate(
    3,
    (_) => TextEditingController(),
  );
  String? _docId; // Variabel untuk menyimpan ID dokumen yang ditambahkan
  List<bool> _isPressed = [false, false, false];

  @override
  void initState() {
    super.initState();
    _fetchDataFromFirestore();
  }

  Future<void> _fetchDataFromFirestore() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('questions_ingg')
          .orderBy('question_text')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs[widget.level - 1];
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

        setState(() {
          _textController.text = data['question_text'] ?? 'No data available for this level.';
          List<dynamic> answers = data['answers'] ?? [];
          for (int i = 0; i < answers.length; i++) {
            _fieldControllers[i].text = answers[i]['text'] ?? '';
          }
          _docId = documentSnapshot.id;
        });
      } else {
        setState(() {
          _textController.text = 'No data available for this level.';
        });
      }
    } catch (e) {
      setState(() {
        _textController.text = '';
      });
    }
  }

  void _onTapDown(int index) {
    setState(() {
      _isPressed[index] = true;
    });
  }

  void _onTapUp(int index) {
    setState(() {
      _isPressed[index] = false;
    });
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
                      'Pertanyaan ${widget.level}',
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
              SizedBox(height: 20),
              SizedBox(height: 60),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          readOnly: true,
                          controller: _textController,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Column(
                        children: _fieldControllers.asMap().entries.map((entry) {
                          int index = entry.key;
                          TextEditingController controller = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: GestureDetector(
                              onTapDown: (_) => _onTapDown(index),
                              onTapUp: (_) => _onTapUp(index),
                              onTapCancel: () => _onTapUp(index),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: _isPressed[index] ? Colors.orange : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.text,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
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

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

  @override
  void initState() {
    super.initState();
    _fetchDataFromFirestore();
  }

  void _saveText() async {
    if (_textController.text.isEmpty ||
        _fieldControllers.any((controller) => controller.text.isEmpty)) {
      return; 
    }

    if (_docId == null) {
      DocumentReference docRef = await FirebaseFirestore.instance.collection('questions_ingg').add({
        'question_text': _textController.text,
        'answers': _fieldControllers.map((controller) => {
          'text': controller.text,
        }).toList(),
      });

      setState(() {
        _docId = docRef.id;
      });
    } else {
      await FirebaseFirestore.instance.collection('questions_ingg').doc(_docId).update({
        'question_text': _textController.text,
        'answers': _fieldControllers.map((controller) => {
          'text': controller.text,
        }).toList(),
      });
    }

    Navigator.pop(context, true);
  }

  void _deleteData() async {
    if (_docId != null) {
      await FirebaseFirestore.instance.collection('questions_ingg').doc(_docId).delete().then((value) {
        Navigator.pop(context, true); // Kembali ke LevelScreen setelah menghapus
      });
    }
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

  bool _isAnyFieldEmpty() {
    return _textController.text.isEmpty ||
           _fieldControllers.any((controller) => controller.text.isEmpty);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _isAnyFieldEmpty() ? null : _saveText,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _isAnyFieldEmpty() ? null : _deleteData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    ),
                    child: Text(
                      'Buang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
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
                          controller: _textController,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                          onChanged: (text) => setState(() {}),
                        ),
                      ),
                      SizedBox(height: 60),
                      Column(
                        children: _fieldControllers.map((controller) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white),
                              ),
                              child: TextField(
                                controller: controller,
                                style: TextStyle(color: Colors.white, fontSize: 18),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(16.0),
                                ),
                                onChanged: (text) => setState(() {}),
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

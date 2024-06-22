import 'package:appfirebase/ui/home/learning_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:appfirebase/firebase_options.dart';  
import 'package:appfirebase/ui/level1/level1_bindo.dart';
//import 'package:appfirebase/ui/home/learning_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Read Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Level1_bindo(), // Menghubungkan LearningApp ke MyApp sebagai widget home
      home: Level1_bindo(),
    );
  }
}

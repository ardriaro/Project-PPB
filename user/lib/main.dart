import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ppbfinal/route.dart';
import 'firebase_options.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Wonderkids',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: rSplash,
      onGenerateRoute: generateRoute,
      navigatorKey: NAV_KEY,
    );
  }
}

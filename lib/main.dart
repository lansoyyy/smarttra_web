import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smarttra_web/screens/home_screen.dart';
import 'package:smarttra_web/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          authDomain: 'smarttra-dc027.firebaseapp.com',
          apiKey: "AIzaSyDEZZf6w2hYcPapoGiY4dfgwvIoGyrz8zc",
          appId: "1:352216925523:web:2fc2cdae61a77d37564da6",
          messagingSenderId: "352216925523",
          projectId: "smarttra-dc027",
          storageBucket: "smarttra-dc027.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Smarttra',
      home: HomeScreen(),
    );
  }
}

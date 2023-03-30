import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/pages/login.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/navigator.dart';

import 'firebase_options.dart';

Future<void> main() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginForm(),
    );
  }
}

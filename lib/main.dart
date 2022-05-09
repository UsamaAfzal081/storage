import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/Dashboard.dart';
import 'package:login/Register.dart';
import 'package:login/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false ,
    initialRoute: 'login',
    routes: {
      'login' : (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'home': (context) => Dashboard(),
    },

  ));
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:me_care/choice.dart';
import 'package:me_care/doctors.dart';
import 'package:me_care/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: 'home',
      // routes: {
      //   'home': (context) => const Home(),
      // },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF1d6614),
      ),
      home: const Choice(),
    );
  }
}

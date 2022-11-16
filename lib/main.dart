import 'package:app_flutter_memoir/page/ListeCategories.dart';
import 'package:app_flutter_memoir/page/SettingPage.dart';
import 'package:app_flutter_memoir/page/login.dart';
import 'package:app_flutter_memoir/page/test.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_memoir/page/welcome_page.dart';

import 'page/listTest.dart';

const d_red = const Color(0xFFE9717D);

void main() {
  runApp(const MyApp());
}
/* runApp(const MyApp());
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobSeeker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}

import 'package:app_flutter_memoir/page/liste/ListeCategories.dart';
import 'package:app_flutter_memoir/page/SettingPage.dart';
import 'package:app_flutter_memoir/page/login.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_memoir/page/welcome_page.dart';
import 'package:get_storage/get_storage.dart';
import 'page/Ajouter/Add_test.dart';
import 'page/PasserTest.dart';
import 'page/liste/ListeTestPassé.dart';
import 'page/Offre_Postuler.dart';
import 'page/liste/listTest.dart';

const d_red = Color.fromARGB(255, 97, 62, 65);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
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

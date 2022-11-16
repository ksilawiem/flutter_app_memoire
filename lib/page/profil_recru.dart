import 'package:app_flutter_memoir/api_models/Profil_Models/Domaine_model.dart';
import 'package:app_flutter_memoir/api_models/Profil_Models/Formation_Model.dart';
import 'package:app_flutter_memoir/api_models/Profil_Models/exp%C3%A9rience_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../api_models/Profil_Models/Formation_Model.dart';
import '../api_models/infoRecruteur_Mole.dart';
import '../api_models/Profil_Models/informationCandidat_Model.dart';
import '../request/Competence_api.dart';
import '../request/experience_Apil.dart';
import '../request/formation_api.dart';
import '../request/informationC_api.dart';
import '../request/informationR_api.dart';
import 'ListeCategories.dart';
import 'Mes candidature.dart';
import 'SettingPage.dart';
import 'listTest.dart';
import 'liste_offre.dart';
import 'login.dart';

class Profilerecruteur extends StatefulWidget {
  @override
  State<Profilerecruteur> createState() => _ProfilerecruteurState();
}

class _ProfilerecruteurState extends State<Profilerecruteur> {
  TextEditingController mailController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController entrepriseController = TextEditingController();
  TextEditingController linkdinController = TextEditingController();
  TextEditingController twitterController = TextEditingController();

  @override
  FormationRecruModel? formationRecruModel;

  void initState() {
    // TODO: implement initState
    super.initState();

    InformationRAPI informationRAPI = InformationRAPI();
    informationRAPI.userId = "34";
    informationRAPI.getData().then((value) {
      formationRecruModel = value as FormationRecruModel;
      NameController.text =
          formationRecruModel!.firstName! + formationRecruModel!.lastName!;
      mailController.text = formationRecruModel!.email!;

      entrepriseController.text = formationRecruModel!.address!;
      linkdinController.text = formationRecruModel!.linkedin!;
      twitterController.text = formationRecruModel!.twitter!;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'My\nProfile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: height * 0.30,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.35,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      controller: NameController,
                                      style: TextStyle(
                                        color: Color.fromRGBO(39, 105, 171, 1),
                                        fontFamily: 'Nunito',
                                        fontSize: 35,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              right: 20,
                              child: Icon(
                                AntDesign.setting,
                                color: Colors.grey[700],
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Image.asset(
                                    'images/candidat.png',
                                    width: innerWidth * 0.45,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Text(
                            'Mes informations ',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Color(0xFF000000)),
                            controller: NameController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Color(0xFF000000)),
                            controller: mailController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Color(0xFF000000)),
                            controller: entrepriseController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Entreprise	",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Color(0xFF000000)),
                            controller: linkdinController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "LinkdIn	",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            style: TextStyle(color: Color(0xFF000000)),
                            controller: twitterController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              /* prefixIcon: Icon(
                                Icons.LinkdIn,
                                color: Colors.grey,
                              ),*/
                              hintText: "Twitter	",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('JobSeeker'),
                ),
                ListTile(
                  title: const Text('offres'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ListOffre()));
                  },
                ),
                ListTile(
                  title: const Text('Settings'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                ),
                ListTile(
                  title: const Text('My candidats'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => candi()));
                  },
                ),
                ListTile(
                  title: const Text('catégories'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => List_categories()));
                  },
                ),
                ListTile(
                  title: const Text('logout'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

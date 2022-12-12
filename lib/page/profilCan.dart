import 'package:app_flutter_memoir/api_models/Profil_Models/Domaine_model.dart';
import 'package:app_flutter_memoir/api_models/Profil_Models/Formation_Model.dart';
import 'package:app_flutter_memoir/api_models/Profil_Models/exp%C3%A9rience_Model.dart';
import 'package:app_flutter_memoir/api_models/Profil_Models/informationCandidat_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../api_models/Profil_Models/informationCandidat_Model.dart';
import '../request/Competence_api.dart';
import '../request/experience_Apil.dart';
import '../request/formation_api.dart';
import '../request/informationC_api.dart';
import '../save/save.dart';
import 'liste/ListeCategories.dart';
import 'liste/ListeTestPassé.dart';
import 'Offre_Postuler.dart';
import 'SettingPage.dart';
import 'edit_profil.dart';
import 'liste/listTest.dart';
import 'liste/liste_offre.dart';
import 'login.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController mailController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController linkdinController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController diplomeController = TextEditingController();

  TextEditingController institutionController = TextEditingController();

  TextEditingController DateobtController = TextEditingController();
  TextEditingController NcompetenceController = TextEditingController();
  TextEditingController entrepriseController = TextEditingController();
  TextEditingController PexperienceController = TextEditingController();

  @override
  InformationModel? informationModel;
  DomainesModel? domainesModel;
  ExperienceModel? experienceModel;
  FormationModel? formationModel;
  void initState() {
    // TODO: implement initState
    super.initState();

    InformationAPI informationAPI = InformationAPI();
    informationAPI.userId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();
    informationAPI.getData().then((value) {
      informationModel = value as InformationModel;

      NameController.text =
          informationModel!.firstName! + informationModel!.lastName!;

      mailController.text = informationModel!.email!;
      adressController.text = informationModel!.address!;
      linkdinController.text = informationModel!.linkedin!;
      twitterController.text = informationModel!.twitter!;

      setState(() {});
    });
    FormationAPI formationAPI = FormationAPI();
    FormationModel formationModel;
    formationAPI.userId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();

    formationAPI.getData().then((value) {
      formationModel = value as FormationModel;
      diplomeController.text = "${formationModel.formations?[0].name}";
      institutionController.text = "${formationModel.formations?[0].institut}";
      DateobtController.text = "${formationModel.formations?[0].formationDate}";

      setState(() {});
    });

    ExperienceAPI experienceAPI = ExperienceAPI();
    experienceAPI.userId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();
    experienceAPI.getData().then((value) {
      experienceModel = value as ExperienceModel;

      entrepriseController.text = experienceModel!.experiences![0].enterprise! +
          "(" +
          "${experienceModel?.experiences?[0].startedAt}/${experienceModel?.experiences?[0].endedAt}" +
          ")";
      // PexperienceController.text =
      //    "${experienceModel?.experiences?[0].startedAt}/${experienceModel?.experiences?[0].endedAt}";

      setState(() {});
    });

    DomaineAPI domaineAPI = DomaineAPI();
    domaineAPI.userId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();
    domaineAPI.getData().then((value) {
      domainesModel = value as DomainesModel;

      NcompetenceController.text = domainesModel!.domaines![0].name!;

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
                    'Mon profil',
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
                                      width: width,
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
                                    'images/1665749592568.jpg',
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
                            controller: adressController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Address	",
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.35,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0,
                          ),
                          Positioned(
                            top: 50,
                            right: 10,
                            child: Icon(
                              AntDesign.setting,
                              color: Colors.grey[700],
                              size: 30,
                            ),
                          ),
                          Text(
                            'Ma formation ',
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
                            controller: diplomeController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Diplome",
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
                            controller: institutionController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Établissement et institution",
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
                            controller: DateobtController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Date obtenu diplome	",
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.20,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0,
                          ),
                          Positioned(
                            top: 50,
                            right: 10,
                            child: Icon(
                              AntDesign.setting,
                              color: Colors.grey[700],
                              size: 30,
                            ),
                          ),
                          Text(
                            ' Mes compétences',
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
                            controller: NcompetenceController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Name compétence",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.30,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0,
                          ),
                          Positioned(
                            top: 50,
                            right: 10,
                            child: Icon(
                              AntDesign.setting,
                              color: Colors.grey[700],
                              size: 30,
                            ),
                          ),
                          Text(
                            'Mes expériences ',
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
                            controller: entrepriseController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Entreprise",
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
                            controller: PexperienceController,
                            cursorColor: Color(0xFF9b9b9b),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.grey,
                              ),
                              hintText: "Période d'expérience	",
                              hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
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
                            builder: (context) => EditProfilePage()));
                  },
                ),
                ListTile(
                  title: const Text('My candidats'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => MesCandidatures(
                                //    cat: '',
                                )));
                  },
                ),
                ListTile(
                  title: const Text('My tests'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ListTestPasse(
                                  catId: 1,
                                )));
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

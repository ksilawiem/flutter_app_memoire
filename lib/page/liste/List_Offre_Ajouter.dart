import 'package:app_flutter_memoir/page/profil_recru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../api_models/Offre_Models/DeleteOffre_Model.dart';
import '../../api_models/Offre_Models/ListOffreUser_Model.dart';
import '../../api_models/Test_Models/Liste_TestC_Model.dart';
import '../../api_models/Test_Models/TestPasse_Model.dart';
import '../../api_models/list_user_Model.dart';
import '../../request/ListUser_api.dart';
import '../../request/Test_gratuit_req/TestPasse_api.dart';
import '../../request/Test_gratuit_req/testCatégorie_api.dart';
import '../../request/offres_req/DeletOffre_api.dart';
import '../../request/offres_req/ListOffreUser_api.dart';
import '../../save/save.dart';
import '../Ajouter/formulaire-ajout-offre.dart';
import '../SettingPage.dart';
import '../login.dart';
import 'ListeCategories.dart';
import 'liste_canditats.dart';
import 'liste_offre.dart';

class ListOffreAjouter extends StatefulWidget {
  const ListOffreAjouter({Key? key}) : super(key: key);

  @override
  State<ListOffreAjouter> createState() => _ListOffreAjouterState();
}

class _ListOffreAjouterState extends State<ListOffreAjouter> {
  DeletOffre_Model? _DeletOffre_Model;

  ListOffreUser_Model? _listOffreUser_Model;
  Map<int, String> O = {};
  @override
  void initState() {
    super.initState();

    ListOffreUserAPI listOffreUserAPI = ListOffreUserAPI();
    listOffreUserAPI.userId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();
    listOffreUserAPI.getData().then((value) {
      _listOffreUser_Model = value as ListOffreUser_Model;
      print(_listOffreUser_Model?.toJson());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(border: Border.all()),
            height: 50,
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              //validator: controller.nameValidator,controller:controller.username,
              decoration: InputDecoration(
                icon: Icon(Icons.search_rounded),
                hintText: " ",
                filled: true,
                border: InputBorder.none,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(.0))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(.0))),
              ),
            ),
          ),
        ),
        Expanded(
            child: _listOffreUser_Model == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _listOffreUser_Model?.dataOffre?.length,
                    itemBuilder: (context, pos) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          child: Container(
                            height: 120,
                            child: Column(children: [
                              IconButton(
                                icon: Icon(Icons.delete),
                                iconSize: 24.0,
                                color: Colors.grey,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  DeletOffreAPI deletOffreAPI =
                                                      DeletOffreAPI();
                                                  deletOffreAPI.offreId =
                                                      _listOffreUser_Model!
                                                          .dataOffre![pos].id
                                                          .toString();
                                                  deletOffreAPI
                                                      .delet()
                                                      .then((value) {});
                                                },
                                                child: const Text('Supprimer'),
                                              )
                                            ],
                                            title: const Text('Supprimer'),
                                            contentPadding:
                                                const EdgeInsets.all(20.0),
                                            content: const Text(
                                                'voulez vous supprimer cette offre?'),
                                          ));
                                },
                              ),
                              Text(
                                "${_listOffreUser_Model?.dataOffre?[pos].name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              TextButton(
                                child: Text("Liste des candidas"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      // builder: (context) => SocialPage(),
                                      builder: (context) => ListCandidats(),
                                    ),
                                  );
                                },
                              ),

                              /* Text(
                                "${_listUser_Model?.users?[pos].lastName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),*/
                              /* Text(
                                "Email: ${_listUser_Model?.users?[pos].email}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),*/
                            ]),
                          ),
                        ),
                      );
                    }))
      ]),
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
              title: const Text('Offres'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => ListOffre()));
              },
            ),
            ListTile(
              title: const Text('profil'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Profilerecruteur()));
              },
            ),
            ListTile(
              title: const Text('Edit profil'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              title: const Text('Ajouter offre'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => AjoutOffre()));
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
    ));
  }
}

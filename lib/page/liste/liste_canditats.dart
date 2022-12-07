import 'package:app_flutter_memoir/page/profil_recru.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../api_models/Test_Models/Liste_TestC_Model.dart';
import '../../api_models/Test_Models/TestPasse_Model.dart';
import '../../api_models/list_user_Model.dart';
import '../Ajouter/formulaire-ajout-offre.dart';
import '../../request/ListUser_api.dart';
import '../../request/Test_gratuit_req/TestPasse_api.dart';
import '../../request/Test_gratuit_req/testCatégorie_api.dart';
import '../../save/save.dart';
import '../SettingPage.dart';
import '../login.dart';
import 'ListeCategories.dart';
import 'liste_offre.dart';

class ListCandidats extends StatefulWidget {
  const ListCandidats({Key? key}) : super(key: key);

  @override
  State<ListCandidats> createState() => _ListCandidatsState();
}

class _ListCandidatsState extends State<ListCandidats> {
  ListUser_Model? _listUser_Model;
  Map<int, String> U = {};
  @override
  void initState() {
    super.initState();

    UserAPI userAPI = UserAPI();

    userAPI.getData().then((value) {
      _listUser_Model = value as ListUser_Model;

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
            child: _listUser_Model == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _listUser_Model?.users?.length,
                    itemBuilder: (context, pos) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          child: Container(
                            height: 100,
                            child: Column(children: [
                              Text(
                                "${_listUser_Model?.users?[pos].firstName}"
                                "${_listUser_Model?.users?[pos].lastName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              /* Text(
                                "${_listUser_Model?.users?[pos].lastName}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),*/
                              Text(
                                "Email: ${_listUser_Model?.users?[pos].email}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
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
              title: const Text('offres'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => ListOffre()));
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
              title: const Text('Mon profil'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Profilerecruteur()));
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

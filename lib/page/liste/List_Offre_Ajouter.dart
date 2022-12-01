import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../api_models/Offre_Models/ListOffreUser_Model.dart';
import '../../api_models/Test_Models/Liste_TestC_Model.dart';
import '../../api_models/Test_Models/TestPasse_Model.dart';
import '../../api_models/list_user_Model.dart';
import '../../request/ListUser_api.dart';
import '../../request/Test_gratuit_req/TestPasse_api.dart';
import '../../request/Test_gratuit_req/testCatégorie_api.dart';
import '../../request/offres_req/ListOffreUser_api.dart';
import '../../save/save.dart';
import 'liste_canditats.dart';

class ListOffreAjouter extends StatefulWidget {
  const ListOffreAjouter({Key? key}) : super(key: key);

  @override
  State<ListOffreAjouter> createState() => _ListOffreAjouterState();
}

class _ListOffreAjouterState extends State<ListOffreAjouter> {
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
                            height: 100,
                            child: Column(children: [
                              Text(
                                "${_listOffreUser_Model?.dataOffre?[pos].name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text('Liste des candidas'),

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
    ));
  }
}

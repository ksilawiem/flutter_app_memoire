import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../api_models/Test_Models/Liste_TestC_Model.dart';
import '../../api_models/Test_Models/TestPasse_Model.dart';
import '../../api_models/list_user_Model.dart';
import '../../request/ListUser_api.dart';
import '../../request/Test_gratuit_req/TestPasse_api.dart';
import '../../request/Test_gratuit_req/testCatégorie_api.dart';
import '../../save/save.dart';

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
    //UserAPI userAPI = UserAPI();
    // TestsModel? testsModel;
    /* userAPI.getData().then((value) {
      testsModel = value as TestsModel;
      for (int i = 0; i < testsModel!.data1!.length; i++) {
        U[testsModel!.data1![i].id!] = testsModel!.data1![i].name!;
      }
      //qq[]=
      print(testsModel?.toJson());
    });*/

    UserAPI userAPI = UserAPI();

    /* userAPI.userId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();
    print(userAPI.apiUrl());*/

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
    ));
  }
}

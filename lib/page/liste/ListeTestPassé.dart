import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../api_models/Test_Models/Liste_TestC_Model.dart';
import '../../api_models/Test_Models/TestPasse_Model.dart';
import '../../request/Test_gratuit_req/TestPasse_api.dart';
import '../../request/Test_gratuit_req/testCatégorie_api.dart';
import '../../save/save.dart';

class ListTestPasse extends StatefulWidget {
  ListTestPasse({Key? key, required this.catId}) : super(key: key);
  int catId;
  @override
  State<ListTestPasse> createState() => _ListTestPasseState();
}

class _ListTestPasseState extends State<ListTestPasse> {
  TestPasse_Model? _testPasse_Model;
  Map<int, String> T = {};
  @override
  void initState() {
    super.initState();

    TestCatAPI testCatAPI = TestCatAPI();
    testCatAPI.categorieId = 1.toString(); //.catId.toString();
    TestsModel? testsModel;
    print("-----" * 20);

    print(testCatAPI.apiUrl());
    print("-----" * 20);
    testCatAPI.getData().then((value) {
      testsModel = value as TestsModel;

      print("-----" * 20);

      print(testsModel?.toJson());
      print("-----" * 20);
      for (int i = 0; i < testsModel!.data1!.length; i++) {
        T[testsModel!.data1![i].id!] = testsModel!.data1![i].name!;
        print("-----" * 20);

        print("${testsModel!.data1![i].id}-----${testsModel!.data1![i].name}");
        print("-----" * 20);
      }
      //qq[]=
      print(testsModel?.toJson());
    });

    TestPasseAPI testPasseAPI = TestPasseAPI();

    testPasseAPI.userId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();
    print(testPasseAPI.apiUrl());

    testPasseAPI.getData().then((value) {
      _testPasse_Model = value as TestPasse_Model;

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
            child: _testPasse_Model == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _testPasse_Model?.tooks?.length,
                    itemBuilder: (context, pos) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          child: Container(
                            height: 100,
                            child: Column(children: [
                              Text(
                                "${T[_testPasse_Model?.tooks?[pos].testId]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "score: ${_testPasse_Model?.tooks?[pos].score}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "date de passer le test: ${_testPasse_Model?.tooks?[pos].createdAt}",
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

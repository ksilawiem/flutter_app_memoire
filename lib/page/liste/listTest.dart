import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../api_models/Test_Models/Liste_TestC_Model.dart';
import '../../request/Test_gratuit_req/testCatégorie_api.dart';

class ListTest extends StatefulWidget {
  String cat;
  ListTest({required this.cat});
  @override
  State<ListTest> createState() => _ListTestState();
}

class _ListTestState extends State<ListTest> {
  TestsModel? testsModel;
  @override
  void initState() {
    super.initState();

    TestCatAPI testCatAPI = TestCatAPI();
    testCatAPI.categorieId = widget.cat;
    testCatAPI.getData().then((value) {
      testsModel = value as TestsModel;
      print(value);
      // testsModel = value as TestsModel;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: testsModel == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: testsModel?.data1?.length,
                  itemBuilder: (context, pos) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            // decoration: BoxDecoration(border: Border.all()),
                            child: Row(children: [
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    decoration:
                                        BoxDecoration(border: Border.all()),
                                    child: Column(
                                      children: [
                                        Text(
                                            "${testsModel?.data1?[pos].nbrQst}"),
                                        Text("Question")
                                      ],
                                    ),
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text("${testsModel?.data1?[pos].name}"),
                                  Text("${testsModel?.data1?[pos].description}")
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Container(
                                    color: Colors.blue,
                                    height: 50,
                                    width: 90,
                                    child:
                                        Center(child: Text("passer le test")),
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                              ))
                            ]),
                          )),
                    );
                  })),
    );
  }
}

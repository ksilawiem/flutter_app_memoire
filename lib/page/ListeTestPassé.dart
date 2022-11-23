import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../api_models/Test_Models/TestPasse_Model.dart';
import '../api_models/Test_Models/Liste_TestC_Model.dart';
import '../request/Test_gratuit_req/TestPasse_api.dart';

class ListTestPasse extends StatefulWidget {
  String cat;
  ListTestPasse({required this.cat});
  @override
  State<ListTestPasse> createState() => _ListTestPasseState();
}

class _ListTestPasseState extends State<ListTestPasse> {
  TestPasse_Model? testPasse_Model;
  @override
  void initState() {
    super.initState();

    TestPasseAPI testPasseAPI = TestPasseAPI();
    testPasseAPI.userId = widget.cat;
    testPasseAPI.getData().then((value) {
      testPasse_Model = value as TestPasse_Model;
      print(value);
      // testsModel = value as TestsModel;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: testPasse_Model == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: testPasse_Model?.tooks?.length,
                  itemBuilder: (context, pos) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 8,
                          child: Container(
                            decoration: BoxDecoration(border: Border.all()),
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
                                            "${testPasse_Model?.tooks?[pos].testId}"),
                                        Text("Question")
                                      ],
                                    ),
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text("${testPasse_Model?.tooks?[pos].score}"),
                                  Text(
                                      "${testPasse_Model?.tooks?[pos].startedAt}")
                                ],
                              )),
                              /*      Expanded(
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
                              ))*/
                            ]),
                          )),
                    );
                  })),
    );
  }
}

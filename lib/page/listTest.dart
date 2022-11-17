import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../api_models/Test_Models/Test_Model.dart';
import '../request/test_api.dart';

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
                                            "${testsModel?.data1?[pos].nbrQst}"),
                                        Text("$pos")
                                      ],
                                    ),
                                  )
                                ],
                              )),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text("${testsModel?.data1?[pos].name}"),
                                  Text("$pos")
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

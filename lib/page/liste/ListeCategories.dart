import 'package:flutter/material.dart';

import '../../api_models/Categorie_Model.dart';
import '../../request/categorie_api.dart';
import 'listTest.dart';

class List_categories extends StatefulWidget {
  const List_categories({Key? key}) : super(key: key);

  @override
  State<List_categories> createState() => _List_categoriesState();
}

class _List_categoriesState extends State<List_categories> {
  CategoriesModel? _categoriesModel;

  @override
  void initState() {
    super.initState();

    CategorieAPI categorieAPI = CategorieAPI();
    categorieAPI.getData().then((value) {
      _categoriesModel = value as CategoriesModel;

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
            // height: 30,
            // width: width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 221, 223, 235),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
              ),
            ),
            // decoration: BoxDecoration(border: Border.all()),
            height: 50,
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              //validator: controller.nameValidator,controller:controller.username,
              decoration: InputDecoration(
                icon: Icon(Icons.search_rounded),
                hintText: "search ",
                filled: true,
                border: InputBorder.none,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    borderSide: BorderSide(color: Colors.blue)),
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
            child: _categoriesModel == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _categoriesModel?.data?.length,
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
                            height: 100,
                            child: Column(children: [
                              Text(
                                "${_categoriesModel?.data?[pos].nom}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => ListTest(
                                                cat: _categoriesModel!
                                                    .data![pos].id
                                                    .toString(),
                                              )));
//ListTest(cat: _categoriesModel?.data?[pos].id,)
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child:
                                      Center(child: Text("Accéder aux tests")),
                                ),
                              )
                            ]),
                          ),
                        ),
                      );
                    }))
      ]),
    ));
  }
}

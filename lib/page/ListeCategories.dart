import 'package:flutter/material.dart';

import '../api_models/Categorie_Model.dart';
import '../request/categorie_api.dart';
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

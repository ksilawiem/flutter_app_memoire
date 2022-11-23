import 'package:flutter/material.dart';

import '../api_models/Profil_Models/Mescandidature_Model.dart';
import '../request/offres_req/ListOffre_Postuler_API.dart';

class Mes_candidatures extends StatefulWidget {
  const Mes_candidatures({Key? key}) : super(key: key);

  @override
  State<Mes_candidatures> createState() => _Mes_candidaturesState();
}

class _Mes_candidaturesState extends State<Mes_candidatures> {
  Offre_PostulerModel? _offre_PostulerModel;

  @override
  void initState() {
    super.initState();

    Offre_PostulerAPI offre_PostulerAPI = Offre_PostulerAPI();
    offre_PostulerAPI.getData().then((value) {
      _offre_PostulerModel = value as Offre_PostulerModel;

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
            child: _offre_PostulerModel == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: _offre_PostulerModel?.posts?.length,
                    itemBuilder: (context, pos) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          child: Container(
                            height: 100,
                            child: Column(children: [
                              Text(
                                "${_offre_PostulerModel?.posts?[pos].offreId}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "${_offre_PostulerModel?.posts?[pos].score}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "${_offre_PostulerModel?.posts?[pos].userId}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              /* GestureDetector(
                                   onTap: () {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => ListTest(
                                                cat: _offre_PostulerModel!
                                                    .data![pos].id
                                                    .toString(),
                                              )));
//ListTest(cat: _categoriesModel?.data?[pos].id,)
                                },*/
                              /* child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child:
                                      Center(child: Text("Accéder aux tests")),
                                ),
                                  )*/
                            ]),
                          ),
                        ),
                      );
                    }))
      ]),
    ));
  }
}

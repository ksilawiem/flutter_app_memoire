import 'package:app_flutter_memoir/save/save.dart';
import 'package:flutter/material.dart';

import '../api_models/Offre_Models/OffrePostulerModel.dart';
import '../api_models/Offre_Models/offre_model.dart';
import '../api_models/Profil_Models/Mescandidature_Model.dart';
import '../request/offres_req/ListOffre_Postuler_API.dart';
import '../request/offres_req/offre-api.dart';

class MesCandidatures extends StatefulWidget {
  const MesCandidatures({Key? key}) : super(key: key);

  @override
  State<MesCandidatures> createState() => _MesCandidaturesState();
}

class _MesCandidaturesState extends State<MesCandidatures> {
  OffrePostulerModel? _offre_PostulerModel;
  Map<int, String> q = {};
  @override
  void initState() {
    super.initState();
    OffreAPI offreAPI = OffreAPI();
    OffreModel? offreModel;
    offreAPI.getData().then((value) {
      offreModel = value as OffreModel;
      for (int i = 0; i < offreModel!.offres!.length; i++) {
        q[offreModel!.offres![i].id!] = offreModel!.offres![i].name!;
      }
      //qq[]=
      print(offreModel?.toJson());
    });

    Offre_PostulerAPI offre_PostulerAPI = Offre_PostulerAPI();

    offre_PostulerAPI.userId =
        SecureStorage.readSecureDataINT(SecureStorage.userId).toString();
    print(offre_PostulerAPI.apiUrl());

    offre_PostulerAPI.getData().then((value) {
      _offre_PostulerModel = value as OffrePostulerModel;

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
                                "${q[_offre_PostulerModel?.posts?[pos].offreId]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "score: ${_offre_PostulerModel?.posts?[pos].score}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                " offre postuler le: ${_offre_PostulerModel?.posts?[pos].createdAt}",
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

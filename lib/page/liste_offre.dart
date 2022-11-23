import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../api_models/Offre_Models/offre_model.dart';
import '../api_models/login_model.dart';
import '../request/offres_req/offre-api.dart';
import 'ListeCategories.dart';
import 'Offre_Postuler.dart';
import 'login.dart';
import 'profilCan.dart';
import 'profil_recru.dart';

class ListOffre extends StatefulWidget {
  const ListOffre({Key? key}) : super(key: key);

  @override
  State<ListOffre> createState() => _ListOffreState();
}

class _ListOffreState extends State<ListOffre> {
  List<ListOffreModel> list = [];
  OffreModel? _offreModel;

  @override
  void initState() {
    super.initState();
    print("OffreAPI");
    OffreAPI offreAPI = OffreAPI();
    offreAPI.getData().then((value) {
      _offreModel = value as OffreModel;
      print("OffreAPI");
      print(_offreModel?.toJson());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 100; i++) {
      list.add(ListOffreModel(
          id: 10,
          address: "kjiooin",
          categorie: "uuuuuuu",
          createdAt: "$i",
          description: "ijhuiybuiui  ${i * 100}",
          logo:
              "https://res.cloudinary.com/dqe0t46k3/image/upload/v1667591698/l4ndgji1ilsjea6xnwia.png",
          name: "iiiiiiiiiiiii",
          nbrQst: 55,
          score: 100,
          telefone: "548511689  $i",
          temps: "jklnjiij",
          updatedAt: "5555",
          userId: 55));
    }

    return SafeArea(
      child: Scaffold(
        body: _offreModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
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
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(.0))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(.0))),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      //  physics: NeverScrollableScrollPhysics(),
                      // shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: _offreModel?.offres?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(border: Border.all()),
                          child: FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${_offreModel?.offres?[index].categorie}"),
                                Text(
                                    "post by : ${_offreModel?.offres?[index].name}"),
                                Text(" ${_offreModel?.offres?[index].address}"),
                                Text(
                                    "category ${_offreModel?.offres?[index].categorie}"),
                                Row(
                                  children: [
                                    Text(
                                        "company ${_offreModel?.offres?[index].categorie}"),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Image.network(
                                      _offreModel!.offres![index].logo!,
                                      height: 40,
                                      width: 40,
                                    )
                                  ],
                                ),
                                Text(
                                    " ${_offreModel?.offres?[index].description}"),
                                ElevatedButton(
                                    child: Text("Apply now",
                                        style: TextStyle(fontSize: 14)),
                                    style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blueAccent),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                                side: BorderSide(
                                                    color:
                                                        Colors.blueAccent)))),
                                    onPressed: () => null)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ]),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('JobSeeker'),
              ),
              ListTile(
                title: const Text('profil'),
                onTap: () {
                  // Update the state of the app.
                  LoginModel loginModel = LoginModel();

                  if (loginModel.user!.role == "condidat") {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  } else {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => Profilerecruteur()));
                  }
                },
              ),
              ListTile(
                title: const Text('List candidats'),
                /* onTap: () {
                  // Update the state of the app.
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => candi()));
                },*/
              ),
              ListTile(
                title: const Text('My tests'),
                onTap: () {
                  // Update the state of the app.
                  /*   Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => List_Test()));*/
                },
              ),
              ListTile(
                title: const Text('catégories'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => List_categories()));
                },
              ),
              ListTile(
                title: const Text('logout'),
                onTap: () {
                  // Update the state of the app.
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Login()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListOffreModel {
  int? id;
  int? userId;
  String? name;
  String? address;
  String? telefone;
  String? categorie;
  String? temps;
  String? logo;
  String? description;
  int? score;
  int? nbrQst;
  String? createdAt;
  String? updatedAt;

  ListOffreModel(
      {this.id,
      this.userId,
      this.name,
      this.address,
      this.telefone,
      this.categorie,
      this.temps,
      this.logo,
      this.description,
      this.score,
      this.nbrQst,
      this.createdAt,
      this.updatedAt});

  ListOffreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    address = json['address'];
    telefone = json['telefone'];
    categorie = json['categorie'];
    temps = json['temps'];
    logo = json['logo'];
    description = json['description'];
    score = json['score'];
    nbrQst = json['nbr_qst'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['telefone'] = this.telefone;
    data['categorie'] = this.categorie;
    data['temps'] = this.temps;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['score'] = this.score;
    data['nbr_qst'] = this.nbrQst;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

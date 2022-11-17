import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class OffreModel extends AbstractJsonResource {
  List<Offres>? offres;
  String? token;

  OffreModel({this.offres, this.token});

  OffreModel.fromJson(Map<String, dynamic> json) {
    if (json['offres'] != null) {
      offres = <Offres>[];
      json['offres'].forEach((v) {
        offres!.add(new Offres.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offres != null) {
      data['offres'] = this.offres!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    return data;
  }
}

class Offres {
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

  Offres(
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

  Offres.fromJson(Map<String, dynamic> json) {
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

import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class OffreCreateModel extends AbstractJsonResource {
  String? message;
  Offre? offre;

  OffreCreateModel({this.message, this.offre});

  OffreCreateModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    offre = json['Offre'] != null ? new Offre.fromJson(json['Offre']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.offre != null) {
      data['Offre'] = this.offre!.toJson();
    }
    return data;
  }
}

class Offre {
  String? name;
  String? description;
  String? address;
  String? telefone;
  String? temps;
  String? logo;
  String? categorie;
  String? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Offre(
      {this.name,
      this.description,
      this.address,
      this.telefone,
      this.temps,
      this.logo,
      this.categorie,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Offre.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    address = json['address'];
    telefone = json['telefone'];
    temps = json['temps'];
    logo = json['logo'];
    categorie = json['categorie'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['telefone'] = this.telefone;
    data['temps'] = this.temps;
    data['logo'] = this.logo;
    data['categorie'] = this.categorie;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

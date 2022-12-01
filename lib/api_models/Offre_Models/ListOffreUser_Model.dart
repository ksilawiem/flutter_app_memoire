import '../../api/abstract_json_resource.dart';

class ListOffreUser_Model extends AbstractJsonResource {
  List<DataOffre>? dataOffre;

  ListOffreUser_Model({this.dataOffre});

  ListOffreUser_Model.fromJson(Map<String, dynamic> json) {
    if (json['dataOffre'] != null) {
      dataOffre = <DataOffre>[];
      json['dataOffre'].forEach((v) {
        dataOffre!.add(new DataOffre.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataOffre != null) {
      data['dataOffre'] = this.dataOffre!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataOffre {
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

  DataOffre(
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

  DataOffre.fromJson(Map<String, dynamic> json) {
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

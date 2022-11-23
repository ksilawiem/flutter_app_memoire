import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class Test_Model extends AbstractJsonResource {
  int? id;
  int? categorieId;
  String? name;
  String? description;
  int? score;
  int? nbrQst;
  String? createdAt;
  String? updatedAt;

  Test_Model(
      {this.id,
      this.categorieId,
      this.name,
      this.description,
      this.score,
      this.nbrQst,
      this.createdAt,
      this.updatedAt});

  Test_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categorieId = json['categorie_id'];
    name = json['name'];
    description = json['description'];
    score = json['score'];
    nbrQst = json['nbr_qst'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categorie_id'] = this.categorieId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['score'] = this.score;
    data['nbr_qst'] = this.nbrQst;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

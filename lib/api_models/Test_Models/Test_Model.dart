import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class TestsModel extends AbstractJsonResource {
  List<Data1>? data1;

  TestsModel({this.data1});

  TestsModel.fromJson(Map<String, dynamic> json) {
    if (json['data1'] != null) {
      data1 = <Data1>[];
      json['data1'].forEach((v) {
        data1!.add(new Data1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data1 != null) {
      data['data1'] = this.data1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data1 {
  int? id;
  int? categorieId;
  String? name;
  String? description;
  int? score;
  int? nbrQst;
  String? createdAt;
  String? updatedAt;

  Data1(
      {this.id,
      this.categorieId,
      this.name,
      this.description,
      this.score,
      this.nbrQst,
      this.createdAt,
      this.updatedAt});

  Data1.fromJson(Map<String, dynamic> json) {
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

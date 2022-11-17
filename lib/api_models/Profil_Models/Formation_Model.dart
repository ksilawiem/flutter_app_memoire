import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class FormationModel extends AbstractJsonResource {
  String? message;
  List<Formations>? formations;

  FormationModel({this.message, this.formations});

  FormationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['formations'] != null) {
      formations = <Formations>[];
      json['formations'].forEach((v) {
        formations!.add(new Formations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.formations != null) {
      data['formations'] = this.formations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Formations {
  int? id;
  int? userId;
  String? name;
  String? institut;
  String? formationDate;
  String? createdAt;
  String? updatedAt;

  Formations(
      {this.id,
      this.userId,
      this.name,
      this.institut,
      this.formationDate,
      this.createdAt,
      this.updatedAt});

  Formations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    institut = json['institut'];
    formationDate = json['formationDate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['institut'] = this.institut;
    data['formationDate'] = this.formationDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

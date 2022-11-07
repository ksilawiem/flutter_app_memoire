import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class DomainesModel extends AbstractJsonResource {
  String? message;
  List<Domaines>? domaines;

  DomainesModel({this.message, this.domaines});

  DomainesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['domaines'] != null) {
      domaines = <Domaines>[];
      json['domaines'].forEach((v) {
        domaines!.add(new Domaines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.domaines != null) {
      data['domaines'] = this.domaines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Domaines {
  int? id;
  int? userId;
  String? name;
  String? createdAt;
  String? updatedAt;

  Domaines({this.id, this.userId, this.name, this.createdAt, this.updatedAt});

  Domaines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

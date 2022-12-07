import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class Postuler_Model extends AbstractJsonResource {
  String? message;
  Postuler? postuler;

  Postuler_Model({this.message, this.postuler});

  Postuler_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    postuler = json['Postuler'] != null
        ? new Postuler.fromJson(json['Postuler'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.postuler != null) {
      data['Postuler'] = this.postuler!.toJson();
    }
    return data;
  }
}

class Postuler {
  String? userId;
  String? offreId;
  String? startedAt;
  String? updatedAt;
  String? createdAt;
  int? id;

  Postuler(
      {this.userId,
      this.offreId,
      this.startedAt,
      this.updatedAt,
      this.createdAt,
      this.id});

  Postuler.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    offreId = json['offre_id'];
    startedAt = json['startedAt'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['offre_id'] = this.offreId;
    data['startedAt'] = this.startedAt;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

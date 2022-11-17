import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class ExperienceModel extends AbstractJsonResource {
  String? message;
  List<Experiences>? experiences;

  ExperienceModel({this.message, this.experiences});

  ExperienceModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['experiences'] != null) {
      experiences = <Experiences>[];
      json['experiences'].forEach((v) {
        experiences!.add(new Experiences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.experiences != null) {
      data['experiences'] = this.experiences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Experiences {
  int? id;
  int? userId;
  String? enterprise;
  String? startedAt;
  String? endedAt;
  String? createdAt;
  String? updatedAt;

  Experiences(
      {this.id,
      this.userId,
      this.enterprise,
      this.startedAt,
      this.endedAt,
      this.createdAt,
      this.updatedAt});

  Experiences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    enterprise = json['enterprise'];
    startedAt = json['startedAt'];
    endedAt = json['endedAt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['enterprise'] = this.enterprise;
    data['startedAt'] = this.startedAt;
    data['endedAt'] = this.endedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

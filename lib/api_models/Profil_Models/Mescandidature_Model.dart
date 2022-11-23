import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class Offre_PostulerModel extends AbstractJsonResource {
  String? message;
  List<Posts>? posts;

  Offre_PostulerModel({this.message, this.posts});

  Offre_PostulerModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? id;
  int? userId;
  int? offreId;
  int? score;
  int? checkedAnswer;
  int? validAnswer;
  String? startedAt;
  String? createdAt;
  String? updatedAt;

  Posts(
      {this.id,
      this.userId,
      this.offreId,
      this.score,
      this.checkedAnswer,
      this.validAnswer,
      this.startedAt,
      this.createdAt,
      this.updatedAt});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    offreId = json['offre_id'];
    score = json['score'];
    checkedAnswer = json['checkedAnswer'];
    validAnswer = json['validAnswer'];
    startedAt = json['startedAt'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['offre_id'] = this.offreId;
    data['score'] = this.score;
    data['checkedAnswer'] = this.checkedAnswer;
    data['validAnswer'] = this.validAnswer;
    data['startedAt'] = this.startedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

import '../../api/abstract_json_resource.dart';

class PostulerAnswer_Model extends AbstractJsonResource {
  String? message;
  Post? post;

  PostulerAnswer_Model({this.message, this.post});

  PostulerAnswer_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

class Post {
  int? id;
  int? userId;
  int? offreId;
  int? score;
  int? checkedAnswer;
  int? validAnswer;
  String? startedAt;
  String? createdAt;
  String? updatedAt;

  Post(
      {this.id,
      this.userId,
      this.offreId,
      this.score,
      this.checkedAnswer,
      this.validAnswer,
      this.startedAt,
      this.createdAt,
      this.updatedAt});

  Post.fromJson(Map<String, dynamic> json) {
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

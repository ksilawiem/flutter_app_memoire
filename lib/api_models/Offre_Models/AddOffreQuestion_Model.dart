import '../../api/abstract_json_resource.dart';

class AddOffreQuestionModel extends AbstractJsonResource {
  String? message;
  Question? question;

  AddOffreQuestionModel({this.message, this.question});

  AddOffreQuestionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.question != null) {
      data['question'] = this.question!.toJson();
    }
    return data;
  }
}

class Question {
  String? offreId;
  String? content;
  String? updatedAt;
  String? createdAt;
  int? id;

  Question(
      {this.offreId, this.content, this.updatedAt, this.createdAt, this.id});

  Question.fromJson(Map<String, dynamic> json) {
    offreId = json['offre_id'];
    content = json['content'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offre_id'] = this.offreId;
    data['content'] = this.content;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

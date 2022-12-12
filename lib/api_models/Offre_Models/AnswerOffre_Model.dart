import '../../api/abstract_json_resource.dart';

class AnswerOffre_Model extends AbstractJsonResource {
  Answers? answers;

  AnswerOffre_Model({this.answers});

  AnswerOffre_Model.fromJson(Map<String, dynamic> json) {
    answers =
        json['answers'] != null ? new Answers.fromJson(json['answers']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answers != null) {
      data['answers'] = this.answers!.toJson();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? content;
  int? valid;
  int? questionId;
  int? offreId;
  String? createdAt;
  String? updatedAt;

  Answers(
      {this.id,
      this.content,
      this.valid,
      this.questionId,
      this.offreId,
      this.createdAt,
      this.updatedAt});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    valid = json['valid'];
    questionId = json['question_id'];
    offreId = json['offre_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['valid'] = this.valid;
    data['question_id'] = this.questionId;
    data['offre_id'] = this.offreId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

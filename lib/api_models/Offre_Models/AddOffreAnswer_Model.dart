import '../../api/abstract_json_resource.dart';

class AddOffreAnswerModel extends AbstractJsonResource {
  String? message;
  Answer? answer;

  AddOffreAnswerModel({this.message, this.answer});

  AddOffreAnswerModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    answer =
        json['answer'] != null ? new Answer.fromJson(json['answer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.answer != null) {
      data['answer'] = this.answer!.toJson();
    }
    return data;
  }
}

class Answer {
  String? offreId;
  String? questionId;
  String? content;
  String? valid;
  String? updatedAt;
  String? createdAt;
  int? id;

  Answer(
      {this.offreId,
      this.questionId,
      this.content,
      this.valid,
      this.updatedAt,
      this.createdAt,
      this.id});

  Answer.fromJson(Map<String, dynamic> json) {
    offreId = json['offre_id'];
    questionId = json['question_id'];
    content = json['content'];
    valid = json['valid'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offre_id'] = this.offreId;
    data['question_id'] = this.questionId;
    data['content'] = this.content;
    data['valid'] = this.valid;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

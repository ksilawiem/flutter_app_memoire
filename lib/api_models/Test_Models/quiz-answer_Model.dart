import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class Quiz_answerModel extends AbstractJsonResource {
  List<Answer>? answer;

  Quiz_answerModel({this.answer});

  Quiz_answerModel.fromJson(Map<String, dynamic> json) {
    if (json['Answer'] != null) {
      answer = <Answer>[];
      json['Answer'].forEach((v) {
        answer!.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answer != null) {
      data['Answer'] = this.answer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  int? id;
  String? content;
  int? valid;
  int? questionId;
  int? testId;
  String? createdAt;
  String? updatedAt;

  Answer(
      {this.id,
      this.content,
      this.valid,
      this.questionId,
      this.testId,
      this.createdAt,
      this.updatedAt});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    valid = json['valid'];
    questionId = json['question_id'];
    testId = json['test_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['valid'] = this.valid;
    data['question_id'] = this.questionId;
    data['test_id'] = this.testId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

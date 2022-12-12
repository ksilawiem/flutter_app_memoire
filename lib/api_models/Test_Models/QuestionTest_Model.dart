import '../../api/abstract_json_resource.dart';

class QuestionTest_Model extends AbstractJsonResource {
  List<Question>? question;

  QuestionTest_Model({this.question});

  QuestionTest_Model.fromJson(Map<String, dynamic> json) {
    if (json['Question'] != null) {
      question = <Question>[];
      json['Question'].forEach((v) {
        question!.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.question != null) {
      data['Question'] = this.question!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  int? id;
  String? content;
  int? nbrAns;
  int? testId;
  String? createdAt;
  String? updatedAt;

  Question(
      {this.id,
      this.content,
      this.nbrAns,
      this.testId,
      this.createdAt,
      this.updatedAt});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    nbrAns = json['nbr_ans'];
    testId = json['test_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['nbr_ans'] = this.nbrAns;
    data['test_id'] = this.testId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

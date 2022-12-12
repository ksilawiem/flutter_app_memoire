import '../../api/abstract_json_resource.dart';

class ListQuestionOffre_Model extends AbstractJsonResource {
  List<QuestionOffre>? questionOffre;

  ListQuestionOffre_Model({this.questionOffre});

  ListQuestionOffre_Model.fromJson(Map<String, dynamic> json) {
    if (json['QuestionOffre'] != null) {
      questionOffre = <QuestionOffre>[];
      json['QuestionOffre'].forEach((v) {
        questionOffre!.add(new QuestionOffre.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questionOffre != null) {
      data['QuestionOffre'] =
          this.questionOffre!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionOffre {
  int? id;
  String? content;
  int? nbrAns;
  int? offreId;
  String? createdAt;
  String? updatedAt;

  QuestionOffre(
      {this.id,
      this.content,
      this.nbrAns,
      this.offreId,
      this.createdAt,
      this.updatedAt});

  QuestionOffre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    nbrAns = json['nbr_ans'];
    offreId = json['offre_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['nbr_ans'] = this.nbrAns;
    data['offre_id'] = this.offreId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

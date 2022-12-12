import '../../api/abstract_json_resource.dart';

class QuestionOffre_Model extends AbstractJsonResource {
  int? id;
  String? content;
  int? nbrAns;
  int? offreId;
  String? createdAt;
  String? updatedAt;

  QuestionOffre_Model(
      {this.id,
      this.content,
      this.nbrAns,
      this.offreId,
      this.createdAt,
      this.updatedAt});

  QuestionOffre_Model.fromJson(Map<String, dynamic> json) {
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

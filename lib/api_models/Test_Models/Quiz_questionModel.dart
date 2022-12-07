import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class Quiz_questionModel extends AbstractJsonResource {
  int? id;
  String? content;
  int? nbrAns;
  int? testId;
  String? createdAt;
  String? updatedAt;

  Quiz_questionModel(
      {this.id,
      this.content,
      this.nbrAns,
      this.testId,
      this.createdAt,
      this.updatedAt});

  Quiz_questionModel.fromJson(Map<String, dynamic> json) {
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

import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class TestPasse_Model extends AbstractJsonResource {
  String? message;
  List<Tooks>? tooks;

  TestPasse_Model({this.message, this.tooks});

  TestPasse_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['tooks'] != null) {
      tooks = <Tooks>[];
      json['tooks'].forEach((v) {
        tooks!.add(new Tooks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.tooks != null) {
      data['tooks'] = this.tooks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tooks {
  int? id;
  int? userId;
  int? testId;
  int? score;
  int? checkedAnswer;
  int? validAnswer;
  String? startedAt;
  String? createdAt;
  String? updatedAt;

  Tooks(
      {this.id,
      this.userId,
      this.testId,
      this.score,
      this.checkedAnswer,
      this.validAnswer,
      this.startedAt,
      this.createdAt,
      this.updatedAt});

  Tooks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    testId = json['test_id'];
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
    data['test_id'] = this.testId;
    data['score'] = this.score;
    data['checkedAnswer'] = this.checkedAnswer;
    data['validAnswer'] = this.validAnswer;
    data['startedAt'] = this.startedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

import '../../api/abstract_json_resource.dart';

class DeletOffre_Model extends AbstractJsonResource {
  String? message;

  DeletOffre_Model({this.message});

  DeletOffre_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

import 'package:app_flutter_memoir/api/abstract_json_resource.dart';

class VerifEmail_Model extends AbstractJsonResource {
  String? message;

  VerifEmail_Model({this.message});

  VerifEmail_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

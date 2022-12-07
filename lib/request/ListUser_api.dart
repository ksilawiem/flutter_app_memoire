import 'package:app_flutter_memoir/api_models/list_user_Model.dart';
import 'package:app_flutter_memoir/api_models/login_model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';

class UserAPI extends ApiManager {
  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/users";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return ListUser_Model.fromJson(data);
  }
}

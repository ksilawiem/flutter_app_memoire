import 'package:app_flutter_memoir/api_models/login_model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';

class LogInAPI extends ApiManager {
  @override
  String apiUrl() {
    return "http://192.168.1.112:8000/api/users/login";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return LoginModel.fromJson(data);
  }
}

import 'package:app_flutter_memoir/api_models/Profil_Models/Formation_Model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';

class FormationAPI extends ApiManager {
  String userId = "";
  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/formation/user/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return FormationModel.fromJson(data);
  }
}

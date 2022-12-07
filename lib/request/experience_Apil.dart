import 'package:app_flutter_memoir/api_models/Profil_Models/exp%C3%A9rience_Model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';
import '../api_models/Profil_Models/Domaine_model.dart';

class ExperienceAPI extends ApiManager {
  String userId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/experience/user/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return ExperienceModel.fromJson(data);
  }
}

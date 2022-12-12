import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';
import '../api_models/Profil_Models/Domaine_model.dart';

class DomaineAPI extends ApiManager {
  String userId = "";
  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/domaine/user/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return DomainesModel.fromJson(data);
  }
}

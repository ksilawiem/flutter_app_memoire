import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';
import '../api_models/Domaine_model.dart';

class DomaineAPI extends ApiManager {
  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/domaine/user/{user_id}";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return DomainesModel.fromJson(data);
  }
}

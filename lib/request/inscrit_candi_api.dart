import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';
import '../api_models/inscript_candi_model.dart';

class InsCAPI extends ApiManager {
  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/users/create";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return InscriptCandiModel.fromJson(data);
  }
}

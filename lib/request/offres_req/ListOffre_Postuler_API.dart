import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/OffrePostulerModel.dart';

class Offre_PostulerAPI extends ApiManager {
  String userId = "";
  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/postuler/user/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return OffrePostulerModel.fromJson(data);
  }
}

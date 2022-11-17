import 'package:app_flutter_memoir/api_models/Profil_Models/informationCandidat_Model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';

class InformationAPI extends ApiManager {
  String userId = "";
  @override
  String apiUrl() {
    return "http://192.168.1.112:8000/api/users/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return InformationModel.fromJson(data);
  }
}

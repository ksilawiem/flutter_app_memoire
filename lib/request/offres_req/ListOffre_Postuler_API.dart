import 'package:app_flutter_memoir/api_models/Profil_Models/informationCandidat_Model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api_models/Profil_Models/Mescandidature_Model.dart';

class Offre_PostulerAPI extends ApiManager {
  String userId = "";
  @override
  String apiUrl() {
    return "http://192.168.1.112:8000/api/postuler/user/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return Offre_PostulerModel.fromJson(data);
  }
}

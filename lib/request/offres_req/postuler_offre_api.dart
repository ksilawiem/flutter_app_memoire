import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/Postuler_offre_Model.dart';

class PostulerAPI extends ApiManager {
  String userId = "";
  String offreId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/postuler/user/$userId/offre/$offreId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return Postuler_Model.fromJson(data);
  }
}

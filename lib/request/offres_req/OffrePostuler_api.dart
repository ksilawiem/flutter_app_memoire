import 'package:app_flutter_memoir/api_models/Offre_Models/OffrePostulerModel.dart';
import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';

class OffrePostulerAPI extends ApiManager {
  String userId = "";

  @override
  String apiUrl() {
    return "http://192.168.1.112:8000/api/postuler/user/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return OffrePostulerModel.fromJson(data);
  }
}

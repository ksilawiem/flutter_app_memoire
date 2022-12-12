import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';

class OffreAPI extends ApiManager {
  // String userId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/auth/offres";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return OffreModel.fromJson(data);
  }
}

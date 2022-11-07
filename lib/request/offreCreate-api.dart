import 'package:app_flutter_memoir/api_models/offreCreate_model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';

class OffreCreateAPI extends ApiManager {
  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/add-offre/user/35";
  }

  @override
  @override
  AbstractJsonResource fromJson(data) {
    return OffreCreateModel.fromJson(data);
  }
}

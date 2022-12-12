import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/Add_offre_Model.dart';

class Add_OffreAPI extends ApiManager {
  String userId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/add-offre/user/34";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return Add_OffreModel.fromJson(data);
  }
}

import 'package:app_flutter_memoir/api_models/Offre_Models/AddOffreAnswer_Model.dart';
import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/DeleteOffre_Model.dart';

class DeletOffreAPI extends ApiManager {
  String offreId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/offre/$offreId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return DeletOffre_Model.fromJson(data);
  }
}

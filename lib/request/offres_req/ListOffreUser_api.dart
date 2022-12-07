import 'package:app_flutter_memoir/api_models/Profil_Models/informationCandidat_Model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/ListOffreUser_Model.dart';
import '../../api_models/Offre_Models/OffrePostulerModel.dart';
import '../../api_models/Profil_Models/Mescandidature_Model.dart';

class ListOffreUserAPI extends ApiManager {
  String userId = "";
  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/offre/user/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return ListOffreUser_Model.fromJson(data);
  }
}

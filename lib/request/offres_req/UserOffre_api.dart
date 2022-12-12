import 'package:app_flutter_memoir/api_models/Offre_Models/UserOffre_model.dart';
import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/PostulerAnswer_offre_Model.dart';
import '../../api_models/Offre_Models/Postuler_offre_Model.dart';
import '../../api_models/Offre_Models/QuestionOffre_Model.dart';

class UserOffreAPI extends ApiManager {
  String offreId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/postuler/offre/$offreId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return UserOffre_Model.fromJson(data);
  }
}

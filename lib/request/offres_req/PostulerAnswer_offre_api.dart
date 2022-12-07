import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/PostulerAnswer_offre_Model.dart';
import '../../api_models/Offre_Models/Postuler_offre_Model.dart';

class PostulerAnswerAPI extends ApiManager {
  String answerId = "";
  String offreId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/postuler/$offreId/answer/$answerId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return PostulerAnswer_Model.fromJson(data);
  }
}

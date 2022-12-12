import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/PostulerAnswer_offre_Model.dart';
import '../../api_models/Offre_Models/Postuler_offre_Model.dart';
import '../../api_models/Offre_Models/QuestionOffre_Model.dart';

class QuestionOfrreAPI extends ApiManager {
  String questionId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/offre-question/$questionId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return QuestionOffre_Model.fromJson(data);
  }
}

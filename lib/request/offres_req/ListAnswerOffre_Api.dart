import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/ListAnswerOffre_Model.dart';
import '../../api_models/Offre_Models/listOffreQuestion_Model.dart';

class ListAnswereAPI extends ApiManager {
  String offreId = "";
  String questionId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/offre-answer/offre/$offreId/question/$questionId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return ListAnswerOffre_Model.fromJson(data);
  }
}

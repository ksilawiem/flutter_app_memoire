import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/listOffreQuestion_Model.dart';

class ListQuesAPI extends ApiManager {
  String offreId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/offre-question/offre/$offreId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return ListQuestionOffre_Model.fromJson(data);
  }
}

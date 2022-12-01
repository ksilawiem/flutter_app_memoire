import 'package:app_flutter_memoir/api_models/Offre_Models/AddOffreAnswer_Model.dart';
import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/Add_offre_Model.dart';

class Add_OffreAnswerAPI extends ApiManager {
  String offreId = "";
  String questionId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.105:8000/api/offre-answer/offre/$offreId/question/$questionId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return AddOffreAnswerModel.fromJson(data);
  }
}

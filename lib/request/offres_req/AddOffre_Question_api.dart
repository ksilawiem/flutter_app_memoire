import 'package:app_flutter_memoir/api_models/Offre_Models/AddOffreQuestion_Model.dart';
import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api/api_manager.dart';
import '../../api_models/Offre_Models/Add_offre_Model.dart';

class Add_OffreQuestion_API extends ApiManager {
  String offreId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.105:8000/api/offre-question/$offreId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return AddOffreQuestionModel.fromJson(data);
  }
}

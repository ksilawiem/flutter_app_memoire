import 'package:app_flutter_memoir/api_models/Offre_Models/OffrePostulerModel.dart';
import 'package:app_flutter_memoir/api_models/Test_Models/Liste_TestC_Model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';
import '../api_models/Profil_Models/verifEmail_Model.dart';
import '../api_models/Test_Models/TestModel.dart';

class VerifEmailAPI extends ApiManager {
  String userId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/sendMail/users/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return VerifEmail_Model.fromJson(data);
  }
}

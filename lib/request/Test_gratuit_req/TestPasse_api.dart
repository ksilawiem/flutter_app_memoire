import 'package:app_flutter_memoir/api_models/Profil_Models/informationCandidat_Model.dart';
import 'package:app_flutter_memoir/api_models/Profil_Models/information_Recuteur_Model.dart';
import 'package:app_flutter_memoir/api_models/Test_Models/TestPasse_Model.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';

class TestPasseAPI extends ApiManager {
  String userId = "";
  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/take-test/user/$userId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return TestPasse_Model.fromJson(data);
  }
}

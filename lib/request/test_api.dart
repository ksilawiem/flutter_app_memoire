import 'package:app_flutter_memoir/api_models/Offre_Models/OffrePostulerModel.dart';
import 'package:app_flutter_memoir/api_models/Test_Models/Liste_TestC_Model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';
import '../api_models/Test_Models/TestModel.dart';

class TestAPI extends ApiManager {
  String TestId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/test/$TestId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return Test_Model.fromJson(data);
  }
}

import 'package:app_flutter_memoir/api_models/Offre_Models/OffrePostulerModel.dart';
import 'package:app_flutter_memoir/api_models/Test_Models/Test_Model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';

class TestCatAPI extends ApiManager {
  String categorieId = "";

  @override
  String apiUrl() {
    return "http://192.168.1.112:8000/api/test/categorie/$categorieId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return TestsModel.fromJson(data);
  }
}

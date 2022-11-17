import 'package:app_flutter_memoir/api_models/Offre_Models/OffrePostulerModel.dart';
import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';
import 'package:app_flutter_memoir/api_models/Test_Models/Quiz_questionModel.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';

class Quiz_questionAPI extends ApiManager {
  String testId = "";

  @override
  String apiUrl() {
    return "http://192.168.1.112:8000/api/quiz-question/test/$testId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return Quiz_questionModel.fromJson(data);
  }
}

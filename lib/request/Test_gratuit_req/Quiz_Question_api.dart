import 'package:app_flutter_memoir/api_models/Test_Models/Quiz_questionModel.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';

class Quiz_QuestionAPI extends ApiManager {
  String questionId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/quiz-question/13";
    // $questionId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return Quiz_questionModel.fromJson(data);
  }
}

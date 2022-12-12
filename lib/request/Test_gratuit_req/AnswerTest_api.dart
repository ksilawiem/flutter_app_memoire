import 'package:app_flutter_memoir/api_models/Offre_Models/OffrePostulerModel.dart';
import 'package:app_flutter_memoir/api_models/Offre_Models/offre_model.dart';
import 'package:app_flutter_memoir/api_models/Test_Models/Quiz_questionModel.dart';

import '../../api/abstract_json_resource.dart';
import '../../api/api_manager.dart';
import '../../api_models/Test_Models/AnswerTest_Model.dart';
import '../../api_models/Test_Models/QuestionTest_Model.dart';
import '../../api_models/Test_Models/quiz-answer_Model.dart';

class AnswerTestAPI extends ApiManager {
  String testId = "";
  String questionId = "";

  @override
  String apiUrl() {
    return "http://192.168.0.113:8000/api/quiz-answer/test/$testId/question/$questionId";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return AnswerTest_Model.fromJson(data);
  }
}

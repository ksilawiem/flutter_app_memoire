import 'package:app_flutter_memoir/api_models/Categorie_Model.dart';

import '../api/abstract_json_resource.dart';
import '../api/api_manager.dart';

class CategorieAPI extends ApiManager {
  String userId = "";
  @override
  String apiUrl() {
    return "http://192.168.0.102:8000/api/categories";
  }

  @override
  AbstractJsonResource fromJson(data) {
    return CategoriesModel.fromJson(data);
  }
}

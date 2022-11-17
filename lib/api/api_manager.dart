import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:app_flutter_memoir/api/dio_singleton.dart';

import '../save/save.dart';
import 'abstract_json_resource.dart';

abstract class ApiManager {
  final DioSingleton dioSingleton = DioSingleton();
  //final _storge= a.Get.find<SecureStorage>();
  /// Returns the API URL of current API ressource
  String apiUrl();

  AbstractJsonResource fromJson(data);

  Future<AbstractJsonResource?> getData({data}) async {
    AbstractJsonResource? json;
    String? token = SecureStorage.readSecureData(SecureStorage.Token);
    Options options = Options(
      headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json',
        "authorization": "Bearer ${token}"
      },
    );
    var data;
    await dioSingleton.dio
        .get(apiUrl(), queryParameters: data, options: options)
        .then((value) {
      //  if (value.data["Status"] == false) {
      //   Get.snackbar("Error", "${value.data["ErrorMessage"]}");
      // } else {

      //   }
      print(value);
      data = value.data;
      json = fromJson(data);
    });

    return json;
  }

  /// POST DATA TO SERVER
  Future<AbstractJsonResource?> post(Map dataToPost) async {
    AbstractJsonResource? jsonList;
    var data;
    String? token = SecureStorage.readSecureData(SecureStorage.Token);
    Options options = Options(
      headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json',
        "authorization": "Bearer ${token}"
      },
    );
    print(dataToPost);
    await dioSingleton.dio
        .post(apiUrl(), data: dataToPost, options: options
            // Options(
            //     followRedirects: false,
            //     validateStatus: (status) {
            //       return status < 500;
            //     }),
            )
        .then((value) {
      print(value.data);
      data = value.data;
      jsonList = fromJson(data);
    });
    return jsonList;
  }

  Future<AbstractJsonResource?> postFile(formData) async {
    AbstractJsonResource? jsonList;
    var data;

    Options options = Options(
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    );

    await dioSingleton.dio
        .post(apiUrl(), data: formData, options: options
            // Options(
            //     followRedirects: false,
            //     validateStatus: (status) {
            //       return status < 500;
            //     }),
            )
        .then((value) {
      print(value.data);
      data = value.data;
      jsonList = fromJson(data);
    });
    return jsonList;
  }
//

}

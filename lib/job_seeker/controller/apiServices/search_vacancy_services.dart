import 'dart:developer';

import 'package:cleverhire/core/api/api_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SearchJobVacancy {
  Dio dio = Dio();
  Future searchedVacancy(String searchQuery) async {
    FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();
    String? token = await flutterSecureStorage.read(key: "access_token");
    String? newToken = token!.replaceAll('"', '');
    try {
      String path =
          "${ApiConfig.baseUrl}${ApiConfig.createVacancy}?position=$searchQuery";
      Response response = await dio.get(path,
          options: Options(headers: {"authorization": "Bearer $newToken"}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("getting searched data");
      }
    } on DioError catch (e) {
      log(e.message.toString());
    }
  }
}

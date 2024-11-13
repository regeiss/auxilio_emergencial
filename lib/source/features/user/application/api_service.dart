import 'package:dio/dio.dart';
import 'package:gtk_flutter/source/features/responsavel/application/geolocator.dart';
import 'package:gtk_flutter/source/features/user/domain/user.dart';
import 'dart:developer';
import 'package:gtk_flutter/source/utils/logging.dart';

class UserApiService {
  static double lat = 0.0;
  static double lon = 0.0;

  Future<List<User>> getUser() async {
    try {
      var response =
          await Dio(options).get('https://jsonplaceholder.typicode.com/users');
      var users = (response.data as List);

      List<User> allUser = users
          .map((responsaveisData) => User.fromJson(responsaveisData))
          .toList();

      if (response.statusCode == 200) {
        return allUser;
      }
      return [];
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        // log(e.response.statusMessage);
        log('${e.response?.statusMessage}');
        log('${e.response?.statusCode}');
      } else {
        printWarning('Failed to load data: ${e.response?.statusMessage}');
        throw Exception('Failed to load data');
      }
    }
    return [];
  }

  final options = BaseOptions(
    //baseUrl: '',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  );
}

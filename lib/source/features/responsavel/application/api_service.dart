import 'package:dio/dio.dart';
import 'package:gtk_flutter/source/features/responsavel/application/geolocator.dart';
import 'package:gtk_flutter/source/features/responsavel/domain/responsavel.dart';
import 'dart:developer';
import 'package:gtk_flutter/source/utils/logging.dart';

class ApiService {
  static double lat = 0.0;
  static double lon = 0.0;

  Future<List<Responsavel>> getResponsavel() async {
    try {
      final location = await getLocation();
      lat = location.latitude;
      lon = location.longitude;

      //String baseUrl = 'http://apireconstrucao.novohamburgo.rs.gov.br/api/buscar_responsaveis';
      var response = await Dio(options).get('http://apireconstrucao.novohamburgo.rs.gov.br/api/buscar_responsaveis');
      var responsaveis = (response.data as List);

      List<Responsavel> allUser = responsaveis.map((responsaveisData) => Responsavel.fromJson(responsaveisData)).toList();

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
    //baseUrl: 'https://api.pub.dev',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  );
}

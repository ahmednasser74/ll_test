import 'package:dio/dio.dart';
import 'package:ll_test/core/utils/constant.dart';

class DioHelper {
  Dio dio = Dio();
  static const String baseUrl = 'https://api.themoviedb.org/3/';

  Future<Response> postData({
    required String path,
    Map<String, dynamic>? data,
    Map<String, String>? header,
  }) async {
    final request = await dio.post(
      '$baseUrl$path',
      data: data,
      queryParameters: {
        'api_key': Constant.apiKey,
      },
    );
    return request;
  }

  Future<Response> getData({
    required String path,
    Map<String, String>? queryParameters,
  }) async {
    final response = await dio.get(
      '$baseUrl$path',
      queryParameters:
          queryParameters ?? {'api_key': '31521ab741626851b73c684539c33b5a'},
    );
    return response;
  }
}

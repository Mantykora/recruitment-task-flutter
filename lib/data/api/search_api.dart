import 'package:company_insight_app/data/dio_client.dart';
import 'package:company_insight_app/data/models/company.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchApi {
  final Dio _dio;

  SearchApi(DioClient dioClient) : _dio = dioClient.dio;

  Future<List<Company>> search(String query) async {
    try {
      final response = await _dio.get('/profile/$query');
      if (response.data is List && response.data.isNotEmpty) {
        return (response.data as List).map((item) => Company.fromJson(item)).toList();
      } else {
        throw Exception('Company not found');
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          throw Exception('Company not found');
        } else {
          throw Exception('An error occurred while searching for the company');
        }
      }

      rethrow;
    }
  }
}

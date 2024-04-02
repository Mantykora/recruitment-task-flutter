import 'package:company_insight_app/data/api/search_api.dart';
import 'package:company_insight_app/data/models/company.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchRepository {
  final SearchApi _searchApi;

  SearchRepository(SearchApi searchApi) : _searchApi = searchApi;

  Future<Company> searchCompanies(String query) async {
    final companies = await _searchApi.search(query);
    return companies.first;
  }
}


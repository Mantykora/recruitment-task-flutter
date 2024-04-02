import 'package:hive/hive.dart';
import 'package:company_insight_app/data/models/company.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoritesRepository {
  final Box<Company> _favoritesBox = Hive.box<Company>('favorites');

  Future<void> addFavorite(Company company) async {
    await _favoritesBox.put(company.symbol, company);
  }

  Future<void> removeFavorite(Company company) async {
    await _favoritesBox.delete(company.symbol);
  }

  List<Company> readFavorites() {
    return _favoritesBox.values.toList();
  }
}

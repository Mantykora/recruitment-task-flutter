import 'package:company_insight_app/data/models/company.dart';
import 'package:company_insight_app/data/repositories/favorites_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';



class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository _favoritesRepository;

  FavoritesCubit(this._favoritesRepository) : super(const FavoritesState.initial()) {
    loadFavorites();
  }

  Future<void> addFavorite(Company company) async {
    await _favoritesRepository.addFavorite(company);
    List<Company> newFavorites = _favoritesRepository.readFavorites();
    emit(FavoritesState.favorites(newFavorites));
  }

  Future<void> removeFavorite(Company company) async {
    await _favoritesRepository.removeFavorite(company);
    List<Company> newFavorites = _favoritesRepository.readFavorites();
    emit(FavoritesState.favorites(newFavorites));
  }

  Future<void> toggleFavorites(Company company) async {
    if (_favoritesRepository.readFavorites().contains(company)) {
      await _favoritesRepository.removeFavorite(company);
    } else {
      await _favoritesRepository.addFavorite(company);
    }
    List<Company> newFavorites = _favoritesRepository.readFavorites();
    emit(FavoritesState.favorites(newFavorites));
  }

  Stream<bool> isFavorite(Company company) async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1)); // delay to prevent high CPU usage
      yield _favoritesRepository.readFavorites().contains(company);
    }
  }

  void loadFavorites() {
    List<Company> newFavorites = _favoritesRepository.readFavorites();
    if (newFavorites.isEmpty) {
      emit(const FavoritesState.initial());
    } else {
      emit(FavoritesState.favorites(newFavorites));
    }
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:company_insight_app/data/models/company.dart';
import 'package:company_insight_app/data/repositories/search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(SearchRepository searchRepository) :
    _searchRepository = searchRepository,
        super(const SearchState.initial());

  final SearchRepository _searchRepository;

  void search(String query) async {
    emit(const SearchState.loading());
    try {
      final result = await _searchRepository.searchCompanies(query);

      emit(SearchState.loaded(result));
    } catch (e) {
      emit(SearchState.error(e.toString()));
    }
  }
}


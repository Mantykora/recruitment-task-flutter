part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;

  const factory SearchState.loading() = _Loading;

  const factory SearchState.loaded(Company result) = _Loaded;

  const factory SearchState.error(String error) = _Error;
}

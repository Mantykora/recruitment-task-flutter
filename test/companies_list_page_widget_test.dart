import 'package:company_insight_app/data/dio_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:company_insight_app/ui/companies/companies_list_page.dart';
import 'package:provider/provider.dart';
import 'package:company_insight_app/bloc/favorites/favorites_cubit.dart';
import 'package:company_insight_app/bloc/search/search_cubit.dart';
import 'package:company_insight_app/data/repositories/favorites_repository.dart';
import 'package:company_insight_app/data/repositories/search_repository.dart';
import 'package:company_insight_app/data/api/search_api.dart';
import 'package:get_it/get_it.dart';

void main() {
  testWidgets('CompaniesListPage widget should show CompaniesListPageBody', (WidgetTester tester) async {
    // Register the dependencies
    GetIt.instance.registerSingleton<FavoritesRepository>(FavoritesRepository());
    GetIt.instance.registerSingleton<SearchApi>(SearchApi(GetIt.instance<DioClient>()));
    GetIt.instance.registerSingleton<SearchRepository>(SearchRepository(GetIt.instance<SearchApi>()));

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<SearchCubit>(
            create: (context) => SearchCubit(GetIt.instance<SearchRepository>()),
          ),
          Provider<FavoritesCubit>(
            create: (context) => FavoritesCubit(GetIt.instance<FavoritesRepository>()),
          ),
        ],
        child: MaterialApp(
          home: CompaniesListPage(),
        ),
      ),
    );

    // Verify that CompaniesListPageBody is shown
    expect(find.byType(CompaniesListPageBody), findsOneWidget);


  });
}

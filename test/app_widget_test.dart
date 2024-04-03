import 'package:company_insight_app/data/api/search_api.dart';
import 'package:company_insight_app/data/dio_client.dart';
import 'package:company_insight_app/data/models/company.dart';
import 'package:company_insight_app/ui/companies/company_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:company_insight_app/app.dart';
import 'package:company_insight_app/ui/companies/companies_list_page.dart';
import 'package:provider/provider.dart';
import 'package:company_insight_app/bloc/favorites/favorites_cubit.dart';
import 'package:company_insight_app/bloc/search/search_cubit.dart';
import 'package:company_insight_app/data/repositories/favorites_repository.dart';
import 'package:company_insight_app/data/repositories/search_repository.dart';
import 'package:get_it/get_it.dart';

void main() {
  testWidgets('App widget should show company preview when a valid symbol is entered', (
      WidgetTester tester) async {
    // Register the dependencies
    GetIt.instance.registerSingleton<FavoritesRepository>(FavoritesRepository());
    GetIt.instance.registerSingleton<SearchApi>(SearchApi(GetIt.instance<DioClient>()));
    GetIt.instance.registerSingleton<SearchRepository>(
        SearchRepository(GetIt.instance<SearchApi>()));

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
        child: const MaterialApp(
          home: App(),
        ),
      ),
    );

    // Simulate entering a valid company symbol
    await tester.enterText(find.byType(TextField), 'AAPL');
    await tester.pump();

    var company =  Company(
      symbol: "AAPL",
      price: 178.72,
      beta: 1.286802,
      volAvg: 58405568,
      mktCap: 2794144143933,
      lastDiv: 0.96,
      range: "124.17-198.23",
      changes: -0.13,
      companyName: "Apple Inc.",
      currency: "USD",
      cik: "0000320193",
      isin: "US0378331005",
      cusip: "037833100",
      exchange: "NASDAQ Global Select",
      exchangeShortName: "NASDAQ",
      industry: "Consumer Electronics",
      website: "https://www.apple.com",
      description: "Apple Inc. designs, manufactures, and markets smartphones, personal computers, tablets, wearables, and accessories worldwide. It also sells various related services.",
      ceo: "Mr. Timothy D. Cook",
      sector: "Technology",
      country: "US",
      fullTimeEmployees: "164000",
      phone: "408 996 1010",
      address: "One Apple Park Way",
      city: "Cupertino",
      state: "CA",
      zip: "95014",
      dcfDiff: 4.15176,
      dcf: 150.082,
      image: "https://financialmodelingprep.com/image-stock/AAPL.png",
      ipoDate: DateTime(1980, 12, 12),
      defaultImage: false,
      isEtf: false,
      isActivelyTrading: true,
      isAdr: false,
      isFund: false,
    );

    // Verify that company preview is shown
    expect(find.byWidgetPredicate(
        (Widget widget) => widget is CompanyInfo && widget.isPreview && widget.company == company,
    ), findsOneWidget);
  });

  testWidgets('App widget should show error message when an invalid symbol is entered', (
      WidgetTester tester) async {
    // Register the dependencies
    GetIt.instance.registerSingleton<FavoritesRepository>(FavoritesRepository());
    GetIt.instance.registerSingleton<SearchApi>(SearchApi(GetIt.instance<DioClient>()));
    GetIt.instance.registerSingleton<SearchRepository>(
        SearchRepository(GetIt.instance<SearchApi>()));

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
        child: const MaterialApp(
          home: App(),
        ),
      ),
    );

    // Simulate entering an invalid company symbol
    await tester.enterText(find.byType(TextField), 'INVALID');
    await tester.pump();

    // Verify that error message is shown
    expect(find.text('Company profile could not be found'), findsOneWidget);
  });
}

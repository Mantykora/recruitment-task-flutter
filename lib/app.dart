import 'package:company_insight_app/bloc/favorites/favorites_cubit.dart';
import 'package:company_insight_app/bloc/search/search_cubit.dart';
import 'package:company_insight_app/data/repositories/favorites_repository.dart';
import 'package:company_insight_app/data/repositories/search_repository.dart';
import 'package:company_insight_app/ui/companies/companies_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(
            GetIt.instance<SearchRepository>(),
          ),
        ),
        BlocProvider<FavoritesCubit>(
          create: (context) => FavoritesCubit(GetIt.instance<FavoritesRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Company Insight App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CompaniesListPage(),
      ),
    );
  }
}

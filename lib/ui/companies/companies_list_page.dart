import 'package:company_insight_app/bloc/favorites/favorites_cubit.dart';
import 'package:company_insight_app/bloc/search/search_cubit.dart';
import 'package:company_insight_app/data/models/company.dart';
import 'package:company_insight_app/ui/companies/companies_empty_view.dart';
import 'package:company_insight_app/ui/companies/companies_list.dart';
import 'package:company_insight_app/ui/companies/company_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesListPage extends StatelessWidget {
  const CompaniesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
      ),
      body: const CompaniesListPageBody(),
    );
  }
}

class CompaniesListPageBody extends StatelessWidget {
  const CompaniesListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onSubmitted: (value) {
                  BlocProvider.of<SearchCubit>(context).search(value);
                },
              ),
              Expanded(
                child: state.when(
                  initial: () => _buildInitialView(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (company) => CompanyInfo(company: company, isPreview: true),
                  error: (error) => CompaniesEmptyView(title: error, icon: Icons.search_off),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildInitialView() {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return state.when(
          initial: () => const CompaniesEmptyView(
            title: 'Search for companies',
            icon: Icons.store,
          ),
          favorites: (List<Company> favorites) => CompaniesList(
            companiesList: favorites,
          ),
        );
      },
    );
  }
}

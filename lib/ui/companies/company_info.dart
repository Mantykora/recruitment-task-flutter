import 'package:company_insight_app/bloc/favorites/favorites_cubit.dart';
import 'package:company_insight_app/data/models/company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyInfo extends StatelessWidget {
  final Company company;
  final bool isPreview;

  const CompanyInfo({Key? key, required this.company, required this.isPreview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Company Name'),
                    subtitle: Text(company.companyName),
                  ),
                  ListTile(
                    title: const Text('Company Symbol'),
                    subtitle: Text(company.symbol),
                  ),
                  ListTile(
                    title: const Text('Company Price'),
                    subtitle: Text('${company.price}'),
                  ),
                  ListTile(
                    title: const Text('Company Beta'),
                    subtitle: Text('${company.beta}'),
                  ),
                  ListTile(
                    title: const Text('Company Volume Average'),
                    subtitle: Text('${company.volAvg}'),
                  ),
                  ListTile(
                    title: const Text('Company Market Cap'),
                    subtitle: Text('${company.mktCap}'),
                  ),
                  ListTile(
                    title: const Text('Company Last Dividend'),
                    subtitle: Text('${company.lastDiv}'),
                  ),
                  ListTile(
                    title: const Text('Company Range'),
                    subtitle: Text(company.range),
                  ),
                  ListTile(
                    title: const Text('Company Changes'),
                    subtitle: Text('${company.changes}'),
                  ),
                  ListTile(
                    title: const Text('Company Currency'),
                    subtitle: Text(company.currency),
                  ),
                  ListTile(
                    title: const Text('Company CIK'),
                    subtitle: Text(company.cik),
                  ),
                  if (!isPreview) ...[
                    ListTile(
                      title: const Text('Company ISIN'),
                      subtitle: Text(company.isin),
                    ),
                    ListTile(
                      title: const Text('Company CUSIP'),
                      subtitle: Text(company.cusip),
                    ),
                    ListTile(
                      title: const Text('Company Exchange'),
                      subtitle: Text(company.exchange),
                    ),
                    ListTile(
                      title: const Text('Company Exchange Short Name'),
                      subtitle: Text(company.exchangeShortName),
                    ),
                    ListTile(
                      title: const Text('Company Industry'),
                      subtitle: Text(company.industry),
                    ),
                    ListTile(
                      title: const Text('Company Website'),
                      subtitle: Text(company.website),
                    ),
                    ListTile(
                      title: const Text('Company Description'),
                      subtitle: Text(company.description),
                    ),
                    ListTile(
                      title: const Text('Company CEO'),
                      subtitle: Text(company.ceo),
                    ),
                    ListTile(
                      title: const Text('Company Sector'),
                      subtitle: Text(company.sector),
                    ),
                    ListTile(
                      title: const Text('Company Country'),
                      subtitle: Text(company.country),
                    ),
                    ListTile(
                      title: const Text('Company Full Time Employees'),
                      subtitle: Text(company.fullTimeEmployees),
                    ),
                    ListTile(
                      title: const Text('Company Phone'),
                      subtitle: Text(company.phone),
                    ),
                    ListTile(
                      title: const Text('Company Address'),
                      subtitle: Text(company.address),
                    ),
                    ListTile(
                      title: const Text('Company City'),
                      subtitle: Text(company.city),
                    ),
                    ListTile(
                      title: const Text('Company State'),
                      subtitle: Text(company.state),
                    ),
                    ListTile(
                      title: const Text('Company ZIP'),
                      subtitle: Text(company.zip),
                    ),
                    ListTile(
                      title: const Text('Company DCF Diff'),
                      subtitle: Text('${company.dcfDiff}'),
                    ),
                    ListTile(
                      title: const Text('Company DCF'),
                      subtitle: Text('${company.dcf}'),
                    ),
                    ListTile(
                      title: const Text('Company Image'),
                      subtitle: Image.network(company.image),
                    ),
                    ListTile(
                      title: const Text('Company IPO Date'),
                      subtitle: Text('${company.ipoDate}'),
                    ),
                    ListTile(
                      title: const Text('Company Default Image'),
                      subtitle: Text(company.defaultImage ? 'Yes' : 'No'),
                    ),
                    ListTile(
                      title: const Text('Company Is ETF'),
                      subtitle: Text(company.isEtf ? 'Yes' : 'No'),
                    ),
                    ListTile(
                      title: const Text('Company Is Actively Trading'),
                      subtitle: Text(company.isActivelyTrading ? 'Yes' : 'No'),
                    ),
                    ListTile(
                      title: const Text('Company Is ADR'),
                      subtitle: Text(company.isAdr ? 'Yes' : 'No'),
                    ),
                    ListTile(
                      title: const Text('Company Is Fund'),
                      subtitle: Text(company.isFund ? 'Yes' : 'No'),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: StreamBuilder<bool>(
                stream: BlocProvider.of<FavoritesCubit>(context).isFavorite(company),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data == true) {
                    return const Icon(Icons.favorite, color: Colors.red);
                  } else {
                    return const Icon(Icons.favorite_border_outlined, color: Colors.red);
                  }
                },
              ),
              onPressed: () => BlocProvider.of<FavoritesCubit>(context).toggleFavorites(company),
            ),
          ),
        ),
      ],
    );
  }
}

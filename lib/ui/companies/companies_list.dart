import 'package:company_insight_app/data/models/company.dart';
import 'package:company_insight_app/ui/companies/companies_detail_page.dart';
import 'package:flutter/material.dart';

class CompaniesList extends StatelessWidget {
  final List<Company> companiesList;

  CompaniesList({required this.companiesList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: companiesList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(companiesList[index].companyName[0]),
              ),
              title: Text(companiesList[index].companyName),
              subtitle: Text('\$${companiesList[index].price.toStringAsFixed(2)}'),
              trailing: Icon(Icons.more_vert),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompaniesDetailPage(company: companiesList[index]),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

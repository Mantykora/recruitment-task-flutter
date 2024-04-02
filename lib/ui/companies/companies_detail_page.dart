import 'package:company_insight_app/data/models/company.dart';
import 'package:company_insight_app/ui/companies/company_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompaniesDetailPage extends StatelessWidget {
  final Company company;

  const CompaniesDetailPage({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.companyName),
      ),
      body: CompanyInfo(
        company: company,
        isPreview: false,
      ),
    );
  }
}

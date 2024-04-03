import 'package:company_insight_app/app.dart';
import 'package:company_insight_app/data/models/company.dart';
import 'package:company_insight_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CompanyAdapter());
  await Hive.openBox<Company>('favorites');
  configureDependencies();
  runApp(const App());
}


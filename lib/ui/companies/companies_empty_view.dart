import 'package:flutter/cupertino.dart';

class CompaniesEmptyView extends StatelessWidget {
  const CompaniesEmptyView({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 100),
        Text(title),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import '../core/constants/app_constants.dart';
import 'routes.dart';

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}

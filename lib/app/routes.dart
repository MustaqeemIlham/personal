import 'package:flutter/material.dart';
import '../features/home/portfolio_home_page.dart';
import '../features/personal/personal_site_page.dart';

class AppRoutes {
  static const home = '/';
  static const personal = '/personal';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const PortfolioHomePage(),
    personal: (context) => const PersonalSitePage(),
  };
}

 import 'package:flutter/material.dart';
import 'package:untitled/core/confige/page_route_name.dart';
import 'package:untitled/page/home/pages/home_view.dart';
import 'package:untitled/page/splash/pages/splash_view.dart';

import '../../page/settings/pages/Settings_view.dart';

class Routes{
static Route<dynamic> onGenerateRoutes(RouteSettings settings){
 switch (settings.name){
  case PagesRouteName.initial:
   return MaterialPageRoute(
    builder: (context) => SplashView(),
    settings: settings,
   );
  case PagesRouteName.homeView:
   return MaterialPageRoute(
    builder: (context) => const HomeView(),
    settings: settings,
   );
  case PagesRouteName.settingsView:
   return MaterialPageRoute(
    builder: (context) => const SettingsView(),
    settings: settings,
   );
  default:
   return MaterialPageRoute(
    builder: (context) => const SplashView(),
    settings: settings,
   );

 }
}
 }
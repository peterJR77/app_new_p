import 'package:flutter/material.dart';
import 'package:untitled/core/confige/page_route_name.dart';
import 'package:untitled/core/widget/custem_background_widegt.dart';
import 'package:untitled/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),
    ()=> navigatorKey.currentState!.pushReplacementNamed(PagesRouteName.homeView)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(child: Image.asset("assets/images/logo.png"),
    );
  }
}

import 'package:assignment/controllers/agents_controller.dart';
import 'package:assignment/controllers/homepage_controller.dart';
import 'package:assignment/screen/navigator.dart';
import 'package:assignment/screen/pages/home.dart';
import 'package:assignment/screen/pages/talk_to_astro.dart';
import 'package:assignment/screen/pages/under_development.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AppRoutes {
  static const String appNaviagtor = '/navigator';
  static const String homeRoute = '/home_route';
  static const String talkToAstro = "/talkToAstro";
  static const String underDev = "/underDevelopment";
}

class AppRoutesSettings {
  Route<dynamic> Function(RouteSettings) onGenerateRoute({Widget tabItem}) =>
      (settings) {
        Widget target;
        dynamic argument = settings.arguments;
        switch (settings.name) {
          case AppRoutes.homeRoute:
            target = ChangeNotifierProvider<AgentController>(
              create: (context) => AgentController(),
              child: const TalkToAstro(),
            );
            break;
          case AppRoutes.talkToAstro:
            target = ChangeNotifierProvider<HomePageController>(
              create: (context) => HomePageController(),
              child: const HomePage(),
            );
            break;
          case AppRoutes.appNaviagtor:
            target = const NavigatorPage();
            break;
          case AppRoutes.underDev:
            target = UnderDevelopment(isAppBar: argument,);
            break;
        }
        return MaterialPageRoute(builder: (context) => target);
      };
}

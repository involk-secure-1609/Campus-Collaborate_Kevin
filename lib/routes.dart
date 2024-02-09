
import 'package:campuscollaborate/constants/routing_constants.dart';
import 'package:campuscollaborate/models/project.dart';
import 'package:campuscollaborate/models/user_info.dart';
import 'package:campuscollaborate/screens/bottom_nav_bar_screen.dart';
import 'package:campuscollaborate/screens/create_project_screen.dart';
import 'package:campuscollaborate/screens/home_screen.dart';
import 'package:campuscollaborate/screens/login_screen.dart';
import 'package:campuscollaborate/screens/profile_screen.dart';
import 'package:campuscollaborate/screens/project_screen.dart';
import 'package:campuscollaborate/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case Routes.profileScreen:
      final userInfo = settings.arguments as UserInfo;
      return MaterialPageRoute(
          builder: (context) => ProfileScreen(userInfo: userInfo));
    case Routes.createProjectScreen:
      return MaterialPageRoute(builder: (context)=>const CreateProjectScreen());
    case Routes.projectScreen:
      final project=settings.arguments as Project;
      return MaterialPageRoute(builder: (context)=>ProjectScreen(project: project));
    case Routes.homeScreen:
      final userInfo=settings.arguments as UserInfo;
      return MaterialPageRoute(builder: (context)=>HomeScreen(userInfo: userInfo));
    case Routes.navBarScreen:
      return MaterialPageRoute(builder: (context)=>const NavBarScreen());
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (context)=>const LoginScreen());
    default:
      return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Invalid Screen'),
    );
  }
}

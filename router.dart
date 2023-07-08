import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/features/auth/screens/auth_screen.dart';
import 'package:amazonclone/features/home/screens/home_screens.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=> const AuthScreen(),
      );


    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=> const HomeScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=> const BottomBar(),
      );

    default:
  return MaterialPageRoute(
  settings: routeSettings,
  builder: (_)=> const Scaffold(
    body: Center(
      child: Text('Page Doesnt Exist'),
    ),
  ),
  );
  }
}
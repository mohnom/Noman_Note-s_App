import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'Views/home_view.dart';


abstract class RouterApp {
  static String KEdithnote = '/EdithNote';
  static String Viewnote = '/viewnote';
  static GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        }),
 
   
  ]);
}

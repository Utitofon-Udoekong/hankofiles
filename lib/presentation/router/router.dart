import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  routes: [],
  debugLogDiagnostics: true
);
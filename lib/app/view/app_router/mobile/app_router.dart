import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'package:menu_loyalty/app/view/views/pages.dart';

part 'app_router.g.dart';
part 'routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: '/home',
  navigatorKey: rootNavigatorKey,
  routes: $appRoutes,
  redirect: (BuildContext context, GoRouterState state) async {
    return null;
  },
  onException: (_, GoRouterState state, GoRouter router) {
    router.push(ErrorRoute.path);
  },
);

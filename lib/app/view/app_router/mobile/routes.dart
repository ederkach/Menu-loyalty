part of 'app_router.dart';

@TypedGoRoute<HomeRoute>(
  path: "/home",
  name: "home",
)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return const MainNavBar();
  }
}

@TypedGoRoute<ErrorRoute>(
  path: ErrorRoute.path,
  name: "error",
)
class ErrorRoute extends GoRouteData {
  const ErrorRoute();

  static const path = "/error";

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return ErrorScreen(
      onCantPopNavigationAction: () => const HomeRoute().go(context),
    );
  }
}

@TypedGoRoute<LoadingRoute>(
  path: "/loading",
  name: "loading",
)
class LoadingRoute extends GoRouteData {
  const LoadingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoadingPage();
  }
}

@TypedGoRoute<DishRoute>(
  path: '/dish/:id',
  name: 'dish',
)
class DishRoute extends GoRouteData {
  const DishRoute(
    this.id,
    this.$extra,
  );

  final String id;
  final MenuModel $extra;
  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return DishPage(id: id, menuModel: $extra);
  }
}

@TypedGoRoute<MapNavBarRoute>(
  path: '/map_nav_bar',
  name: 'map_nav_bar',
)
class MapNavBarRoute extends GoRouteData {
  const MapNavBarRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MapNavBar();
  }
}

@TypedGoRoute<MenuPageRoute>(
  path: '/menu',
  name: 'menu',
)
class MenuPageRoute extends GoRouteData {
  const MenuPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MenuPage();
  }
}

@TypedGoRoute<OrdersHistoryPageRoute>(
  path: '/orders_history',
  name: 'orders_history',
)
class OrdersHistoryPageRoute extends GoRouteData {
  const OrdersHistoryPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OrdersHistoryPage();
  }
}

@TypedGoRoute<ProfilePageRoute>(
  path: '/profile',
  name: 'profile',
)
class ProfilePageRoute extends GoRouteData {
  const ProfilePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

@TypedGoRoute<CheckOutPageRoute>(
  path: '/checkout',
  name: 'checkout',
)
class CheckOutPageRoute extends GoRouteData {
  const CheckOutPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CheckOutPage();
  }
}

@TypedGoRoute<CartPageRoute>(
  path: '/cart',
  name: 'cart',
)
class CartPageRoute extends GoRouteData {
  const CartPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CartPage();
  }
}

@TypedGoRoute<ChatsPageRoute>(
  path: '/chats',
  name: 'chats',
)
class ChatsPageRoute extends GoRouteData {
  const ChatsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChatsPage();
  }
}

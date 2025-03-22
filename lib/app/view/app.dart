import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:menu_loyalty/app/core/config/theme/theme.dart';
import 'package:menu_loyalty/app/data/datasources/repositories.dart';
import 'package:menu_loyalty/app/view/app_router/mobile/app_router.dart';
import 'package:menu_loyalty/app/view/blocs/blocs.dart';
import 'package:menu_loyalty/l10n/l10n.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final router = goRouter;
  late final ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = customTheme();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CartRepository>(
          create: (context) => CartRepositoryImpl(),
        ),
        Provider<CategoriesRepository>(
          create: (context) => CategoriesRepositoryImpl(),
        ),
        Provider<CategoriesOfferRepository>(
          create: (context) => CategoriesOfferRepositoryImpl(),
        ),
        Provider<MenuRepository>(
          create: (context) => MenuRepositoryImpl(),
        ),
        MultiBlocProvider(
          providers: [
            BlocProvider<CartBloc>(
              create: (context) => CartBloc(
                cartRepository: context.read<CartRepository>(),
              ),
            ),
            BlocProvider<CategoriesBloc>(
                create: (context) => CategoriesBloc(
                      categoriesRepository:
                          context.read<CategoriesRepository>(),
                    )..add(
                        const FetchCategories(),
                      )),
            BlocProvider<CategoriesOfferBloc>(
                create: (context) => CategoriesOfferBloc(
                      categoriesOfferRepository:
                          context.read<CategoriesOfferRepository>(),
                    )..add(const FetchCategoriesOffer())),
            BlocProvider<MainMenuBloc>(
                create: (context) => MainMenuBloc(
                      menuRepository: context.read<MenuRepository>(),
                    )..add(const FetchMainMenu())),
            BlocProvider<MenuOfferBloc>(
                create: (context) => MenuOfferBloc(
                      menuRepository: context.read<MenuRepository>(),
                    )..add(const FetchMenu())),
          ],
          child: MaterialApp.router(
            theme: customTheme(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: router,
          ),
        ),
      ],
    );
  }
}

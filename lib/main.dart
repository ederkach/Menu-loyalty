import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/config/app_router.dart';
import 'src/config/theme/theme.dart';

import 'src/data/datasources/repositories.dart';
import 'src/presentation/blocs/blocs.dart';
import 'src/presentation/views/pages.dart';
import 'locator_service.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CartBloc(cartRepository: CartRepository())
              ..add(const StartedCart())),
        BlocProvider(
            create: (_) =>
                CategoriesBloc(categoriesRepository: CategoriesRepository())
                  ..add(const FetchCategories())),
        BlocProvider(
            create: (_) => CategoriesOfferBloc(
                categoriesOfferRepository: CategoriesOfferRepository())
              ..add(const FetchCategoriesOffer())),
        BlocProvider(
            create: (_) => MenuOfferBloc(
                  menuRepository: MenuRepository(),
                )..add(const FetchMenu())),
        BlocProvider(
            create: (_) => MainMenuBloc(
                  menuRepository: MenuRepository(),
                )..add(const FetchMainMenu())),
      ],
      child: MaterialApp(
        title: 'PORIS FOOD APP',
        theme: customTheme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: MainNavBar.routeName,
      ),
    );
  }
}

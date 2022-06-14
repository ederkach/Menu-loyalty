import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/config/app_router.dart';
import 'src/config/theme/theme.dart';

import 'src/data/datasources/remote/repositories/repositories.dart';
import 'src/presentation/blocs/blocs.dart';
import 'src/presentation/views/pages.dart';
import 'injector.dart' as di;

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
            create: (_) => CategoriesOfferBloc(CategoriesOfferRepository())
              ..add(const FetchCategoriesOffer())),
        BlocProvider(
            create: (_) => MenuOfferBloc(
                  menuRepository: MenuRepository(),
                )..add(const FetchMenu())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'PORIS FOOD APP',
            theme: customTheme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: MainNavBar.routeName,
          );
        },
      ),
    );
  }
}

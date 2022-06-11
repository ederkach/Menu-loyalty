import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/config/app_router.dart';
import 'src/config/theme/theme.dart';
import 'src/data/repositories/categories_offer/categories_offer_repository.dart';
import 'src/presentation/blocs/categories_offer_bloc/bloc/blocs.dart';
import 'src/presentation/views/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) =>
                      CategoriesofferBloc(CategoriesOfferRepository())
                        ..add(const Started())),
            ],
            child: MaterialApp(
              title: 'PORIS FOOD APP',
              theme: customTheme(),
              onGenerateRoute: AppRouter.onGenerateRoute,
              initialRoute: MainNavBar.routeName,
            ),
          );
        });
  }
}

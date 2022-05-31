import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/config/app_router.dart';
import 'src/injector.dart' as di;
import 'src/config/theme/theme.dart';
import 'src/presentation/views/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'PORIS FOOD APP',
            theme: customTheme(),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: MainNavBar.routeName,
          );
        });
  }
}

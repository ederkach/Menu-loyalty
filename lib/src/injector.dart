import 'package:get_it/get_it.dart';

import 'config/theme/colors.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => DesignData());
}

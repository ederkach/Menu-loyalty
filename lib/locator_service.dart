import 'package:get_it/get_it.dart';

import 'src/config/theme/design_data.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerFactory<DesignData>(() => DesignData());
}

import 'package:get_it/get_it.dart';

import 'src/data/repositories/categories_offer/categories_offer_repository.dart';
import 'src/data/repositories/menu/menu_repository.dart';
import 'src/presentation/blocs/blocs.dart';

Future<void> setup() async {
  final getIt = GetIt.instance;

  getIt.registerFactory<CategoriesOfferRepository>(
      () => CategoriesOfferRepository());
  getIt.registerFactory<MenuRepository>(() => MenuRepository());

  getIt.registerFactory<CategoriesofferBloc>(
      () => CategoriesofferBloc(GetIt.I.get<CategoriesOfferRepository>()));
  getIt.registerFactory<MenuBloc>(() => MenuBloc(
        menuRepository: GetIt.I.get<MenuRepository>(),
        categoriesOfferBloc: GetIt.I.get<CategoriesofferBloc>(),
      ));
}

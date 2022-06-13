import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../models/menu_model/menu_model.dart';

abstract class BaseMenuRepository {
  Future<Either<ServerException, List<MenuModel>>> getMenu();
}

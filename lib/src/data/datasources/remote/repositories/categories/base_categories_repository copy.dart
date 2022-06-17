import 'package:dartz/dartz.dart';

import '../../../../../core/error/exception.dart';
import '../../../../models/categories_model/categories_model.dart';

abstract class BaseCategoriesRepository {
  Future<Either<ServerException, List<Categories>>> getCategory();
}

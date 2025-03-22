import 'package:dartz/dartz.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

abstract class CategoriesRepository {
  Future<Either<ServerException, List<Categories>>> getCategory();
}

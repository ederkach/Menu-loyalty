import 'package:dartz/dartz.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

abstract class CategoriesOfferRepository {
  Future<Either<ServerException, List<CategoriesOffer>>> getCategoryOffer();
}

import 'package:dartz/dartz.dart';

import '../../../../../core/error/exception.dart';
import '../../../../models/categories_offer_model/categories_offer_model.dart';

abstract class BaseCategoriesOfferRepository {
  Future<Either<ServerException, List<CategoriesOffer>>> getCategoryOffer();
}

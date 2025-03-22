import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

import 'categories_offer_repository.dart';

class CategoriesOfferRepositoryImpl extends CategoriesOfferRepository {
  final FirebaseFirestore _firebaseFirestore;
  late List<CategoriesOffer> repositoryCategoriesOffer;

  CategoriesOfferRepositoryImpl({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Either<ServerException, List<CategoriesOffer>>>
      getCategoryOffer() async {
    try {
      final repositoryCategoriesOffer = await _firebaseFirestore
          .collection('Categories offer')
          .orderBy('rank')
          .withConverter<CategoriesOffer>(
              fromFirestore: (snapshot, _) =>
                  CategoriesOffer.fromDocument(snapshot),
              toFirestore: (model, _) => model.toJson())
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList());
      return Right(repositoryCategoriesOffer);
    } on FirebaseException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }
}

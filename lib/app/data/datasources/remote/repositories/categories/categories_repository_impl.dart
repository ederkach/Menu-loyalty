import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final FirebaseFirestore _firebaseFirestore;
  late List<Categories> repositoryCategories;

  CategoriesRepositoryImpl({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Either<ServerException, List<Categories>>> getCategory() async {
    try {
      final repositoryCategories = await _firebaseFirestore
          .collection('Categories')
          .orderBy('rank')
          .withConverter<Categories>(
              fromFirestore: (snapshot, _) => Categories.fromDocument(snapshot),
              toFirestore: (model, _) => model.toJson())
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList());
      return Right(repositoryCategories);
    } on FirebaseException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }
}

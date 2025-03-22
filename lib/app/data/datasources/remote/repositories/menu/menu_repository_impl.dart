import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

import 'menu_repository.dart';

class MenuRepositoryImpl extends MenuRepository {
  final FirebaseFirestore _firebaseFirestore;
  @override
  late List<MenuModel> repositoryMenu;

  MenuRepositoryImpl({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Either<ServerException, List<MenuModel>>> getMenu() async {
    try {
      repositoryMenu = await _firebaseFirestore
          .collection('Menu')
          .orderBy('rank')
          .withConverter<MenuModel>(
              fromFirestore: (snapshot, _) => MenuModel.fromDocument(snapshot),
              toFirestore: (model, _) => model.toJson())
          .get()
          .then((value) => value.docs.map((e) => e.data()).toList());
      return Right(repositoryMenu);
    } on FirebaseException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }
}

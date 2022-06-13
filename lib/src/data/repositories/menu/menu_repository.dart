import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../models/menu_model/menu_model.dart';
import 'base_menu_repository.dart';

class MenuRepository extends BaseMenuRepository {
  final FirebaseFirestore _firebaseFirestore;
  late List<MenuModel> repositoryMenu;

  MenuRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<Either<ServerException, List<MenuModel>>> getMenu() async {
    try {
      final repositoryMenu = await _firebaseFirestore
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

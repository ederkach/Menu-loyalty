import 'package:dartz/dartz.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/models/models.dart';

abstract class CartRepository {
  Future<Either<LocalException, Cart>> getCart();
  Future<Either<LocalException, Cart>> addMenuItem(MenuModel menuItem);
  Future<Either<LocalException, Cart>> removeMenuItem(MenuModel menuItem);
  Future<Either<LocalException, Cart>> clearCart();
}

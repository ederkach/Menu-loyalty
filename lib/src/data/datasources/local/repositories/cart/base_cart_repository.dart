import 'package:dartz/dartz.dart';

import '../../../../../core/error/exception.dart';
import '../../../../models/cart_model/cart_model.dart';
import '../../../../models/menu_model/menu_model.dart';

abstract class BaseCartRepository {
  Future<Either<LocalException, Cart>> getCart();
  Future<Either<LocalException, Cart>> addMenuItem(MenuModel menuItem);
  Future<Either<LocalException, Cart>> removeMenuItem(MenuModel menuItem);
  Future<Either<LocalException, Cart>> clearCart();
}

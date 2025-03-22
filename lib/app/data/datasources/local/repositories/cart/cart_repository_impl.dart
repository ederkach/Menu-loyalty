import 'package:dartz/dartz.dart';
import 'package:menu_loyalty/app/core/exception/exception.dart';
import 'package:menu_loyalty/app/data/models/models.dart';
import 'cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  Cart repositoryCart = Cart(menuItems: []);
  static const _delay = Duration(milliseconds: 100);

  @override
  Future<Either<LocalException, Cart>> getCart() {
    try {
      return Future.delayed(_delay, () => Right(repositoryCart));
    } catch (e) {
      return Future.delayed(
          _delay, () => Left(LocalException(message: e.toString())));
    }
  }

  @override
  Future<Either<LocalException, Cart>> addMenuItem(MenuModel menuItem) {
    try {
      final containsId = repositoryCart.menuItems.containsId(menuItem.id);
      if (containsId) {
        repositoryCart = Cart(
            menuItems: repositoryCart.menuItems
                .replaceWhere(
                  (element) => element.id == menuItem.id,
                  (value) => value.copyWith(quantity: value.quantity! + 1),
                )
                .toList());

        return Future.delayed(
          _delay,
          () => Right(repositoryCart),
        );
      }
      repositoryCart = Cart(
          menuItems: repositoryCart.menuItems
            ..add(menuItem.copyWith(quantity: 1)));
      return Future.delayed(
        _delay,
        () => Right(repositoryCart),
      );
    } catch (e) {
      return Future.delayed(
          _delay, () => Left(LocalException(message: e.toString())));
    }
  }

  @override
  Future<Either<LocalException, Cart>> removeMenuItem(MenuModel menuItem) {
    try {
      final containsId = repositoryCart.menuItems.containsId(menuItem.id);
      if (!containsId) {
        return Future.delayed(
          _delay,
          () => Right(repositoryCart),
        );
      }

      if (repositoryCart.menuItems
              .firstWhere((element) => element.id == menuItem.id)
              .quantity ==
          1) {
        repositoryCart = Cart(
          menuItems: List.from(repositoryCart.menuItems)
            ..removeWhere((element) => element.id == menuItem.id),
        );
      }
      repositoryCart = Cart(
        menuItems: repositoryCart.menuItems
            .replaceWhere(
              (element) => element.id == menuItem.id,
              (value) => value.copyWith(quantity: value.quantity! - 1),
            )
            .toList(),
      );

      return Future.delayed(
        _delay,
        () => Right(repositoryCart),
      );
    } catch (e) {
      return Future.delayed(
          _delay, () => Left(LocalException(message: e.toString())));
    }
  }

  @override
  Future<Either<LocalException, Cart>> clearCart() {
    try {
      repositoryCart = Cart(menuItems: []);
      return Future.delayed(
        _delay,
        () => Right(repositoryCart),
      );
    } catch (e) {
      return Future.delayed(
          _delay, () => Left(LocalException(message: e.toString())));
    }
  }
}
